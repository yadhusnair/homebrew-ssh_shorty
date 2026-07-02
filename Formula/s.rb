class S < Formula
  desc "Fleet SSH management CLI — connect, broadcast, and monitor remote devices by nickname"
  homepage "https://github.com/yadhusnair/ssh_shorty"
  url "https://github.com/yadhusnair/ssh_shorty/archive/refs/tags/v20260714.tar.gz"
  sha256 "d6661256ef8ded515c821fa6c64e2051810a7a28375c131bdf4ec27bf2ed75a5"
  license "MIT"
  version "20260714"

  def install
    bin.install "s"
    bash_completion.install "completion.bash" => "s"
    zsh_completion.install "completion.zsh" => "_s"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/s --help")
  end
end
