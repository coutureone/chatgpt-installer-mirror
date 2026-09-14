#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 4 ]; then
  echo "Usage: $0 INSTALLER VERSION PLATFORM ARCH" >&2
  exit 2
fi

installer=$1
version=$2
platform=$3
arch=$4

if [ ! -f "$installer" ]; then
  echo "Installer not found: $installer" >&2
  exit 1
fi

command -v gh >/dev/null || { echo "GitHub CLI (gh) is required" >&2; exit 1; }

name="ChatGPT-${version}-${platform}-${arch}-$(basename "$installer")"
cp "$installer" "$name"
shasum -a 256 "$name" > "${name}.sha256"
gh release create "v${version}-${platform}-${arch}" "$name" "${name}.sha256" \
  --title "ChatGPT ${version} (${platform}/${arch})" \
  --notes "Unofficial convenience mirror of the official installer.\n\nOfficial source page: https://chatgpt.com/download/\nVerify the SHA-256 file before installation."
rm -f "$name" "${name}.sha256"
