#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "Hydra bootstrap"

pkg update -y
pkg upgrade -y
pkg install -y git python nodejs ffmpeg openssh curl wget jq zip unzip tree gnupg

mkdir -p "$HOME/.hydra/config"
mkdir -p "$HOME/.hydra/keys"
mkdir -p "$HOME/.hydra/secrets"
mkdir -p "$HOME/.hydra/scripts"

mkdir -p "$HOME/storage/shared/Hydra/assets"
mkdir -p "$HOME/storage/shared/Hydra/backups"
mkdir -p "$HOME/storage/shared/Hydra/bin"
mkdir -p "$HOME/storage/shared/Hydra/exports"
mkdir -p "$HOME/storage/shared/Hydra/projects"
mkdir -p "$HOME/storage/shared/Hydra/scripts"
mkdir -p "$HOME/storage/shared/Hydra/sdk"
mkdir -p "$HOME/storage/shared/Hydra/secrets"
mkdir -p "$HOME/storage/shared/Hydra/temp"
mkdir -p "$HOME/storage/shared/Hydra/www/logs"
mkdir -p "$HOME/storage/shared/Hydra/www/public"

chmod 700 "$HOME/.hydra"
chmod 700 "$HOME/.hydra/"*

echo "Bootstrap complete."

mkdir -p "$HOME/.hydra/bin"

if [ -f "$HOME/storage/shared/Hydra/bin/hydra" ]; then
    cp "$HOME/storage/shared/Hydra/bin/hydra" "$HOME/.hydra/bin/hydra"
    chmod 700 "$HOME/.hydra/bin/hydra"
fi

grep -qxF 'export PATH="$HOME/.hydra/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null || \
echo 'export PATH="$HOME/.hydra/bin:$PATH"' >> "$HOME/.bashrc"

mkdir -p "$HOME/.hydra/scripts"

if [ -f "$HOME/storage/shared/Hydra/bin/termux-clipguard" ]; then
    cp "$HOME/storage/shared/Hydra/bin/termux-clipguard" \
       "$HOME/.hydra/scripts/termux-clipguard"
    chmod 700 "$HOME/.hydra/scripts/termux-clipguard"
fi

grep -qxF "alias clipguard='\$HOME/.hydra/scripts/termux-clipguard'" "$HOME/.bashrc" 2>/dev/null || \
echo "alias clipguard='\$HOME/.hydra/scripts/termux-clipguard'" >> "$HOME/.bashrc"
