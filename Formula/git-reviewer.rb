class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.4.0.tar.gz"
  sha256 "499367cd60754176e5e5a86e60e7bd19276a94bc8bceaad19ec2478f41775e48"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "git-reviewer.gemspec"
    system "gem", "install", "git-reviewer-#{version}.gem"
    bin.install libexec/"bin/git-reviewer"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
