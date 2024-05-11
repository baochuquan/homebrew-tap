class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.12.0.tar.gz"
  sha256 "7b5bbe1b9dd27435bb581f8adfef98fd73e7db5bfe2ba07ccbf88981c668a327"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "git-reviewer.gemspec"
    system "gem", "install", "--ignore-dependencies", "git-reviewer-#{version}.gem"
    (bin/"git-reviewer").write_env_script libexec/"bin/git-reviewer", GEM_HOME: ENV["GEM_HOME"]
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
