class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.13.0.tar.gz"
  sha256 "4a27b216bca2f0359994a8cc91763b040b779e294fffcaba2406e526df033284"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "git-reviewer.gemspec"
    system "gem", "install", "git-reviewer-#{version}.gem"
    (bin/"git-reviewer").write_env_script libexec/"bin/git-reviewer", GEM_HOME: ENV["GEM_HOME"]

    man1.install "share/git-reviewer.1"  # 假设 `git-reviewer.1` 存在于源码的 `man` 目录下
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
