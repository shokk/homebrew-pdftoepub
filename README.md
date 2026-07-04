# homebrew-pdftoepub

Homebrew tap for [pdftoepub](https://github.com/shokk/pdf-to-epub) — convert a PDF to a pixel-perfect fixed-layout EPUB.

## Install

```bash
brew tap shokk/pdftoepub
brew install pdftoepub
```

## Usage

```bash
pdftoepub input.pdf [output.epub] [--dpi 150] [--quality 90] [--png]
```

## Requirements

`poppler` is installed automatically as a Homebrew dependency.
