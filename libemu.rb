class Libemu < Formula
  desc "C library for basic x86 emulation and shellcode detection"
  homepage "https://web.archive.org/web/20150812195102/http://libemu.carnivore.it/"
  head "http://git.carnivore.it/libemu.git"

  option "with-python", "Compile bindings for Python"

  deprecated_option "enable-python-bindings" => "with-python"

  depends_on "pkg-config" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    inreplace "Makefile.am" do |s|
      # Need to fix the static location of pkgconfigpath
      s.gsub! "/usr/lib/pkgconfig/", "#{lib}/pkgconfig/"
    end
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]
    args << "--enable-python-bindings" if build.with? "python"

    system "autoreconf", "-v", "-i"
    system "./configure", *args
    system "make", "install"
  end
end
