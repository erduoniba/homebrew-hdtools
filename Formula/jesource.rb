# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Jesource < Formula
  desc "LLDB source code mapping tool for iOS development"
  homepage "https://github.com/erduoniba/homebrewdist"
  version "1.0.0"
  url "https://github.com/erduoniba/homebrewdist/releases/download/1.0.0/jesource-v1.0.0-Darwin-arm64-binary-20250725_105414.tar.gz"
  sha256 "a28dbb383434acdb5700f02b6e9050d8151ce71a3e07beb1191bd49038ed770c"

  def install
    bin.install "jesource/jesource" "jesource"
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
