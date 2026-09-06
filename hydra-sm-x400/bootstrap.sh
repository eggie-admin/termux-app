#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

ACTION="${1:-status}"
HYDRA_SHELL="${HYDRA_SHELL:-$HOME/hydra-shell-android}"
SUPERVISOR="$HYDRA_SHELL/tools/hydra_widget_setup.py"
COCKPIT_URL="${HYDRA_COCKPIT_URL:-http://127.0.0.1:8787/}"

have() { command -v "$1" >/dev/null 2>&1; }
package_present() { /system/bin/pm path "$1" >/dev/null 2>&1; }

json_bool() {
  if "$@"; then printf 'true'; else printf 'false'; fi
}

status() {
  MODEL="$(getprop ro.product.model 2>/dev/null || true)"
  ANDROID="$(getprop ro.build.version.release 2>/dev/null || true)"
  printf '{\n'
  printf '  "model": "%s",\n' "$MODEL"
  printf '  "android": "%s",\n' "$ANDROID"
  printf '  "python3": %s,\n' "$(json_bool have python3)"
  printf '  "termuxWidget": %s,\n' "$(json_bool package_present com.termux.widget)"
  printf '  "termuxApi": %s,\n' "$(json_bool package_present com.termux.api)"
  printf '  "shizuku": %s,\n' "$(json_bool package_present moe.shizuku.privileged.api)"
  printf '  "termuxX11": %s,\n' "$(json_bool package_present com.termux.x11)"
  printf '  "supervisorCheckout": %s\n' "$(json_bool test -f "$SUPERVISOR")"
  printf '}\n'
}

install_widget() {
  if ! have python3; then
    printf '%s\n' 'python3 is required' >&2
    exit 2
  fi
  if [ ! -f "$SUPERVISOR" ]; then
    printf 'Hydra supervisor not found: %s\n' "$SUPERVISOR" >&2
    printf '%s\n' 'Set HYDRA_SHELL to a local hydra-shell-android checkout.' >&2
    exit 2
  fi
  exec python3 "$SUPERVISOR" install
}

open_cockpit() {
  if have termux-open-url; then
    exec termux-open-url "$COCKPIT_URL"
  fi
  if have am; then
    exec am start -a android.intent.action.VIEW -d "$COCKPIT_URL"
  fi
  printf '%s\n' 'Neither termux-open-url nor am is available.' >&2
  exit 2
}

case "$ACTION" in
  status) status ;;
  install-widget) install_widget ;;
  cockpit) open_cockpit ;;
  *)
    printf 'Usage: %s {status|install-widget|cockpit}\n' "$0" >&2
    exit 2
    ;;
esac
