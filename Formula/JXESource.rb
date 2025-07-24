class Jxesource < Formula
  desc "LLDB source code mapping tool for iOS development"
  homepage "https://github.com/erduoniba/homebrew-hdtools"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erduoniba/homebrew-hdtools/archive/refs/tags/1.0.0.tar.gz"
      sha256 "82dade3dcab6571a11792217a7a905c6b5e48aec767fea763b659147e2c9acc6"
    end
  end

  def install
    bin.install "JXESource"
    
    # 安装文档
    if File.exist?("README.md")
      doc.install "README.md"
    end
    
    if File.exist?("BINARY_INFO.txt")
      doc.install "BINARY_INFO.txt"
    end
  end

  test do
    # 测试安装是否成功
    assert_match "JXESource 版本", shell_output("#{bin}/JXESource --version")
  end

  def caveats
    <<~EOS
      🎉 JXESource 已成功安装！
      
      使用方法:
      JXESource -m ModuleName -s /path/to/source -p /path/to/currentProject/Example/Pods/ --attach
      
      查看帮助:
      JXESource --help
      
      详细文档:
        https://github.com/erduoniba/homebrew-hdtools/tree/main/JXESource
    EOS
  end
end
