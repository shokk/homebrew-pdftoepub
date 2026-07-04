# Formula/pdftoepub.rb — part of github.com/shokk/homebrew-pdftoepub
#
# Users install with:
#   brew tap shokk/pdftoepub
#   brew install pdftoepub

class Pdftoepub < Formula
  include Language::Python::Virtualenv

  desc "Convert a PDF to a pixel-perfect fixed-layout EPUB"
  homepage "https://github.com/shokk/homebrew-pdftoepub"
  url "https://github.com/shokk/homebrew-pdftoepub/archive/refs/tags/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "5d5e430395a3605cb81d99c14be92c51dc090e6a108b8a859b7e18ec8671b4a5"
  license "MIT"

  depends_on "poppler"
  depends_on "python@3"

  resource "pdf2image" do
    url "https://files.pythonhosted.org/packages/00/d8/b280f01045555dc257b8153c00dee3bc75830f91a744cd5f84ef3a0a64b1/pdf2image-1.17.0.tar.gz"
    sha256 "eaa959bc116b420dd7ec415fcae49b98100dda3dd18cd2fdfa86d09f112f6d57"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9/pillow-12.3.0.tar.gz"
    sha256 "3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    libexec.install "pdftoepub"
    (bin/"pdftoepub").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python3" "#{libexec}/pdftoepub" "$@"
    EOS
  end

  test do
    assert_match "usage:", shell_output("#{bin}/pdftoepub --help 2>&1", 0)
  end
end
