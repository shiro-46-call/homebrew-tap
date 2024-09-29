HOMEBREW_PYGPT_VERSION = "1.0.1"

class Pygpt < Formula
    desc "Command line tool for pygpt"
    homepage "https://github.com/shiro-46-call/pygpt"
    license "MIT"
    url "https://github.com/shiro-46-call/pygpt/releases/download/v.1.0.1/pygpt-1.0.1.tar.gz"
    version HOMEBREW_PYGPT_VERSION
    sha256 "fcb4ad78589883828813d61edb464298f097d70cbe7a6adb2d1b280a4b579c97" 

    def install
        prefix.install "README.md"
        prefix.install "LICENSE"
        prefix.install "install.sh"
        prefix.install "program"
        prefix.install "program/Example.py"
        prefix.install "program/Logger.py"

        (prefix/"program").install "program/Example.py"
        (prefix/"program").install "program/Logger.py"
        (prefix/"program/Model").install Dir["program/Model/*"]
        (prefix/"program/View").install Dir["program/View/*"]
        (prefix/"program/bin").install "program/bin/*"

        bin.install_symlink "#{prefix}/program/bin/pygpt"
    end

    def post_install
        system "bash", "#{prefix}/install.sh"
    end

    test do
        assert_match "1.0.1", shell_output("#{bin}/pygpt --version")
    end
end

