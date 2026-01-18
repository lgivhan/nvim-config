#!/bin/bash

# Neovim Dotfiles Installation Script
# This script sets up Neovim with all dependencies on a Mac

set -e # Exit if any command fails

echo "🚀 Starting Neovim setup..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "❌ Homebrew not found. Please install it first:"
  echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  exit 1
fi

echo "✅ Homebrew found"

# Install Neovim and dependencies

# Backup existing Neovim config if it exists

# Create .config directory if it doesn't exist

# Create symlink
