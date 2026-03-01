#!/bin/bash
# Convert PNG themes (1920x1080) to WebP for the web
# Requires: imagemagick

set -euo pipefail

# Paths
SRC_DIR="../themes"
DEST_DIR="../web/src/assets/themes"

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

echo -e "${EXEC} Executing 'web_generate_webp.sh' ${END}"

if [ ! -d "$SRC_DIR" ]; then
  echo -e "${ERROR} Source directory not found at $SRC_DIR ${END}"
  exit 1
fi

mkdir -p "$DEST_DIR"

# Process each PNG file
for img in "$SRC_DIR"/*.png; do
  if [ -f "$img" ]; then
    filename=$(basename "$img")
    name="${filename%.png}"
    name_lowercase="${name,,}"
    FILE="$name_lowercase.webp"

    magick "$img" -resize 1920x1080^ -gravity center -extent 1920x1080 \
      -quality 100 "$DEST_DIR/$FILE" 2>/dev/null

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
