#!/bin/sh
set -eu

echo "Hello from io.github.francoism90.HelloFlatpak"
echo "This test app exists to publish appstream metadata in your Flatpak repo."
printf "\nFlatpak ID: %s\n" "${FLATPAK_ID:-unknown}"
printf "Sandbox: %s\n" "${FLATPAK_SANDBOX_DIR:-unknown}"
printf "\nPress Enter to exit..."
read -r _
