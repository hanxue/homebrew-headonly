require 'formula'

class Tinyxml2 < Formula
  head 'https://github.com/leethomason/tinyxml2.git'
  homepage 'http://www.grinninglizard.com/tinyxml2/index.html'

  def install
    system "cmake", ".", *std_cmake_args
    system 'make', 'install'
    libexec.install Dir['tinyxml2/*']
  end
end
