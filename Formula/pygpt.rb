HOMEBREW_PYGPT_VERSION = "1.0.3"

class Pygpt < Formula
    desc "Command line tool for pygpt"
    homepage "https://github.com/shiro-46-call/pygpt"
    license "MIT"
    url "https://github.com/shiro-46-call/pygpt/releases/download/v1.0.3/pygpt-1.0.3.tar.gz"
    version HOMEBREW_PYGPT_VERSION
    sha256 "51a6470c72bcdd90625e01e7d7b974cff26a61cac96d55a893be4b90d01d3557" 

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
        assert_match "1.0.3", shell_output("#{bin}/pygpt --version")
    end
end

