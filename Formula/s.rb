class S < Formula
  desc "Fleet SSH management CLI — connect, broadcast, and monitor remote devices by nickname"
  homepage "https://github.com/yadhusnair/ssh_shorty"
  url "https://github.com/yadhusnair/ssh_shorty/archive/refs/tags/v20260915.tar.gz"
  sha256 "1cbc18345daf68378519d8d1f2e7a8a5560f8bbbf6692ac9c57941971ae91b7a"
  license "MIT"
  version "20260915"

  def install
    bin.install "s"
    bash_completion.install "completion.bash" => "s"
    zsh_completion.install "completion.zsh" => "_s"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/s --help")
  end
end
