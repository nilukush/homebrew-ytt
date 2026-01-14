# typed: true
# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                https://rubydoc.info/github/Homebrew/brew/master/Formul

class YoutubeTranscriptTools < Formula
  include Language::Python::Virtualenv

  desc "YouTube Transcript Fetcher - Web UI and CLI"
  homepage "https://github.com/nilukush/youtube-transcript"
  url "https://files.pythonhosted.org/packages/76/a3/092cfee25cc79d8be1798990ce090ae48a57070b277e82cdd0e4744fe8fb/youtube_transcript_tools-0.1.0.tar.gz"
  sha256 "21b7ff1c7351c04547894fcd9ecf5cb602db0b1ff7a1d1f0d6928ffeb243da94"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"ytt", "--version"
  end
end
