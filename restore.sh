#!/bin/bash

# Dotfiles Restore Script
# Run this script on a new machine to restore configurations

set -e

echo "🔧 Starting dotfiles restoration..."

# Only create backup directory if we need to backup something
BACKUP_DIR=""

# Function to ensure backup directory exists
ensure_backup_dir() {
    if [[ -z "$BACKUP_DIR" ]]; then
        BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
        mkdir -p "$BACKUP_DIR"
        echo "📦 Created backup directory: $BACKUP_DIR"
    fi
}

# Function to backup existing file/directory if it exists and differs
backup_if_different() {
    local target="$1"
    local source="$2"
    
    if [[ -e "$target" ]]; then
        # Check if source and target are different
        if ! diff -rq "$source" "$target" >/dev/null 2>&1; then
            ensure_backup_dir
            echo "💾 Backing up existing $target (differs from source)"
            mv "$target" "$BACKUP_DIR/"
        else
            echo "✓ $target already up to date, skipping"
            return 1  # Signal that we don't need to copy
        fi
    fi
    return 0  # Signal that we should copy
}

# Restore .config directories
echo "⚙️  Restoring .config directories..."
mkdir -p ~/.config

if [[ -d "./config_ghostty" ]]; then
    if backup_if_different ~/.config/ghostty ./config_ghostty; then
        cp -r ./config_ghostty ~/.config/ghostty
        echo "✅ Restored ghostty config"
    fi
fi

if [[ -d "./config_nvim" ]]; then
    if backup_if_different ~/.config/nvim ./config_nvim; then
        cp -r ./config_nvim ~/.config/nvim
        echo "✅ Restored nvim config"
    fi
fi

if [[ -d "./config_git" ]]; then
    if backup_if_different ~/.config/git ./config_git; then
        cp -r ./config_git ~/.config/git
        echo "✅ Restored git config"
    fi
fi

if [[ -d "./config_gitui" ]]; then
    if backup_if_different ~/.config/gitui ./config_gitui; then
        cp -r ./config_gitui ~/.config/gitui
        echo "✅ Restored gitui config"
    fi
fi

if [[ -d "./config_karabiner" ]]; then
    if backup_if_different ~/.config/karabiner ./config_karabiner; then
        cp -r ./config_karabiner ~/.config/karabiner
        echo "✅ Restored karabiner config"
    fi
fi

# Restore .claude directory
echo "🤖 Restoring Claude configuration..."
if [[ -d "./claude" ]]; then
    if backup_if_different ~/.claude ./claude; then
        cp -r ./claude ~/.claude
        echo "✅ Restored Claude config"
    fi
fi

# Restore zsh configurations
echo "🐚 Restoring zsh configurations..."
if [[ -f "./zshrc" ]]; then
    if backup_if_different ~/.zshrc ./zshrc; then
        cp ./zshrc ~/.zshrc
        echo "✅ Restored .zshrc"
    fi
fi

if [[ -f "./zimrc" ]]; then
    if backup_if_different ~/.zimrc ./zimrc; then
        cp ./zimrc ~/.zimrc
        echo "✅ Restored .zimrc"
    fi
fi

if [[ -d "./zim" ]]; then
    if backup_if_different ~/.zim ./zim; then
        cp -r ./zim ~/.zim
        echo "✅ Restored .zim"
    fi
fi

# Restore other dotfiles from original structure
echo "📄 Restoring other dotfiles..."
dotfiles=("aliases" "vimrc.local" "tmux.conf" "gitignore" "ackrc")

for file in "${dotfiles[@]}"; do
    if [[ -f "./$file" ]]; then
        if backup_if_different ~/.$file ./$file; then
            cp ./$file ~/.$file
            echo "✅ Restored .$file"
        fi
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
if [[ -n "$BACKUP_DIR" ]]; then
    echo "📁 Original configs backed up to: $BACKUP_DIR"
else
    echo "📁 No backups needed - all configs were already up to date"
fi