class Adept < Formula
  desc "Adaptive JPG Compressor"
  homepage "https://github.com/technopagan/adept-jpg-compressor"
  head "https://github.com/technopagan/adept-jpg-compressor.git"

  depends_on "imagemagick"
  depends_on "jpegoptim"
  depends_on "jpegrescan"

  def install
    bin.install "adept.sh"
  end
end
