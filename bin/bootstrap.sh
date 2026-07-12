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
