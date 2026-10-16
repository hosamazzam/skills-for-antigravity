#!/usr/bin/env bash
# Automated Installer for Antigravity Skills (Linux / macOS)
# Usage: bash install.sh

set -e

echo -e "\033[0;36m====================================================\033[0m"
echo -e "\033[0;36m   Installing Skills for Google Antigravity (Unix)  \033[0m"
echo -e "\033[0;36m====================================================\033[0m"

TARGET_CONFIG_DIR="$HOME/.gemini/config"
TARGET_SKILLS_DIR="$TARGET_CONFIG_DIR/skills"
TARGET_GLOBAL_RULE="$TARGET_CONFIG_DIR/GEMINI.md"

mkdir -p "$TARGET_SKILLS_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for skill in "$SCRIPT_DIR"/skills/*; do
    if [ -d "$skill" ]; then
        skill_name="$(basename "$skill")"
        echo -e "\033[0;32m-> Installing skill: [$skill_name]...\033[0m"
        cp -r "$skill" "$TARGET_SKILLS_DIR/"
    fi
done

if [ -f "$SCRIPT_DIR/GEMINI.md" ]; then
    if [ ! -f "$TARGET_GLOBAL_RULE" ]; then
        echo -e "\033[0;32m-> Creating global rules file: $TARGET_GLOBAL_RULE...\033[0m"
        cp "$SCRIPT_DIR/GEMINI.md" "$TARGET_GLOBAL_RULE"
    else
        echo -e "\033[0;33m-> Target GEMINI.md exists. Checking for updates...\033[0m"
        if ! grep -q "usage-report" "$TARGET_GLOBAL_RULE"; then
            echo -e "\033[0;32m-> Appending rules to GEMINI.md...\033[0m"
            echo -e "\n" >> "$TARGET_GLOBAL_RULE"
            cat "$SCRIPT_DIR/GEMINI.md" >> "$TARGET_GLOBAL_RULE"
        else
            echo -e "\033[0;90m-> GEMINI.md already contains usage rules. Updated!\033[0m"
        fi
    fi
fi

echo -e "\n\033[0;36m✅ Successfully installed all skills!\033[0m"
echo "You can now use /usage and /session-summary in any Antigravity conversation."
