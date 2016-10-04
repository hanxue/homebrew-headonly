class GitHg < Formula
  desc "Scripts for tracking a Mercurial project from Git"
  homepage "http://offbytwo.com/git-hg/"
  head "https://github.com/cosmin/git-hg.git"

  depends_on :hg

  def install
    prefix.install Dir["*"]
  end

  test do
    shell_output(bin/"git-hg --help", 1)
  end
end
