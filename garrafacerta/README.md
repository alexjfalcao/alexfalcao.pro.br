# garrafacerta/

Depósito de imagens para a publicação automática de posts do Instagram
(@garrafacerta), via a integração Windsor.ai — não é conteúdo do site.

A API de carrossel do Instagram exige URLs públicas para as imagens; este
repositório já é público e servido pelo GitHub Pages, então serve como host
sem depender de outro serviço.

Não confundir com `images/garrafacerta/` (screenshots usados no card do
projeto Garrafa Certa na própria landing page) — pastas com propósitos
diferentes, mesmo nome de app.

## Convenção

Cada post ganha uma subpasta em `posts/`, nomeada `AAAA-MM-DD-slug-curto/`,
contendo as imagens finais prontas para publicar (`slide_1.jpg`, `slide_2.jpg`, ...).

URL resultante:
`https://www.alexfalcao.pro.br/garrafacerta/posts/<pasta>/<arquivo>`

Não é linkado de `index.html` nem listado em `sitemap.xml` — é só
hospedagem, não uma página do site.

As subpastas de posts antigos podem ser removidas depois que o post já foi
publicado e não há mais necessidade da URL pública (o Instagram não
depende do link continuar no ar após a publicação).
