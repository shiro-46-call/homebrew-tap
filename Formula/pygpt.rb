HOMEBREW_PYGPT_VERSION = "1.0.0"

class Pygpt < Formula
    desc "Command line tool for pygpt"
    homepage "https://github.com/shiro-46-call/pygpt"
    license "MIT"
    url "https://github.com/shiro-46-call/pygpt/releases/download/v1.0.0/pygpt-1.0.0.tar.gz"
    version HOMEBREW_PYGPT_VERSION
    sha256 "946b3e451c06f85a02dddc3382da189e02e583806589f264b33cf72aa6a1941c" 
    depends_on "python@3.12"

    def install
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
