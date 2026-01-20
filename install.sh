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

# Backup existing Neovim config if it exists

# Create .config directory if it doesn't exist

# Create symlink
