class GitReviewer < Formula
  desc "git plugin for code review analyze"
  homepage "https://github.com/baochuquan/git-reviewer"
  url "https://github.com/baochuquan/git-reviewer/archive/refs/tags/0.7.0.tar.gz"
  sha256 "e6ad2a0f4766011cd059196cad03930a5ec1b290ad79283796f28815d20eaa03"

  depends_on "ruby"

  def install

    ENV["GEM_HOME"] = libexec

    system "gem", "build", "git-reviewer.gemspec"
    system "gem", "install", "git-reviewer", "-v", "0.7.0", "--install-dir", "#{libexec}"
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
