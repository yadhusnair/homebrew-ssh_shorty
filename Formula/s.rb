class S < Formula
  desc "Fleet SSH management CLI — connect, broadcast, and monitor remote devices by nickname"
  homepage "https://github.com/yadhusnair/ssh_shorty"
  url "https://github.com/yadhusnair/ssh_shorty/archive/refs/tags/v20260924.tar.gz"
  sha256 "eecd045715edeb41f8cbf7db31a450cf69396f2b26df71aa4b557861cec74743"
  license "MIT"
  version "20260924"

  # s uses mapfile / ${var,,} / local -n, all bash 4+ only — macOS's
  # stock /bin/bash is 3.2, so pin the shebang to this dependency's bash
  # rather than relying on PATH order at run time.
  depends_on "bash"

  def install
    bin.install "s"
    inreplace bin/"s", "#!/usr/bin/env bash", "#!#{Formula["bash"].opt_bin}/bash"
    bash_completion.install "completion.bash" => "s"
    zsh_completion.install "completion.zsh" => "_s"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/s --help")
  end
end
