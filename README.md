# Dotfiles Configuration

This repository contains my personal dotfiles and configurations for macOS development environment.

## What's Included

### Shell Configuration
- **zshrc** - Zsh shell configuration with Zim framework
- **zimrc** - Zim plugin manager configuration  
- **zim/** - Zim framework modules and plugins
- **aliases** - Custom command aliases
- **before.zsh** / **after.zsh** - Additional zsh customizations

### Application Configs
- **config_ghostty/** - Ghostty terminal emulator settings
- **config_nvim/** - Neovim editor configuration
- **config_git/** - Git configuration
- **config_gitui/** - GitUI terminal interface settings
- **config_karabiner/** - Karabiner-Elements key remapping

### Claude AI Assistant
- **claude/** - Claude Code CLI settings and scripts
  - `CLAUDE.md` - Personal AI assistant instructions
  - `settings.json` - Claude configuration
  - `*.py`, `*.sh` - Custom scripts

### Development Tools
- **vimrc.local** - Vim configuration
- **tmux.conf** - Tmux terminal multiplexer settings
- **gitignore** - Global git ignore patterns
- **ackrc** - Ack search tool configuration

## Installation

### Quick Setup (New Machine)
```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x restore.sh
./restore.sh
```

### Manual Installation
The restore script will automatically:
1. Create backups of existing configs
2. Copy configurations to their proper locations
3. Set appropriate permissions

### Post-Installation
1. Restart your terminal or run: `source ~/.zshrc`
2. Install required dependencies:
   - [Zim](https://zimfw.sh/) - Zsh framework
   - [Ghostty](https://ghostty.org/) - Terminal emulator
   - [Neovim](https://neovim.io/) - Text editor
   - [Karabiner-Elements](https://karabiner-elements.pqrs.org/) - Key remapper

## File Structure
```
dotfiles/
├── config_ghostty/     # ~/.config/ghostty
├── config_nvim/        # ~/.config/nvim  
├── config_git/         # ~/.config/git
├── config_gitui/       # ~/.config/gitui
├── config_karabiner/   # ~/.config/karabiner
├── claude/             # ~/.claude
├── zshrc               # ~/.zshrc
├── zimrc               # ~/.zimrc
├── zim/                # ~/.zim
├── aliases             # ~/.aliases
├── vimrc.local         # ~/.vimrc.local
├── tmux.conf           # ~/.tmux.conf
├── gitignore           # ~/.gitignore
├── restore.sh          # Installation script
└── README.md           # This file
```

## Customization

Feel free to modify any configurations to suit your needs. Key files to customize:
- `zshrc` - Shell behavior and aliases
- `config_nvim/` - Editor settings and plugins
- `claude/CLAUDE.md` - AI assistant instructions
- `aliases` - Command shortcuts

## Backup & Sync

This is a one-time snapshot approach. To sync changes:
1. Make changes to configs in their normal locations (~/.config, etc.)
2. Manually copy updated files back to this repo when needed
3. Commit and push changes

## Notes

- Transient data (logs, caches, project files) are excluded
- Original configs are backed up during restore
- All file permissions are preserved
