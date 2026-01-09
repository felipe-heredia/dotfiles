#!/bin/bash

# Define the stow directory
STOW_DIR="stow"
TARGET_DIR="$HOME"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed."
    echo "Please install it using your package manager (e.g., sudo apt install stow / sudo pacman -S stow)"
    exit 1
fi

echo "Cleaning up old symlinks and conflicts..."

# Loop through each package in the stow directory
for package in $(ls "$STOW_DIR"); do
    echo "Processing package: $package"
    
    # We use stow -D (delete) to try and remove known symlinks first
    stow -d "$STOW_DIR" -t "$TARGET_DIR" -D "$package" 2>/dev/null

    # Manually check for conflicts that Stow might refuse to overwrite
    # We check both files and directories because the previous setup might have symlinked whole directories (like .config/zsh)
    find "$STOW_DIR/$package" -mindepth 1 | while read -r file; do
        # Strip the stow directory prefix to get the relative path
        rel_path="${file#$STOW_DIR/$package/}"
        target_path="$TARGET_DIR/$rel_path"

        if [ -L "$target_path" ]; then
            # It's a symlink. Since we are restowing, we assume any existing symlink 
            # is either from a previous stow run (which -D tried to handle) or manual.
            # We remove it to let stow take over.
            echo "  Removing existing symlink: $target_path"
            rm "$target_path"
        elif [ -f "$target_path" ] && [ -f "$file" ]; then
            # Target is a real file, and we want to place a file (symlink) there. Conflict.
            echo "  Backing up existing file: $target_path -> $target_path.bak"
            mv "$target_path" "$target_path.bak"
        elif [ -d "$target_path" ] && [ ! -d "$file" ]; then
             # Target is a dir, but we want to put a file there. Rare but possible.
             echo "  Backing up existing directory: $target_path -> $target_path.bak"
             mv "$target_path" "$target_path.bak"
        fi
        # If both are directories, we do nothing and let Stow merge/descend.
    done
done

echo "Cleanup complete."
