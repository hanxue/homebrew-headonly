class QtMobility < Formula
  desc "Suite of Qt APIs for supporting mobile device functionality"
  homepage "https://code.qt.io/cgit/qt-mobility/qt-mobility.git/"
  head "https://code.qt.io/qt-mobility/qt-mobility.git"

  depends_on "qt"

  def install
    system "./configure", "-release",
                          "-prefix", prefix,
                          "-qmake-exec", "#{HOMEBREW_PREFIX}/bin/qmake"
    system "make"
    ENV.j1
    system "make", "install"

    # Move all .apps out of the "bin/" and into the prefix (like qt formula)
    prefix.install Dir[bin/"*.app"]
  end
end
