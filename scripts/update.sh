#!/bin/bash

# ==============================================================================
# Colors for output
# ==============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ==============================================================================
# Global Variables
# ==============================================================================
VERBOSE=0 # Default verbosity

# ==============================================================================
# Trap Function for Interrupt Handling
# ==============================================================================
trap_interrupt() {
  echo -e "\n${RED}❌ Update Process Interrupted!${NC}\n"
  exit 1
}

# ==============================================================================
# Update Functions
# ==============================================================================

update_system() {
  trap trap_interrupt SIGINT

  if [ "$VERBOSE" -eq 1 ]; then
    echo -e "\n${YELLOW}📦 Updating System Packages...${NC}"
  fi

  if ! sudo dnf -y upgrade --refresh; then
    echo -e "\n${RED}❌ System Update Failed!${NC}\n"
    exit 1
  fi

  if [ "$VERBOSE" -eq 1 ]; then
    echo -e "\n${GREEN}✅ System Update Complete!${NC}\n"
  fi
}

update_flatpaks() {
  trap trap_interrupt SIGINT

  if [ "$VERBOSE" -eq 1 ]; then
    echo -e "\n${YELLOW}📦 Updating Flatpaks...${NC}"
  fi

  if ! flatpak update -y; then
    echo -e "\n${RED}❌ Flatpak Update Failed!${NC}\n"
    exit 1
  fi

  if [ "$VERBOSE" -eq 1 ]; then
    echo -e "\n${GREEN}✅ Flatpak Update Complete!${NC}\n"
  fi
}

update_bin() {
  trap trap_interrupt SIGINT

  if [ "$VERBOSE" -eq 1 ]; then
    echo -e "\n${YELLOW}🛠️ Updating Bin Scripts...${NC}"
  fi

  if ! bin update; then
    echo -e "\n${RED}❌ Bin Update Failed!${NC}\n"
    exit 1
  fi

  if [ "$VERBOSE" -eq 1 ]; then
    echo -e "\n${GREEN}✅ Bin Update Complete!${NC}\n"
  fi
}

# ==============================================================================
# Helper Functions
# ==============================================================================

usage() {
  cat <<EOF

Usage: update [command]

Options:
  -h, --help      Show this help message and exit
  -v, --verbose   Show verbose output

Commands:
  system          Update system packages only
  flatpaks        Update Flatpaks only
  bin             Update bin scripts only
  all             Update everything (default if no command given)

Examples:
  update -v all       Update everything with verbose output
  update system       Update system packages only

EOF
}

# ==============================================================================
# Main Script Logic
# ==============================================================================

while [[ $# -gt 0 ]]; do
  case "$1" in
  -h | --help)
    usage
    exit 0
    ;;

  -v | --verbose)
    VERBOSE=1
    shift
    ;;

  system)
    update_system
    exit 0
    ;;

  flatpaks)
    update_flatpaks
    exit 0
    ;;

  bin)
    update_bin
    exit 0
    ;;

  all)
    update_system
    update_flatpaks
    update_bin
    exit 0
    ;;

  *)
    echo -e "\n${RED}❌ Error: Unknown command '$1'${NC}\n"
    usage
    exit 1
    ;;
  esac
done

# Default behavior if no command is given
if [[ $# -eq 0 ]]; then
  update_system
  update_flatpaks
  update_bin
fi

exit 0
