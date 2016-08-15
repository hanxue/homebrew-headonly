require "language/go"

class Httpdiff < Formula
  desc "Compare two HTTP(S) responses"
  homepage "https://github.com/jgrahamc/httpdiff"
  head "https://github.com/jgrahamc/httpdiff.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "#{bin}/httpdiff"
  end

  test do
    system bin/"httpdiff", "http://brew.sh", "http://brew.sh"
  end
end
