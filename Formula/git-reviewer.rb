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

    # 将 bin 目录下的可执行文件安装到 Formula 的 bin 目录下
     bin.install libexec/"bin/git-reviewer"

     # 设置环境变量，以确保 gem 可以在非默认 GEM_HOME 下被找到和执行
     bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"], GEM_PATH: ENV["GEM_HOME"])

     # 创建一个包装脚本，在运行实际的 git-reviewer 之前设置 $LOAD_PATH
    (bin/"git-reviewer").write <<~EOS
      #!/bin/bash
      GEM_HOME="#{libexec}"
      export GEM_HOME
      GEM_PATH="#{libexec}"
      export GEM_PATH

      RUBYLIB="#{libexec}/gems/git-reviewer-#{version}/lib"
      export RUBYLIB

      exec "#{libexec}/bin/git-reviewer" "$@"
    EOS
  end

  test do
    system "#{bin}/git-reviewer", "--version"
  end
end
