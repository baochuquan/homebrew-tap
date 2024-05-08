class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0edf69499dc38d2a0b8e2fcad2e6ee0efa5955866b02da2646a390c35699b6c5"

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
