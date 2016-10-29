class Sigar < Formula
  desc "System Information Gatherer And Reporter"
  homepage "http://sigar.hyperic.com/"
  # HEAD has up to date bindings that are actually useful.
  head "https://github.com/hyperic/sigar.git"

  option "with-perl", "Build Perl bindings"
  option "with-python", "Build Python bindings"
  option "with-ruby", "Build Ruby bindings"

  deprecated_option "perl" => "with-perl"
  deprecated_option "python" => "with-python"
  deprecated_option "ruby" => "with-ruby"

  def install
    # Build Java JAR & C library first.
    cd "bindings/java" do
      system "ant"

      prefix.install "sigar-bin/lib/sigar.jar"
      lib.install Dir["sigar-bin/lib/*.dylib"]
      include.install Dir["sigar-bin/include/*"]

      bin.write_jar_script prefix/"sigar.jar", "sigar"
    end

    # Install Python bindings
    cd "bindings/python" do
      system "python", "setup.py", "install", "--prefix=#{prefix}"
    end if build.with? "python"

    # Install Perl bindings
    cd "bindings/perl" do
      system "perl", "Makefile.PL"

      # Tweak the Makefile to install.
      # Can't pass PREFIX, as the Sigar build system uses ARGV[0]
      inreplace "Makefile" do |s|
        s.change_make_var! "PREFIX", prefix
        s.change_make_var! "PERLPREFIX", "$(PREFIX)"
        s.change_make_var! "SITEPREFIX", "$(PREFIX)"
        s.change_make_var! "VENDORPREFIX", "$(PREFIX)"
        s.change_make_var! "INSTALLPRIVLIB", "$(PERLPREFIX)\\1"
        s.change_make_var! "INSTALLSITELIB", "$(PERLPREFIX)\\1"
        s.change_make_var! "INSTALLVENDORLIB", "$(PERLPREFIX)\\1"
        s.change_make_var! "INSTALLARCHLIB", "$(PERLPREFIX)\\1"
        s.change_make_var! "INSTALLSITEARCH", "$(PERLPREFIX)\\1"
        s.change_make_var! "INSTALLVENDORARCH", "$(PERLPREFIX)\\1"
      end

      system "make", "install"
    end if build.with? "perl"

    # Install Ruby bindings
    cd "bindings/ruby" do
      system "ruby", "extconf.rb", "--prefix=#{prefix}"
      system "make", "install"
    end if build.with? "ruby"
  end
end
