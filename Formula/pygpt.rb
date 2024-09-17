# coding: utf-8
HOMEBREW_PYGPT_VERSION = "1.0.0"

class Pygpt < Formula
    desc "Command line tool for pygpt"
    homepage "https://github.com/shiro-46-call/pygpt"
    license "MIT"
    url "https://github.com/shiro-46-call/pygpt/releases/download/v1.0.0/pygpt-1.0.0.tar.gz"
    version HOMEBREW_PYGPT_VERSION
    sha256 "a2dd2d3edbc6df3e353168d073b251e5924ef51c595142608a1806f639e6d46f" 
    depends_on "python@3.12"

    def install
        prefix.install "README.md"
        prefix.install "LICENSE"
        prefix.install "program"
        prefix.install "Model"
        prefix.install "View"
        prefix.install "Logger.py"
        prefix.install "Api.py"
        prefix.install "Compile.py"
        prefix.install "Example.py"
        prefix.install "Model.py"
        prefix.install "install.sh"
        bin.install "bin/pygpt"
    end

    def post_install
        system "bash", "#{prefix}/install.sh"
    end

    test do
        assert_match "1.0.0", shell_output("#{bin}/pygpt --version")
    end
end
