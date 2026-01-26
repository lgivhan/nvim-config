# Dotfiles

My personal dotfiles for macOS, featuring Neovim configuration, shell setup, and automated installation.

## What's Included

- **Neovim** - Complete IDE-like setup with LSP, completion, debugging, and more
- **Zsh** - Shell configuration with Oh My Zsh
- **Aliases** - Custom command shortcuts

## Quick Start

### Fresh Installation

On a new Mac, run:
```bash
# Clone this repository
git clone https://github.com/lgivhan/dotfiles.git ~/dotfiles

# Run the install script
cd ~/dotfiles
./install.sh
```

The script will:
- Install Homebrew (if needed)
- Install Neovim and dependencies (ripgrep, fd, node, go, rust, python)
- Install Oh My Zsh
- Create symlinks for all configurations
- Backup any existing configs

### Manual Steps After Installation

1. Restart your terminal or run: `source ~/.zshrc`
2. Open Neovim: `nvim`
3. Plugins will auto-install on first launch

## Structure
```
dotfiles/
├── nvim/              # Neovim configuration
│   ├── init.lua       # Entry point
│   ├── lua/
│   │   ├── config/    # Core settings
│   │   └── plugins/   # Plugin configs
│   └── lazy-lock.json # Plugin versions
├── .zshrc             # Zsh configuration
├── .aliases           # Command aliases
└── install.sh         # Automated setup script
```

## Key Features

### Neovim
- Plugin manager: lazy.nvim
- LSP with Mason for language servers
- Fast completion with blink.cmp
- Fuzzy finding with Telescope
- Syntax highlighting with Treesitter
- Debugging with nvim-dap
- AI assistance with CodeCompanion

### Aliases
- `gs` - git status
- `ga` - git add and commit
- `gp` - git push
- `gl` - pretty git log
- `nv` - open nvim

## Customization

Edit these files to customize:
- `nvim/lua/config/options.lua` - Vim settings
- `nvim/lua/config/keymaps.lua` - Key bindings
- `.aliases` - Command shortcuts

## Requirements

- macOS (tested on Catalina and later)
- Git
- Internet connection (for installation)

## Credits

Based on [dennisgsmith's configuration](https://github.com/dennisgsmith/nix-config)
