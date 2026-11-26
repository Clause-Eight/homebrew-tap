class Ato < Formula
  desc "Find EU personal data in code, fixtures and logs, confirmed by check digits"
  homepage "https://github.com/Clause-Eight/ato"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.0/ato_2.0.0_darwin_arm64.tar.gz"
      sha256 "3eb2438b335e63f6f8d5b8c342edad8ad39926e802d3b1cb55dbf6e906ec53f8"
    end
    on_intel do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.0/ato_2.0.0_darwin_amd64.tar.gz"
      sha256 "d56eb098f58bfe58084a6fb6758505695841a09520fef780551d8d9c48987c22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.0/ato_2.0.0_linux_arm64.tar.gz"
      sha256 "e8bcad1a985c31850cb79dcd1fe77cbf234f45cdae11035917213eb7cb7fb9ff"
    end
    on_intel do
      url "https://github.com/Clause-Eight/ato/releases/download/v2.0.0/ato_2.0.0_linux_amd64.tar.gz"
      sha256 "5eb3c1c590a2b6714935caff74262a33d37b0764aaec79d283618077669e1b87"
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
