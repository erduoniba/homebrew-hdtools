class Jesource < Formula
  desc "LLDB source code mapping tool for iOS development"
  homepage "https://github.com/erduoniba/jesource"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erduoniba/jesource/releases/download/1.0.1/jesource-v1.0.1-Darwin-arm64-binary-20250725_123253.tar.gz"
      sha256 "9743db35d068604a0f73b5aae116d03796ed84e3f7ddc2dc25ccfcf6da922a1a"
    end
  end

  def install
    # 从嵌套的二进制包中提取文件
    cd "jesource" do
      bin.install "jesource/jesource" => "jesource"
      
      # 安装文档
      if File.exist?("jesource/README.md")
        doc.install "jesource/README.md"
      end
      
      if File.exist?("jesource/BINARY_INFO.txt")
        doc.install "jesource/BINARY_INFO.txt"
      end
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
