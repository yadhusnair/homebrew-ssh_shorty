class S < Formula
  desc "Fleet SSH management CLI — connect, broadcast, and monitor remote devices by nickname"
  homepage "https://github.com/yadhusnair/ssh_shorty"
  url "https://github.com/yadhusnair/ssh_shorty/archive/refs/tags/v20260927.tar.gz"
  sha256 "2e5d67d6a1be645fdd8a393569afdfc2112e0e15bdc44b7257c5850d8c15d794"
  license "MIT"
  version "20260927"

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
