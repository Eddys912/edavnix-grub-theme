#!/bin/bash
# Generate .pf2 fonts from .ttf for GRUB
# Requires: grub-mkfont

# Paths
SRC_DIR="../web/src/assets/fonts/SpaceMono-Regular.ttf"
DEST_DIR="../edavnix/fonts"
FONT_NAME="SpaceMono-Regular"

# Sizes required
SIZES=(12 14 16 24 32 48)

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

echo -e "${EXEC} Executing 'generate_fonts_grub.sh' ${END}"

if [ ! -f "$SRC_DIR" ]; then
  echo -e "${ERROR} Source font not found at $SRC_DIR ${END}"
  exit 1
fi

mkdir -p "$DEST_DIR"
rm -f "$DEST_DIR"/*.pf2

for SIZE in "${SIZES[@]}"; do
  FILE="$FONT_NAME-$SIZE.pf2"

  grub-mkfont -n "Space Mono Regular" -s "$SIZE" \
    -o "$DEST_DIR/$FILE" "$SRC_DIR" 2>/dev/null

  if [ $? -eq 0 ]; then
    SIZE_FILE=$(du -h "$DEST_DIR/$FILE" | cut -f1)
    echo -e "${INFO} Generating $FILE $SIZE_FILE ${END}"
  else
    echo -e "${ERROR} Failed to generate $FILE ${END}"
  fi
done

TOTAL_SIZE=$(du -sh "$DEST_DIR" | cut -f1)
echo -e "${INFO} Total size: $TOTAL_SIZE saved to $DEST_DIR ${END}"
echo -e "${SUCCESS} Execution finished ${END}"
