class S < Formula
  desc "Fleet SSH management CLI — connect, broadcast, and monitor remote devices by nickname"
  homepage "https://github.com/yadhusnair/ssh_shorty"
  url "https://github.com/yadhusnair/ssh_shorty/archive/refs/tags/v20260922.tar.gz"
  sha256 "9c24dab15966982d1df635f82a6c5defb848395dd66d165cb66a861991edead9"
  license "MIT"
  version "20260922"

  def install
    bin.install "s"
    bash_completion.install "completion.bash" => "s"
    zsh_completion.install "completion.zsh" => "_s"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/s --help")
  end
end
