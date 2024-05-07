class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://rubygems.org/downloads/git-reviewer-0.1.0.gem"
  sha256 "3711d1aa8edcbdcae7c909322dbbcbcdd9f63262c3e7bfd2e01e4efc6d6ecef1"

  depends_on "ruby"

  def install
    system "gem", "install", "git-reviewer", "-v", "0.1.0", "--install-dir", libexec
    bin.install_symlink libexec/"bin/git-reviewer"
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
