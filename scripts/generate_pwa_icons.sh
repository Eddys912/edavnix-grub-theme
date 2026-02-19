#!/bin/bash
# Generate PWA assets and favicons from SVG
# Requires: imagemagick

# Paths
SRC_FILE="../web/public/favicon.svg"
PUBLIC_DIR="../web/public"
ICONS_DIR="../web/public/icons"

# Colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
END='\033[0m'

# Status Prefixes
ERROR="${RED}ERROR  ${END}"
INFO="${YELLOW}INFO   ${END}"
SUCCESS="${GREEN}SUCCESS${END}"
EXEC="${CYAN}EXEC   ${END}"

echo -e "${EXEC} Executing 'generate_pwa_icons.sh' ${END}"

if [ ! -f "$SRC_FILE" ]; then
  echo -e "${ERROR} Source file not found at $SRC_FILE ${END}"
  exit 1
fi

mkdir -p "$ICONS_DIR"

# Favicon .ico (black)
magick -density 300 -background none "$SRC_FILE" \
  -fill black -colorize 100% \
  -define icon:auto-resize=64,48,32,16 \
  "$PUBLIC_DIR/favicon.ico" 2>/dev/null
if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate favicon.ico ${END}"
  exit 1
fi
SIZE=$(du -h "$PUBLIC_DIR/favicon.ico" | cut -f1)
echo -e "${INFO} Generating favicon.ico $SIZE ${END}"

# Favicon 32x32 (black)
magick -density 300 -background none "$SRC_FILE" \
  -fill black -colorize 100% \
  -filter Lanczos -resize 32x32 \
  -gravity center -extent 32x32 \
  "$ICONS_DIR/favicon-32x32.png" 2>/dev/null
if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate favicon-32x32.png ${END}"
  exit 1
fi
SIZE=$(du -h "$ICONS_DIR/favicon-32x32.png" | cut -f1)
echo -e "${INFO} Generating favicon-32x32.png $SIZE ${END}"

# Apple Touch Icon
magick -density 300 -background none "$SRC_FILE" \
  -fill '#1793d1' -colorize 100% \
  -background white -flatten \
  -resize 140x140 -gravity center -extent 180x180 \
  "$ICONS_DIR/apple-touch-icon.png" 2>/dev/null
if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate apple-touch-icon.png ${END}"
  exit 1
fi
SIZE=$(du -h "$ICONS_DIR/apple-touch-icon.png" | cut -f1)
echo -e "${INFO} Generating apple-touch-icon.png $SIZE ${END}"

# PWA 192x192
magick -density 300 -background none "$SRC_FILE" \
  -fill '#1793d1' -colorize 100% \
  -background white -flatten \
  -resize 150x150 -gravity center -extent 192x192 \
  "$ICONS_DIR/pwa-192x192.png" 2>/dev/null
if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate pwa-192x192.png ${END}"
  exit 1
fi
SIZE=$(du -h "$ICONS_DIR/pwa-192x192.png" | cut -f1)
echo -e "${INFO} Generating pwa-192x192.png $SIZE ${END}"

# PWA 512x512
magick -density 300 -background none "$SRC_FILE" \
  -fill '#1793d1' -colorize 100% \
  -background white -flatten \
  -resize 400x400 -gravity center -extent 512x512 \
  "$ICONS_DIR/pwa-512x512.png" 2>/dev/null
if [ $? -ne 0 ]; then
  echo -e "${ERROR} Failed to generate pwa-512x512.png ${END}"
  exit 1
fi
SIZE=$(du -h "$ICONS_DIR/pwa-512x512.png" | cut -f1)
echo -e "${INFO} Generating pwa-512x512.png $SIZE ${END}"

TOTAL_SIZE=$(du -sh "$ICONS_DIR" | cut -f1)
echo -e "${INFO} Total size: $TOTAL_SIZE saved to $ICONS_DIR ${END}"
echo -e "${SUCCESS} Execution finished ${END}"
