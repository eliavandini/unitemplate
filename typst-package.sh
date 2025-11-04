#!/usr/bin/env bash
set -euo pipefail

# Typst local package manager
# Usage:
#   ./typst-package.sh install <path>
#   ./typst-package.sh uninstall <name> [version]
#   ./typst-package.sh list
#   ./typst-package.sh thumbnail <path>

TYPST_DIR="$HOME/.local/share/typst/packages/local"

# --- Helper function: read key=value from typst.toml ---
read_toml_field() {
  local field="$1"
  local file="$2"
  grep -E "^${field}\s*=" "$file" | sed -E 's/.*=\s*"?([^"]+)"?/\1/'
}

# --- Commands ---
case "${1:-}" in
  install)
    SRC_DIR="${2:-.}"
    if [[ ! -f "$SRC_DIR/typst.toml" ]]; then
      echo "Error: typst.toml not found in $SRC_DIR"
      exit 1
    fi

    PKG_NAME=$(read_toml_field name "$SRC_DIR/typst.toml")
    PKG_VER=$(read_toml_field version "$SRC_DIR/typst.toml")

    if [[ -z "$PKG_NAME" || -z "$PKG_VER" ]]; then
      echo "Error: Could not parse name or version from typst.toml"
      exit 1
    fi

    DEST_DIR="$TYPST_DIR/$PKG_NAME/$PKG_VER"

    echo "Installing Typst package:"
    echo "  Name:    $PKG_NAME"
    echo "  Version: $PKG_VER"
    echo "  From:    $SRC_DIR"
    echo "  To:      $DEST_DIR"
    echo

    rm -rf "$DEST_DIR"
    mkdir -p "$DEST_DIR"
    cp -r "$SRC_DIR"/* "$DEST_DIR"/

    echo "Package installed successfully."
    echo "You can import it in Typst as:"
    echo "@import \"@local/$PKG_NAME:$PKG_VER\": *"
    ;;

  uninstall)
    PKG_NAME="${2:-}"
    PKG_VER="${3:-}"

    if [[ -z "$PKG_NAME" ]]; then
      echo "Usage: $0 uninstall <name> [version]"
      exit 1
    fi

    if [[ -z "$PKG_VER" ]]; then
      echo "Removing all versions of $PKG_NAME..."
      rm -rf "$TYPST_DIR/$PKG_NAME"
    else
      echo "Removing $PKG_NAME version $PKG_VER..."
      rm -rf "$TYPST_DIR/$PKG_NAME/$PKG_VER"
    fi
    echo "Package uninstalled."
    ;;

  thumbnail)
    TYP_PATH="${2:-./test.typ}"
    typst compile $TYP_PATH -f png --pages 1 ./thumbnail.png
    echo "Updated thumbnail"
    ;;

  list)
    echo "Installed local Typst packages:"
    find "$TYPST_DIR" -mindepth 2 -maxdepth 2 -type d | sed "s|$TYPST_DIR/||" | sort || echo "None found."
    ;;

  *)
    echo "Typst local package manager"
    echo
    echo "Usage:"
    echo "  $0 install <path>     Install a package from directory"
    echo "  $0 uninstall <name>   Uninstall a package"
    echo "  $0 list               List installed local packages"
    echo "  $0 thumbnail <path>   regenerate the thumbnail"
    echo
    echo "Example:"
    echo "  $0 install ./packages/mytemplate"
    echo "  $0 uninstall mytemplate 0.1.0"
    ;;
esac
