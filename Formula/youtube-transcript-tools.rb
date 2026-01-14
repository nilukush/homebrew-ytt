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
    # Create virtualenv with pip (needed for dependency resolution)
    venv = virtualenv_create(libexec, "python3.11", system_site_packages: true, without_pip: false)

    # Install package with dependencies using pip directly
    # Note: We bypass std_pip_args to avoid --no-deps flag
    venv_root = libexec
    python = "python3.11"
    system venv_root/"bin/python", "-m", "pip", "install", "--verbose", buildpath

    # Link ONLY the ytt binary to Homebrew bin directory
    # This prevents conflicts with system Python and other packages
    bin.install_symlink venv_root/"bin/ytt"
  end

  test do
    system bin/"ytt", "--version"
  end
end
