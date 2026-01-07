#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
# Setup
# ─────────────────────────────────────────────

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

echo
echo "🚀 Installing dotfiles"
echo "📁 Source: $DOTFILES_DIR"
echo "📦 Backup: $BACKUP_DIR"
echo

# macOS guard
if [[ "$(uname)" != "Darwin" ]]; then
  echo "❌ This setup is intended for macOS only."
  exit 1
fi

mkdir -p "$BACKUP_DIR"
mkdir -p "$CONFIG_DIR"

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

backup_and_link() {
  local src="$1"
  local dest="$2"

  if [[ ! -e "$src" ]]; then
    echo "⚠️  Skipping (missing): $src"
    return
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "📦 Backing up: $dest"
    mkdir -p "$BACKUP_DIR/$(dirname "$dest")"
    mv "$dest" "$BACKUP_DIR/$dest"
  fi

  echo "🔗 Linking: $dest → $src"
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
}

# ─────────────────────────────────────────────
# Home-level dotfiles
# ─────────────────────────────────────────────

backup_and_link "$DOTFILES_DIR/zsh/zshrc"       "$HOME/.zshrc"
backup_and_link "$DOTFILES_DIR/zsh/zprofile"   "$HOME/.zprofile"

backup_and_link "$DOTFILES_DIR/yabai/yabairc"  "$HOME/.yabairc"
backup_and_link "$DOTFILES_DIR/skhd/skhdrc"    "$HOME/.skhdrc"

backup_and_link "$DOTFILES_DIR/borders/bordersrc" "$HOME/.bordersrc"

# ─────────────────────────────────────────────
# ~/.config-based tools
# ─────────────────────────────────────────────

backup_and_link "$DOTFILES_DIR/ghostty"    "$CONFIG_DIR/ghostty"
backup_and_link "$DOTFILES_DIR/neofetch"  "$CONFIG_DIR/neofetch"
backup_and_link "$DOTFILES_DIR/sketchybar" "$CONFIG_DIR/sketchybar"
backup_and_link "$DOTFILES_DIR/starship"  "$CONFIG_DIR/starship"
backup_and_link "$DOTFILES_DIR/tmux"      "$CONFIG_DIR/tmux"

# ─────────────────────────────────────────────
# Done
# ─────────────────────────────────────────────

echo
echo "✅ Dotfiles installed successfully."
echo
echo "📦 Backups saved to:"
echo "   $BACKUP_DIR"
echo
echo "⚠️ Manual steps still required:"
echo "  • Install Homebrew packages"
echo "  • Enable yabai scripting addition"
echo "  • Grant Accessibility permissions to yabai & skhd"
echo
echo "✨ Enjoy your Hyprland-inspired macOS rice."
echo
