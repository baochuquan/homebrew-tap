class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.8.0.tar.gz"
  sha256 "5527464507802aced412acbb7fa289b453ed18606a4da2e2cf16938f585477a3"

  depends_on "ruby"

  def install

    ENV["GEM_HOME"] = libexec

    system "gem", "build", "git-reviewer.gemspec"
    system "gem", "install", "git-reviewer", "-v", "0.8.0", "--install-dir", "#{libexec}"
    (bin/"git-reviewer").write_env_script libexec/"bin/git-reviewer", GEM_HOME: ENV["GEM_HOME"]

  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
