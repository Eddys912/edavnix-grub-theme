#!/bin/bash
# Convert SVG assets to PWA and favicons for the web
# Requires: imagemagick

set -euo pipefail

# Paths
SRC_FILE="../web/public/favicon.svg"
SRC_DIR="../web/public"
DEST_DIR="../web/public/icons"

# Colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
END='\033[0m'

# Status Prefixes
ERROR="${RED}ERROR  ${END}"
INFO="${YELLOW}INFO   ${END}"
SUCCESS="${GREEN}SUCCESS${END}"
EXEC="${CYAN}EXEC   ${END}"

echo -e "${EXEC} Executing 'web_generate_icons.sh' ${END}"

if [ ! -f "$SRC_FILE" ]; then
  echo -e "${ERROR} Source file not found at $SRC_FILE ${END}"
  exit 1
fi

mkdir -p "$DEST_DIR"

# Favicon
magick -density 300 -background none "$SRC_FILE" \
  -fill black -colorize 100% \
  -define icon:auto-resize=64,48,32,16 \
  "$SRC_DIR/favicon.ico" 2>/dev/null

if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate favicon.ico ${END}"
  exit 1
fi

SIZE=$(du -h "$SRC_DIR/favicon.ico" | cut -f1)
echo -e "${INFO} Generating favicon.ico $SIZE ${END}"

# Apple Touch Icon 180x180
magick -density 300 -background none "$SRC_FILE" \
  -fill '#1793d1' -colorize 100% \
  -background '#0f0f0f' -flatten \
  -resize 140x140 -gravity center -extent 180x180 \
  "$DEST_DIR/apple-touch-icon.png" 2>/dev/null

if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate apple-touch-icon.png ${END}"
  exit 1
fi

SIZE=$(du -h "$DEST_DIR/apple-touch-icon.png" | cut -f1)
echo -e "${INFO} Generating apple-touch-icon.png $SIZE ${END}"

# PWA 192x192
magick -density 300 -background none "$SRC_FILE" \
  -fill '#1793d1' -colorize 100% \
  -background '#0f0f0f' -flatten \
  -resize 140x140 -gravity center -extent 192x192 \
  "$DEST_DIR/pwa-192.png" 2>/dev/null

if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate pwa-192.png ${END}"
  exit 1
fi

SIZE=$(du -h "$DEST_DIR/pwa-192.png" | cut -f1)
echo -e "${INFO} Generating pwa-192.png $SIZE ${END}"

# PWA 512x512
magick -density 300 -background none "$SRC_FILE" \
  -fill '#1793d1' -colorize 100% \
  -background '#0f0f0f' -flatten \
  -resize 400x400 -gravity center -extent 512x512 \
  "$DEST_DIR/pwa-512.png" 2>/dev/null

if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate pwa-512.png ${END}"
  exit 1
fi

SIZE=$(du -h "$DEST_DIR/pwa-512.png" | cut -f1)
echo -e "${INFO} Generating pwa-512.png $SIZE ${END}"

TOTAL_SIZE=$(du -sh "$DEST_DIR" | cut -f1)
echo -e "${INFO} Total size: $TOTAL_SIZE saved to $DEST_DIR ${END}"
echo -e "${SUCCESS} Execution finished ${END}"
