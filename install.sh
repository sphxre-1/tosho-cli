#!/usr/bin/env bash
set -e

echo "==================================="
echo "    tosho-cli Installer            "
echo "==================================="
echo ""

# 1. Determine the installation directory
if [ "$(id -u)" -eq 0 ]; then
	INSTALL_DIR="/usr/local/bin"
else
	INSTALL_DIR="$HOME/.local/bin"
	mkdir -p "$INSTALL_DIR"
fi

echo "Installing to: $INSTALL_DIR/tosho-cli"

# 2. Download the script
REPO_URL="https://raw.githubusercontent.com/sphxre-1/tosho-cli/main/tosho-cli"

if [ -f "./tosho-cli" ]; then
	cp "./tosho-cli" "$INSTALL_DIR/tosho-cli"
else
	curl -sSL "$REPO_URL" -o "$INSTALL_DIR/tosho-cli"
fi

chmod +x "$INSTALL_DIR/tosho-cli"
echo "✅ Script installed successfully."

# 3. Check for required dependencies
echo ""
echo "Checking dependencies..."
MISSING_DEPS=()
for cmd in curl jq fzf mpv socat syncplay; do
	if ! command -v "$cmd" >/dev/null 2>&1; then
		MISSING_DEPS+=("$cmd")
	fi
done

if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
	echo "⚠️  Missing required dependencies: ${MISSING_DEPS[*]}"
	echo ""
	echo "Please install them using your system's package manager:"
	echo "  Ubuntu/Debian: sudo apt install ${MISSING_DEPS[*]}"
	echo "  Arch Linux:    sudo pacman -S ${MISSING_DEPS[*]}"
	echo "  Fedora:        sudo dnf install ${MISSING_DEPS[*]}"
else
	echo "✅ All dependencies are installed."
fi

# 4. Final instructions
echo ""
echo "Installation complete!"
if [ "$(id -u)" -ne 0 ]; then
	if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
		echo "⚠️  NOTE: $INSTALL_DIR is not in your PATH."
		echo "Add this line to your ~/.bashrc or ~/.zshrc:"
		echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
	fi
fi
echo ""
echo "To get started, simply run:"
echo "  tosho-cli \"Frieren\""
echo ""
