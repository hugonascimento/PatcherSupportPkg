#!/usr/bin/env bash
set -e

# Homebrew...
/usr/bin/xattr -rc Universal-Binaries || true
find Universal-Binaries -name .DS_Store -delete || true
hdiutil create -srcfolder Universal-Binaries tmp.dmg -volname "OpenCore Patcher Resources (Root Patching)" -fs HFS+ -ov -format UDRO -megabytes 4096
hdiutil convert -format ULMO tmp.dmg -o Universal-Binaries.dmg -passphrase password -encryption -ov
codesign -s "Apple Development: hugo_nascimento@icloud.com (68G826Q379)" Universal-Binaries.dmg
find . -name tmp.dmg -delete || true
# Generate SHA256 checksum
shasum -a 256 Universal-Binaries.dmg > sha256sum.txt