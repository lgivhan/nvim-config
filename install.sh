#!/bin/bash

# Neovim Dotfiles Installation Script
# This script sets up Neovim with all dependencies on a Mac

set -e # Exit if any command fails

echo "🚀 Starting Neovim setup..."
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; # Check if homebrew doesn't exist
then
  echo "📦 Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "✅ Homebrew installed"
else
  echo "✅ Homebrew found"
fi

echo ""

# Install Neovim and dependencies
echo "📦 Installing Neovim and dependencies"
echo "   This may take a few minutes..."
brew install neovim ripgrep fd node go rust python

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "📦 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "✅ Oh My Zsh installed"
else
  echo "✅ Oh My Zsh already installed"
fi

echo ""

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
  echo "📁 Backing up existing nvim config to $BACKUP_DIR"
  mv "$HOME/.config/nvim" "$BACKUP_DIR"
fi

if [ -L "$HOME/.config/nvim" ]; then
  rm "$HOME/.config/nvim"
fi

echo "🔗 Creating nvim symlink..."
ln -sf "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
echo "✅ Nvim symlink created"

echo ""

# Backup and symlink .zshrc
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  BACKUP_FILE="$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
  echo "📁 Backing up existing .zshrc to $BACKUP_FILE"
  mv "$HOME/.zshrc" "$BACKUP_FILE"
fi

if [ -L "$HOME/.zshrc" ]; then
  rm "$HOME/.zshrc"
fi

echo "🔗 Creating .zshrc symlink..."
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
echo "✅ .zshrc symlink created"

echo ""

# Backup and symlink .aliases
if [ -f "$HOME/.aliases" ] && [ ! -L "$HOME/.aliases" ]; then
  BACKUP_FILE="$HOME/.aliases.backup.$(date +%Y%m%d_%H%M%S)"
  echo "📁 Backing up existing .aliases to $BACKUP_FILE"
  mv "$HOME/.aliases" "$BACKUP_FILE"
fi

if [ -L "$HOME/.aliases" ]; then
  rm "$HOME/.aliases"
fi
echo "🔗 Creating .aliases symlink..."
ln -sf "$HOME/dotfiles/.aliases" "$HOME/.aliases"
echo "✅ .aliases symlink created"

echo ""

echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Launch Neovim: nvim"
echo "  3. Plugins will auto-install on first launch"
echo ""
echo "Enjoy! 🚀"
