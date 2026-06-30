class S < Formula
  desc "Fleet SSH management CLI — connect, broadcast, and monitor remote devices by nickname"
  homepage "https://github.com/yadhusnair/ssh_shorty"
  url "https://github.com/yadhusnair/ssh_shorty/archive/refs/tags/v20260701.tar.gz"
  sha256 "8db86c34195088cbb51204085b6893e8b300ace9acb3d77bb14deec9810f1bb9"
  license "MIT"
  version "20260701"

  def install
    bin.install "s"
    bash_completion.install "completion.bash" => "s"
    zsh_completion.install "completion.zsh" => "_s"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/s --help")
  end
end
