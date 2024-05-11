class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.9.0.tar.gz"
  sha256 "223d41af9edf9aee8128a65280a77ddb4bfa26841535234a5a9b4d16048c8656"

  depends_on "ruby"

  resource "claide" do
    url "https://rubygems.org/downloads/claide-1.0.3.gem"
    sha256 "1fbc84bad66bbde2058d13875f73a25fd1d252fa1620837563cf11a1abee5a4d"
  end

  resource "terminal-table" do
    url "https://rubygems.org/downloads/terminal-table-3.0.2.gem"
    sha256 "f951b6af5f3e00203fb290a669e0a85c5dd5b051b3b023392ccfd67ba5abae91"
  end

  def install
    ENV["GEM_HOME"] = libexec
    resources.each do |r|
      r.fetch
      system "gem", "install", r.cached_download, "--ignore-dependencies",
             "--no-document", "--install-dir", libexec
    end
    system "gem", "build", "git-reviewer.gemspec"
    system "gem", "install", "--ignore-dependencies", "git-reviewer-#{version}.gem"
    (bin/"git-reviewer").write_env_script libexec/"bin/git-reviewer", GEM_HOME: ENV["GEM_HOME"]
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
