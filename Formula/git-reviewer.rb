class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://rubygems.org/downloads/git-reviewer-0.1.0.gem"
  sha256 "3711d1aa8edcbdcae7c909322dbbcbcdd9f63262c3e7bfd2e01e4efc6d6ecef1"

  depends_on "ruby" => :recommended

  if install
    system "gem", "install", "git-reviewer-0.1.0.gem"
    bin.install_symlink Dir["#{libexec}/gems/git-reviewer-0.1.0/bin/*"]
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
