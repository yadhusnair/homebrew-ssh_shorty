class S < Formula
  desc "Fleet SSH management CLI — connect, broadcast, and monitor remote devices by nickname"
  homepage "https://github.com/yadhusnair/ssh_shorty"
  url "https://github.com/yadhusnair/ssh_shorty/archive/refs/tags/v20260925.tar.gz"
  sha256 "425ad5df98fab3069c1497e36e46982ba3195f1d362159a3c8a3c81a0a63100c"
  license "MIT"
  version "20260925"

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
