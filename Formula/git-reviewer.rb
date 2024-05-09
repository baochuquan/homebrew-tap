class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.5.0.tar.gz"
  sha256 "f77c0f56c81fa0c9324853d591b8cc2ac6ce122cf5a5f5cf08ada0bceefb8659"

  depends_on "ruby"

  def install

    ENV["GEM_HOME"] = libexec
    system "gem", "build", "git-reviewer.gemspec"
    system "gem", "install", "--ignore-dependencies", "git-reviewer-#{version}.gem"
    (bin/"git-reviewer").write_env_script libexec/"bin/git-reviewer", GEM_HOME: ENV["GEM_HOME"]

    # # 安装gem到libexec目录
    # system "gem", "install", "git-reviewer", "-v", "0.4.0", "--install-dir", "#{libexec}"
    # # 创建环境脚本指向gem bin目录下的执行文件
    # bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])



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
