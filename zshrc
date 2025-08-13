# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Disable automatic compinit calls to avoid conflicts with Zim
skip_global_compinit=1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#####################################################
# SYSTEM BLOCKS - KEEP AT TOP
#####################################################

# Amazon Q pre block
#####################################################
# ZIM INITIALIZATION AND CONFIGURATION
#####################################################

# -----------------
# Zsh configuration
# -----------------

# History settings
setopt HIST_IGNORE_ALL_DUPS

# Set editor default keymap to vi
bindkey -v
KEYTIMEOUT=1

# Remove path separator from WORDCHARS
WORDCHARS=${WORDCHARS//[\/]}

# Additional Zsh options
unsetopt nomatch              # Allow wildcard use in command line
unsetopt prompt_cr            # Remove percentage sign after the prompt

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Download zimfw plugin manager if missing
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Install missing modules and update init.zsh if needed
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi

# Initialize modules
source ${ZIM_HOME}/init.zsh

# --------------------
# Module configuration
# --------------------

# ZSH Autosuggestions
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# ZSH Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

#####################################################
# ENVIRONMENT VARIABLES
#####################################################

# General settings
export EDITOR="code"
export VISUAL="vim"
export TERM="xterm-256color"

# Localization
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Cache directories
export CACHE_DIR="${HOME}/.cache"
export ZSH_CACHE_DIR="${HOME}/.cache"
[[ ! -d "${CACHE_DIR}" ]] && mkdir -p "${CACHE_DIR}"

# Tool-specific settings
export ENHANCD_FILTER="fzy:fzf:peco"
export NVM_LAZY_LOAD=true
export CLOUDSDK_PYTHON="/usr/bin/python3"
export HOMEBREW_NO_AUTO_UPDATE=1

# Ruby configuration
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"

# FPATH additions for completions
[[ ":$FPATH:" != *":/Users/take5/.zsh/completions:"* ]] && \
  export FPATH="/Users/take5/.zsh/completions:$FPATH"

# zsh-ccusage configuration
export CCUSAGE_UPDATE_INTERVAL=30
export CCUSAGE_DAILY_LIMIT=200
export CCUSAGE_DISPLAY_FORMAT="[$%.2f | %d%%]"

#####################################################
# DEVELOPMENT TOOLS - LOAD ASDF FIRST
#####################################################

# ASDF version manager - MUST be loaded before PATH configuration
. /opt/homebrew/opt/asdf/libexec/asdf.sh

#####################################################
# PATH CONFIGURATION - CONSOLIDATED
#####################################################

# Add directories to PATH using array (efficient method)
typeset -U path
path=(
  # Personal bin directories
  ${HOME}/bin
  ${HOME}/.local/bin

  # Homebrew packages
  /opt/homebrew/opt/openssl@1.1/bin
  /opt/homebrew/opt/libpq/bin
  /opt/homebrew/opt/openjdk/bin
  /usr/local/opt/mysql@5.6/bin

  # Applications
  "/Applications/Sublime Text.app/Contents/SharedSupport/bin"

  # Language-specific paths
  $(go env GOPATH)/bin     # Go
  $PYENV_ROOT/bin          # Pyenv
  $BUN_INSTALL/bin          # Bun
  $PNPM_HOME                # pnpm
  ${HOME}/.asdf/installs/rust/1.85.1/bin  # Rust cargo binaries

  $path
)
export PATH

# Compiler flags - consolidated
# export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include -I/opt/homebrew/opt/openjdk/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export CFLAGS="-I/opt/homebrew/opt/openssl@3/include"

#####################################################
# PROMPT CONFIGURATION - POWERLEVEL10K
#####################################################

# Prompt elements configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  context
  dir
  vcs
  newline
  prompt_char
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  asdf
  time
)

# Prompt settings
POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW='true'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_COLOR_SCHEME="dark"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Load p10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

#####################################################
# OTHER DEVELOPMENT TOOLS - LAZY LOADED WHEN POSSIBLE
#####################################################

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
alias pip="$(pyenv which pip)"

# Python3 configuration
export PYTHON=$(which python3)

# FZF fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Atuin shell history
eval "$(atuin init zsh)"

# Deno runtime
[ -f "$HOME/.deno/env" ] && source "$HOME/.deno/env"

# bun completions
[ -s "/Users/take5/.bun/_bun" ] && source "/Users/take5/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"

# pnpm
export PNPM_HOME="/Users/take5/Library/pnpm"

# zsh-ccusage - AI usage cost tracking
if [[ ! -d ~/workspace/ai/zsh-ccusage ]]; then
  git clone git@github.com:hydai/zsh-ccusage.git ~/workspace/ai/zsh-ccusage
fi
source ~/workspace/ai/zsh-ccusage/zsh-ccusage.plugin.zsh

#####################################################
# GOOGLE CLOUD SDK - CONSOLIDATED
#####################################################

# Choose one location for Google Cloud SDK (prioritize main installation)
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

#####################################################
# KEYBINDINGS - CONSOLIDATED
#####################################################

# History substring search (consolidated all bindings in one place)
zmodload -F zsh/terminfo +p:terminfo

# Bind keys for history navigation
typeset -A key_mappings=(
  '^[[A'  history-substring-search-up
  '^P'    history-substring-search-up
  '\eOA'  history-substring-search-up
  '^[[B'  history-substring-search-down
  '^N'    history-substring-search-down
  '\eOB'  history-substring-search-down
)

# Apply all key bindings
for k v in ${(kv)key_mappings}; do
  bindkey $k $v
done

# Vi mode specific bindings
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#####################################################
# CUSTOM FUNCTIONS
#####################################################

# Database cloning function
clone_db() {
    ~/Downloads/clone_database.sh "$@"
}

# Git log range function
git_log_range() {
    local start_date="$1"
    local end_date="$2"

    if [ -z "$start_date" ] || [ -z "$end_date" ]; then
        echo "Usage: git_log_range <start_date> <end_date>"
        echo "Dates should be in YYYY-MM-DD format or a format Git recognizes (e.g., '1 week ago')"
        return 1
    fi

    # Function to format the output
    format_output() {
        sed -e '/^$/d' -e 's/^/    /' |
        awk '
        BEGIN {print_files=0; first_commit=1}
        /^    [0-9]{4}-[0-9]{2}-[0-9]{2}/ {
            if (!first_commit) print "\n";
            first_commit=0;
            print_files=0;
            print;
            next
        }
        /^    Author:/ {print_files=1; print; next}
        /^    Committer:/ {print_files=1; print; next}
        /^    Hash:/ {print_files=1; print; next}
        /^    Branch:/ {print_files=1; print; next}
        /^    Files:/ {print; next}
        print_files==1 {print "    " $0; next}
        {print}
        '
    }

    # Run the git log command with colors for terminal display
    git log --all --color=always --pretty=format:"%C(yellow)%cd%Creset %C(green)Author: %an%Creset %C(cyan)Committer: %cn%Creset%n%C(red)%s%Creset%n%b%Creset%n%C(blue)Hash: %h%Creset%n%C(magenta)Branch: %D%Creset%n%C(cyan)Files:%Creset" \
        --name-only \
        --date=format:"%Y-%m-%d %H:%M:%S" \
        --after="$start_date" \
        --before="$end_date" |
    format_output

    # Run the git log command without colors for clipboard copy
    git log --all --no-color --pretty=format:"%cd Author: %an Committer: %cn%n%s%n%b%nHash: %h%nBranch: %D%nFiles:" \
        --name-only \
        --date=format:"%Y-%m-%d %H:%M:%S" \
        --after="$start_date" \
        --before="$end_date" |
    format_output |
    pbcopy

    echo "The result (without colors) has been copied to your clipboard."
}

#####################################################
# ALIASES
#####################################################

# Load custom aliases
source ~/workspace/dotfiles/aliases

# Git aliases
alias git-log-range=git_log_range

#####################################################
# SYSTEM BLOCKS - KEEP AT BOTTOM
#####################################################

# Amazon Q post block

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
