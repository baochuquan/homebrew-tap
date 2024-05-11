class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.10.0.tar.gz"
  sha256 "37d142edfd9b861bbd3d77017b032321a812dfdcf8727c346978b915ddcea980"

  depends_on "ruby"

  resource "claide" do
    url "https://rubygems.org/downloads/claide-1.1.0.gem"
    sha256 "6d3c5c089dde904d96aa30e73306d0d4bd444b1accb9b3125ce14a3c0183f82e"
  end

  resource "terminal-table" do
    url "https://rubygems.org/downloads/terminal-table-3.0.2.gem"
    sha256 "f951b6af5f3e00203fb290a669e0a85c5dd5b051b3b023392ccfd67ba5abae91"
  end

  resource "unicode-display_width" do
    url "https://rubygems.org/downloads/unicode-display_width-2.5.0.gem"
    sha256 "7e7681dcade1add70cb9fda20dd77f300b8587c81ebbd165d14fd93144ff0ab4"
  end

  resource "claide-plugins" do
    url "https://rubygems.org/downloads/claide-plugins-0.9.2.gem"
    sha256 "c7ea78bc067ab23bce8515497cdcdcb8f01c86dadfbe13c44644e382922c1c2e"
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
