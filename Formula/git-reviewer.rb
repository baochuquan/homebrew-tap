class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.14.0.tar.gz"
  sha256 "566ac2de95413efbd1d9d8b46149bca450d271348a149064df1b2bfc5a45b1cde"

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
