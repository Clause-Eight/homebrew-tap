class PiiEu < Formula
  desc "Find EU personal data in code, fixtures and logs, confirmed by check digits"
  homepage "https://github.com/Clause-Eight/pii-eu"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Clause-Eight/pii-eu/releases/download/v0.2.0/pii-eu_0.2.0_darwin_arm64.tar.gz"
      sha256 "f1553ff31be4998d5ec07876cbeb84fbddd5bf3c70986f14d5865da01a137ffd"
    end
    on_intel do
      url "https://github.com/Clause-Eight/pii-eu/releases/download/v0.2.0/pii-eu_0.2.0_darwin_amd64.tar.gz"
      sha256 "b3ae62954f0a99b568ef97d72ee89a77c93915b1031db53873ff8c9ab64c55aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Clause-Eight/pii-eu/releases/download/v0.2.0/pii-eu_0.2.0_linux_arm64.tar.gz"
      sha256 "fe360e51568711ac67ecf3fee89f8c69baa65ec170bc86b7761a156c64127d1d"
    end
    on_intel do
      url "https://github.com/Clause-Eight/pii-eu/releases/download/v0.2.0/pii-eu_0.2.0_linux_amd64.tar.gz"
      sha256 "f55b77a84746be5b8ec45f902b871b19124e97732583771cb6e04b3d3490f6fc"
    end
  end

  def install
    bin.install "pii-eu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pii-eu version")
    (testpath/"clean.txt").write "nothing personal here\n"
    assert_match "No personal data found", shell_output("#{bin}/pii-eu scan --no-git #{testpath}")
  end
end
