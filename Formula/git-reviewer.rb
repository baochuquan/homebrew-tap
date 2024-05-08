class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://rubygems.org/downloads/git-reviewer-0.4.0.gem"
  sha256 "4fae7b2aea5352fd7bd759a2073a5f501ac18d8d9845025ed2d1128a4734bc89"

  depends_on "ruby"

  def install
    system "gem", "install", "git-reviewer-0.4.0.gem"
    bin.install_symlink Dir["#{libexec}/gems/git-reviewer-0.4.0/bin/*"]
    # ENV["GEM_HOME"] = libexec
    # system "gem", "build", "git-reviewer.gemspec"
    # system "gem", "install", "git-reviewer-#{version}.gem"

    # # 将 bin 目录下的可执行文件安装到 Formula 的 bin 目录下
    #  bin.install libexec/"bin/git-reviewer"

    #  # 设置环境变量，以确保 gem 可以在非默认 GEM_HOME 下被找到和执行
    #  bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"], GEM_PATH: ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
