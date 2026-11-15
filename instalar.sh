#!/usr/bin/env bash
# Enlaza claude-base en ~/.claude: CLAUDE.md personal y cada skill de skills/.
# No pisa nada: si en el sitio hay un fichero o carpeta de verdad, lo renombra a .antes-<fecha>.
set -euo pipefail

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.claude"
FECHA="$(date +%Y-%m-%d-%H%M%S)"
mkdir -p "$DEST/skills"

enlazar() {
  local origen="$1" destino="$2"
  if [ -L "$destino" ]; then
    if [ "$(readlink "$destino")" = "$origen" ]; then
      echo "ya enlazado: $destino"; return
    fi
    rm "$destino"
  elif [ -e "$destino" ]; then
    mv "$destino" "$destino.antes-$FECHA"
    echo "guardado: $destino.antes-$FECHA"
  fi
  ln -s "$origen" "$destino"
  echo "enlazado: $destino -> $origen"
}

enlazar "$BASE/CLAUDE.md" "$DEST/CLAUDE.md"
for skill in "$BASE"/skills/*/; do
  nombre="$(basename "$skill")"
  enlazar "${skill%/}" "$DEST/skills/$nombre"
done
