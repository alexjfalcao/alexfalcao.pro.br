#!/usr/bin/env bash
#
# Atualiza a pasta `mandala/` deste site a partir do repo do Mandala Forge.
#
# `mandala/` é uma CÓPIA: o projeto é autorado em outro repo, e o AGENTS.md
# daqui diz para nunca editar a cópia no lugar. A regra já foi quebrada duas
# vezes — e767a33 (cartão Open Graph) e 6e422b0 (rodapé) nasceram aqui e só
# convergiram porque foram retroportados à mão. Enquanto publicar for um `cp`
# lembrado de cabeça, vai ser quebrada de novo.
#
#   ./publicar.sh              traz a versão de lá para cá
#   ./publicar.sh --verificar  só compara e diz se divergiram (não escreve nada)
#
# A origem vem de $MANDALA, ou do padrão abaixo.

set -euo pipefail

SITE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DESTINO="$SITE/mandala"
ORIGEM="${MANDALA:-$HOME/Documents/Projetos/Mandala}"

# O que é publicável, como "origem|destino". O resto daquele repo — suíte,
# exportador em Python, documentos de referência — não vem para o site.
#
# O LICENSE vem junto porque a AGPL manda entregar uma cópia da licença com o
# programa, e o programa é servido daqui. Vira .txt no destino: sem extensão, o
# GitHub Pages serve como octet-stream e o navegador baixa em vez de mostrar.
ITENS=(
  "index.html|index.html"
  "mandala-cloisonne.html|mandala-cloisonne.html"
  "img|img"
  "LICENSE|LICENSE.txt"
)

VERIFICAR=0
FORCAR=0
for arg in "$@"; do
  case "$arg" in
    --verificar|-v) VERIFICAR=1 ;;
    --forcar|-f)    FORCAR=1 ;;
    *) echo "uso: $(basename "$0") [--verificar] [--forcar]" >&2; exit 2 ;;
  esac
done

if [ ! -d "$ORIGEM" ]; then
  echo "repo do Mandala não encontrado em: $ORIGEM" >&2
  echo "aponte com MANDALA=/caminho/do/repo $(basename "$0")" >&2
  exit 1
fi
[ -d "$DESTINO" ] || { echo "destino não existe: $DESTINO" >&2; exit 1; }

# ---------------------------------------------------------------- verificação
divergiu=0
for par in "${ITENS[@]}"; do
  de="${par%%|*}"; para="${par#*|}"
  if diff -rq "$ORIGEM/$de" "$DESTINO/$para" >/dev/null 2>&1; then
    printf '  =  %s\n' "$para"
  else
    printf '  ≠  %s\n' "$para"
    divergiu=1
  fi
done

if [ "$VERIFICAR" = 1 ]; then
  if [ "$divergiu" = 0 ]; then
    echo "mandala/ está em dia com $ORIGEM"
    exit 0
  fi
  echo
  echo "divergiu — rode sem --verificar para atualizar. Diferenças:"
  for par in "${ITENS[@]}"; do
    de="${par%%|*}"; para="${par#*|}"
    diff -rq "$ORIGEM/$de" "$DESTINO/$para" 2>&1 | sed 's/^/    /' || true
  done
  exit 1
fi

if [ "$divergiu" = 0 ]; then
  echo "nada a fazer: já está idêntico"
  exit 0
fi

# ---------------------------------------------------------------- publicação
# Publicar estado não commitado lá é como o commit daqui passa a apontar para
# uma versão que não existe em nenhum histórico.
if [ -n "$(git -C "$ORIGEM" status --porcelain 2>/dev/null)" ] && [ "$FORCAR" = 0 ]; then
  echo >&2
  echo "há alterações não commitadas em $ORIGEM:" >&2
  git -C "$ORIGEM" status --short >&2
  echo >&2
  echo "commite lá antes de publicar, ou passe --forcar." >&2
  exit 1
fi

echo
for par in "${ITENS[@]}"; do
  de="${par%%|*}"; para="${par#*|}"
  # -R para a pasta img; --delete não existe no cp do macOS, então img/ é
  # apagada antes para que arquivo removido lá suma aqui também.
  if [ -d "$ORIGEM/$de" ]; then
    rm -rf "${DESTINO:?}/$para"
    cp -R "$ORIGEM/$de" "$DESTINO/$para"
  else
    cp "$ORIGEM/$de" "$DESTINO/$para"
  fi
  printf '  → %s\n' "$para"
done

echo
echo "atualizado a partir de $ORIGEM"
if commit=$(git -C "$ORIGEM" rev-parse --short HEAD 2>/dev/null); then
  echo "  origem em $commit — $(git -C "$ORIGEM" log -1 --format=%s)"
fi
echo
echo "falta commitar e empurrar (o Pages publica em ~1 min):"
echo "  git add mandala && git commit && git push"
echo
git -C "$SITE" status --short -- mandala | sed 's/^/  /'
