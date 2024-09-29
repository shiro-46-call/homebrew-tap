HOMEBREW_PYGPT_VERSION = "1.0.2"

class Pygpt < Formula
    desc "Command line tool for pygpt"
    homepage "https://github.com/shiro-46-call/pygpt"
    license "MIT"
    url "https://github.com/shiro-46-call/pygpt/releases/download/v1.0.2/pygpt-1.0.2.tar.gz"
    version HOMEBREW_PYGPT_VERSION
    sha256 "3a61a79a32900a751374126e0684178d44b8f91c68122d9dde00e076154f23f0" 

    def install
        prefix.install "README.md"
        prefix.install "LICENSE"
        prefix.install "install.sh"

        (prefix/"program").install "program/Example.py"
        (prefix/"program").install "program/Logger.py"
        (prefix/"program/Model").install Dir["program/Model/*"]
        (prefix/"program/View").install Dir["program/View/*"]
        (prefix/"program/bin").install Dir["program/bin/*"]

        bin.install_symlink "#{prefix}/program/bin/pygpt"
    end

    def post_install
        system "bash", "#{prefix}/install.sh"
    end

    test do
        assert_match "1.0.2", shell_output("#{bin}/pygpt --version")
    end
end

