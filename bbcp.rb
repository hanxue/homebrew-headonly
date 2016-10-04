class Bbcp < Formula
  desc "Point-to-point network file copy application"
  homepage "https://www.slac.stanford.edu/%7Eabh/bbcp"
  head "https://www.slac.stanford.edu/~abh/bbcp/bbcp.git"

  depends_on "openssl"

  def install
    %w[bin obj].each { |dir| (buildpath/dir).mkpath }
    system "make", "-C", "src", "Darwin"
    bin.install "bin/bbcp"
  end

  test do
    system "#{bin}/bbcp", "--help"
  end
end
