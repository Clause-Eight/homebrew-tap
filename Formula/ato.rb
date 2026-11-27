class Ato < Formula
  desc "Find EU personal data in code, fixtures and logs, confirmed by check digits"
  homepage "https://github.com/Clause-Eight/ato"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.1/ato_2.0.1_darwin_arm64.tar.gz"
      sha256 "c9a2916062526dffc23ee1c8e06494ddd63480fa07877e5c8ba7642b5f3ab957"
    end
    on_intel do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.1/ato_2.0.1_darwin_amd64.tar.gz"
      sha256 "78bbb8ae42f89e27f9615e81db8d34a95aaa26ae1eb8fe9fc89f117972417130"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.1/ato_2.0.1_linux_arm64.tar.gz"
      sha256 "abb19dd54f4034d7ced0d22ac76dd4228a46ef585e39a571da3fa22a55782786"
    end
    on_intel do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.1/ato_2.0.1_linux_amd64.tar.gz"
      sha256 "90ccfda7a38ac1b77a3cb797d48176ab3846e3fa5d2ee11521b7596c52e333ef"
    end
  end

  def install
    bin.install "ato"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ato version")
    (testpath/"clean.txt").write "nothing personal here\n"
    assert_match "No personal data found", shell_output("#{bin}/ato scan --no-git #{testpath}")
  end
end
