#!/usr/bin/env bash
# Automated 1-Click Updater for Antigravity Skills (Linux / macOS)
# Usage: bash update.sh

set -e

echo -e "\033[0;36m====================================================\033[0m"
echo -e "\033[0;36m    Updating Skills for Google Antigravity          \033[0m"
echo -e "\033[0;36m====================================================\033[0m"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Fetch latest changes if this is a Git clone
if [ -d "$SCRIPT_DIR/.git" ]; then
    echo -e "\033[0;33m-> Checking for latest commits on GitHub...\033[0m"
    git -C "$SCRIPT_DIR" pull --rebase || true
fi

# 2. Run installer script to copy/overwrite into ~/.gemini/config/
bash "$SCRIPT_DIR/install.sh"

echo -e "\n\033[0;32m🔄 All skills and rules updated successfully on your machine!\033[0m"
echo "👉 Tip: Open a New Chat in Antigravity to load the latest changes."
