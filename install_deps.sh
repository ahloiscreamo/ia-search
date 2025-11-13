#!/usr/bin/env bash
set -euo pipefail

DEPS_FILE="${1:-deps-ubuntu.json}"

echo "[*] Using dependencies file: $DEPS_FILE"

if [[ ! -f "$DEPS_FILE" ]]; then
  echo "[!] Dependencies file '$DEPS_FILE' not found."
  exit 1
fi

APT_UPDATED=0

# Ensure jq is installed for JSON parsing
if ! command -v jq >/dev/null 2>&1; then
  echo "[*] 'jq' not found. Installing jq (requires sudo)..."
  sudo apt update
  APT_UPDATED=1
  sudo apt install -y jq
fi

# Run apt update if we haven't already
if [[ "$APT_UPDATED" -eq 0 ]]; then
  echo "[*] Updating apt package lists..."
  sudo apt update
  APT_UPDATED=1
fi

# Check if there are any pip-managed dependencies
NEED_VENV=0
if jq -e '.dependencies[] | select(.manager == "pip")' "$DEPS_FILE" >/dev/null 2>&1; then
  NEED_VENV=1
fi

PIP=""
if [[ "$NEED_VENV" -eq 1 ]]; then
  echo "[*] Python (pip) dependencies detected. Preparing virtual environment..."

  # Ensure python3 exists
  if ! command -v python3 >/dev/null 2>&1; then
    echo "[*] python3 not found. Installing..."
    sudo apt install -y python3
  fi

  # Create venv if it doesn't exist
  if [[ ! -d ".venv" ]]; then
    echo "[*] Creating virtual environment in .venv ..."
    # Try to create venv; if it fails, install python3-venv and retry
    if ! python3 -m venv .venv 2>/dev/null; then
      echo "[*] python3-venv not found or venv creation failed. Installing python3-venv..."
      sudo apt install -y python3-venv
      python3 -m venv .venv
    fi
  else
    echo "[*] Reusing existing virtual environment .venv"
  fi

  PIP="./.venv/bin/pip"

  echo "[*] Upgrading pip inside virtual environment..."
  "$PIP" install --upgrade pip
fi

echo "[*] Installing dependencies from $DEPS_FILE..."

# Iterate over dependencies
jq -c '.dependencies[]' "$DEPS_FILE" | while read -r dep; do
  TOOL=$(echo "$dep" | jq -r '.tool')
  MANAGER=$(echo "$dep" | jq -r '.manager')
  PACKAGE=$(echo "$dep" | jq -r '.package')

  # Skip empty or malformed entries
  if [[ -z "${TOOL// }" ]] || [[ -z "${MANAGER// }" ]] || [[ -z "${PACKAGE// }" ]]; then
    echo "[!] Skipping invalid dependency entry: $dep"
    continue
  fi

  echo "[*] Installing '$TOOL' using '$MANAGER' ('$PACKAGE')..."

  case "$MANAGER" in
    apt)
      sudo apt install -y "$PACKAGE"
      ;;
    pip)
      if [[ -z "$PIP" ]]; then
        echo "[!] ERROR: pip manager specified but no virtual environment was set up."
        echo "    Check the script logic around NEED_VENV/PIP."
        exit 1
      fi
      "$PIP" install "$PACKAGE"
      ;;
    *)
      echo "[!] Unknown package manager '$MANAGER' for tool '$TOOL' – skipping."
      ;;
  esac
done

echo
echo "[✓] Dependency installation complete."

if [[ "$NEED_VENV" -eq 1 ]]; then
  echo
  echo "Python packages were installed into a virtual environment at: .venv"
  echo "To use them, activate the environment in your shell with:"
  echo "  source .venv/bin/activate"
fi

echo
echo "If you want to use a different dependency file (e.g. deps-arch.json), run:"
echo "  ./install_deps.sh path/to/deps-file.json"

