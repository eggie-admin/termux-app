# Hydra Samsung SM-X400 Termux lane

This directory is an additive Samsung development layer for the Project Hydra / KAI 9000 SM-X400 target. It deliberately avoids modifying Termux core behavior so upstream Termux updates remain easy to rebase.

## Trust lanes

### Stock Samsung / Knox-capable target

Preferred path:

1. stock Samsung firmware
2. Developer Options enabled
3. USB or Wireless debugging enabled only when needed
4. Shizuku started through ADB / Wireless debugging
5. explicit per-app Shizuku authorization
6. Termux + Termux:Widget own the localhost service control plane

Root and Sui are not part of this trusted lane.

### Rooted laboratory target

Root / Sui may be used only as an explicit laboratory mode. This lane must not claim Secure Folder or Knox trust.

## Control plane

Canonical localhost ports:

- AXS: `127.0.0.1:8767`
- TigerVNC: `127.0.0.1:5901`
- WebSocket bridge: `127.0.0.1:6080`
- Hydra cockpit: `127.0.0.1:8787`
- Ollama: `127.0.0.1:11434`

The authoritative supervisor lives in `eggie-admin/hydra-shell-android` at `tools/hydra_widget_setup.py`.

This repo's `bootstrap.sh` discovers Samsung/Shizuku/Termux capabilities and can install the authoritative widget supervisor from a local checkout. It never downloads or executes remote code automatically.

## Usage

```bash
./hydra-sm-x400/bootstrap.sh status

HYDRA_SHELL="$HOME/hydra-shell-android" \
  ./hydra-sm-x400/bootstrap.sh install-widget

./hydra-sm-x400/bootstrap.sh cockpit
```

`install-widget` calls the existing Hydra supervisor's `install` command. Missing optional capabilities are reported as capability downgrades, not treated as a broken Termux build.

## Safety

- no public listeners
- no automatic root escalation
- no arbitrary model-authored shell execution
- no embedded secrets
- no broad process killing
- privileged actions must remain typed and allow-listed
