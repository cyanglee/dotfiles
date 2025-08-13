#!/bin/bash

# Dotfiles Restore Script
# Run this script on a new machine to restore configurations

set -e

echo "🔧 Starting dotfiles restoration..."

# Create backup directory for existing configs
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "📦 Created backup directory: $BACKUP_DIR"

# Function to backup existing file/directory if it exists
backup_if_exists() {
    if [[ -e "$1" ]]; then
        echo "💾 Backing up existing $1"
        mv "$1" "$BACKUP_DIR/"
    fi
}

# Restore .config directories
echo "⚙️  Restoring .config directories..."
mkdir -p ~/.config

if [[ -d "./config_ghostty" ]]; then
    backup_if_exists ~/.config/ghostty
    cp -r ./config_ghostty ~/.config/ghostty
    echo "✅ Restored ghostty config"
fi

if [[ -d "./config_nvim" ]]; then
    backup_if_exists ~/.config/nvim
    cp -r ./config_nvim ~/.config/nvim
    echo "✅ Restored nvim config"
fi

if [[ -d "./config_git" ]]; then
    backup_if_exists ~/.config/git
    cp -r ./config_git ~/.config/git
    echo "✅ Restored git config"
fi

if [[ -d "./config_gitui" ]]; then
    backup_if_exists ~/.config/gitui
    cp -r ./config_gitui ~/.config/gitui
    echo "✅ Restored gitui config"
fi

if [[ -d "./config_karabiner" ]]; then
    backup_if_exists ~/.config/karabiner
    cp -r ./config_karabiner ~/.config/karabiner
    echo "✅ Restored karabiner config"
fi

# Restore .claude directory
echo "🤖 Restoring Claude configuration..."
if [[ -d "./claude" ]]; then
    backup_if_exists ~/.claude
    cp -r ./claude ~/.claude
    echo "✅ Restored Claude config"
fi

# Restore zsh configurations
echo "🐚 Restoring zsh configurations..."
if [[ -f "./zshrc" ]]; then
    backup_if_exists ~/.zshrc
    cp ./zshrc ~/.zshrc
    echo "✅ Restored .zshrc"
fi

if [[ -f "./zimrc" ]]; then
    backup_if_exists ~/.zimrc
    cp ./zimrc ~/.zimrc
    echo "✅ Restored .zimrc"
fi

if [[ -d "./zim" ]]; then
    backup_if_exists ~/.zim
    cp -r ./zim ~/.zim
    echo "✅ Restored .zim"
fi

# Restore other dotfiles from original structure
echo "📄 Restoring other dotfiles..."
dotfiles=("aliases" "vimrc.local" "tmux.conf" "gitignore" "ackrc")

for file in "${dotfiles[@]}"; do
    if [[ -f "./$file" ]]; then
        backup_if_exists ~/.$file
        cp ./$file ~/.$file
        echo "✅ Restored .$file"
    fi
done

echo ""
echo "🎉 Dotfiles restoration complete!"
echo ""
echo "📋 Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Install required dependencies (see README.md)"
echo "  3. Check that all applications work as expected"
echo ""
echo "📁 Original configs backed up to: $BACKUP_DIR"