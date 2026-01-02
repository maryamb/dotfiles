#!/bin/bash

# ============================================================================
# Modern CLI Tools Installation Script
# ============================================================================

set -e

echo "🚀 Installing modern CLI tools..."
echo ""

# ============================================================================
# RUST TOOLS (via cargo)
# ============================================================================

echo "📦 Installing Rust-based tools..."
echo ""

if ! command -v cargo &> /dev/null; then
    echo "❌ cargo not found. Please install Rust first:"
    echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi

# Array of cargo tools to install
cargo_tools=(
    "bat"           # cat replacement with syntax highlighting
    "du-dust"       # du replacement with better visualization
    "fd-find"       # find replacement, faster and easier to use
    "ripgrep"       # grep replacement, extremely fast
    "procs"         # ps replacement with better interface
    "tlrc"          # tldr client for quick command examples
    "zoxide"        # smart cd replacement that learns your habits
    "lsd"           # ls replacement with colors and icons
)

for tool in "${cargo_tools[@]}"; do
    echo "Installing $tool..."
    cargo install "$tool"
done

echo ""
echo "✅ Rust tools installed!"
echo ""

# ============================================================================
# APT PACKAGES (Debian/Ubuntu)
# ============================================================================

echo "📦 Installing system packages..."
echo ""

if ! command -v apt &> /dev/null; then
    echo "⚠️  apt not found. Skipping apt packages."
    echo "   (Install these manually if you're not on Debian/Ubuntu)"
else
    apt_packages=(
        "lazygit"       # Terminal UI for git
        "lnav"          # Log file navigator
        "yazi"          # Terminal file manager
        "moreutils"     # Collection of Unix tools
        "pandoc"        # Universal document converter
        "fzf"           # Fuzzy finder
    )

    for package in "${apt_packages[@]}"; do
        echo "Installing $package..."
        sudo apt install -y "$package" || echo "⚠️  Failed to install $package"
    done

    # Television requires special handling (may not be in default repos)
    echo ""
    echo "📺 For 'television' (tv command), install from:"
    echo "   https://github.com/alexpasmantier/television"
fi

echo ""
echo "✅ System packages installed!"
echo ""

# ============================================================================
# VERIFICATION
# ============================================================================

echo "🔍 Verifying installations..."
echo ""

commands=(
    "bat:cat replacement"
    "dust:du replacement"
    "fd:find replacement"
    "rg:grep replacement"
    "procs:ps replacement"
    "tldr:man replacement"
    "zoxide:cd replacement"
    "lsd:ls replacement"
    "lazygit:git TUI"
    "lnav:log viewer"
    "yazi:file manager"
    "pandoc:document converter"
    "fzf:fuzzy finder"
)

for cmd_info in "${commands[@]}"; do
    cmd="${cmd_info%%:*}"
    desc="${cmd_info##*:}"
    if command -v "$cmd" &> /dev/null; then
        echo "✅ $cmd ($desc)"
    else
        echo "❌ $cmd ($desc) - not found"
    fi
done

echo ""
echo "============================================================================"
echo "🎉 Installation complete!"
echo "============================================================================"
echo ""
echo "Next steps:"
echo "  1. Backup your current .zshrc:"
echo "     cp ~/.zshrc ~/.zshrc.backup"
echo ""
echo "  2. Replace ~/.zshrc with the new organized version"
echo ""
echo "  3. Reload your shell:"
echo "     source ~/.zshrc"
echo ""
echo "Quick command reference:"
echo "  bat file.txt          # View file with syntax highlighting"
echo "  dust ~/Downloads      # See directory sizes"
echo "  fd controller         # Find files by name"
echo "  rg TODO src           # Search for text in files"
echo "  procs                 # Better process list"
echo "  tldr ls               # Quick command examples"
echo "  z ~/Downloads         # Jump to frequently used directories"
echo "  lsd -al               # Better ls with colors and icons"
echo "  lazygit               # Git TUI"
echo "  lnav /var/log/*.log   # Interactive log viewer"
echo "  yazi                  # Terminal file manager"
echo ""
