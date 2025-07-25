class Jesource < Formula
  desc "LLDB source code mapping tool for iOS development"
  homepage "https://github.com/erduoniba/homebrewdist"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erduoniba/jesource/releases/download/1.0.0/jesource-v1.0.0-Darwin-arm64-binary-20250725_105414.tar.gz"
      sha256 "a28dbb383434acdb5700f02b6e9050d8151ce71a3e07beb1191bd49038ed770c"
    end
  end

  def install
    # 处理可能的目录结构
    if File.exist?("jesource/jesource")
      bin.install "jesource/jesource" => "jesource"
    elsif File.exist?("jesource")
      bin.install "jesource" => "jesource"
    else
      # 查找可执行文件
      jesource_file = Dir.glob("**/jesource").find { |f| File.executable?(f) }
      if jesource_file
        bin.install jesource_file => "jesource"
      else
        odie "Could not find jesource executable"
      end
    end
    
    # 安装文档
    if File.exist?("jesource/README.md")
      doc.install "jesource/README.md"
    end
    
    if File.exist?("jesource/BINARY_INFO.txt")
      doc.install "jesource/BINARY_INFO.txt"
    end
  end

  test do
    # 测试安装是否成功
    assert_match "jesource", shell_output("#{bin}/jesource --help")
  end

  def caveats
    <<~EOS
      🎉 jesource 已成功安装！
      
      使用方法:
      jesource -m ModuleName -s /path/to/source -p /path/to/currentProject/Example/Pods/ --attach
      
      查看帮助:
      jesource --help
      
      详细文档:
        https://github.com/erduoniba/homebrewdist/tree/main/jesource
    EOS
  end
end
