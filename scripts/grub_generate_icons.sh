#!/bin/bash
# Convert Astro component SVG icons to PNG for GRUB
# Requires: imagemagick

set -euo pipefail

# Paths
SRC_DIR="../web/src/icons/distros"
DEST_DIR="../edavnix/icons"

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

echo -e "${EXEC} Executing 'grub_generate_icons.sh' ${END}"

if [ ! -d "$SRC_DIR" ]; then
  echo -e "${ERROR} Source directory not found at $SRC_DIR ${END}"
  exit 1
fi

mkdir -p "$DEST_DIR"

for img in "$SRC_DIR"/*.astro; do
  if [ -f "$img" ]; then
    filename=$(basename "$img")
    name="${filename%.astro}"
    name_lowercase="${name,,}"
    FILE="$name_lowercase.png"

    magick -density 300 -background none "$img" \
      -fill white -colorize 100% \
      -filter Lanczos -resize 48x48 \
      -gravity center -extent 64x64 \
      "$DEST_DIR/$FILE" 2>/dev/null

    if [ $? -eq 0 ]; then
      SIZE=$(du -h "$DEST_DIR/$FILE" | cut -f1)
      echo -e "${INFO} Generating $FILE $SIZE ${END}"
    else
      echo -e "${ERROR} Failed to generate $FILE ${END}"
    fi
  fi
done

TOTAL_SIZE=$(du -sh "$DEST_DIR" | cut -f1)
echo -e "${INFO} Total size: $TOTAL_SIZE saved to $DEST_DIR ${END}"
echo -e "${SUCCESS} Execution finished ${END}"
