# Alex Falcão — Landing Page

Landing page pessoal e profissional de **Alex Falcão**, desenvolvida em **HTML, CSS e JavaScript puro** (sem frameworks, sem build). É uma vitrine curada — não um currículo online — que apresenta trajetória, áreas de atuação, projetos, pesquisa e impressão 3D.

**Domínio:** www.alexfalcao.pro.br

> _"Abrir caminhos é remover obstáculos."_ — o fio condutor do site: redes roteiam caminhos, o strophalos de Hécate abre encruzilhadas, e a impressão 3D leva a ideia à realidade.

---

## Stack

- **HTML5** semântico, arquivo único (`index.html`) com CSS e JS embutidos.
- **CSS** moderno: custom properties, `clamp()` fluido, grid/flex, `backdrop-filter`, escala de `z-index` semântica.
- **JavaScript** vanilla (um único IIFE, sem dependências): navbar no scroll, contadores animados, reveal on scroll com _failsafe_, e um lightbox genérico com `<dialog>` nativo.
- **Fontes** (Google Fonts): `Marcellus` (títulos), `Hanken Grotesk` (corpo/UI), `Spline Sans Mono` (rótulos técnicos).
- Sem dependências, sem etapa de build. Basta servir os arquivos estáticos.

A identidade visual completa (paleta, tipografia, tokens, componentes, motion) está documentada em **[DESIGN.md](DESIGN.md)**. A estratégia da marca (público, propósito, princípios) está em **[PRODUCT.md](PRODUCT.md)**.

---

## Estrutura da página

Ordem das seções (âncoras entre parênteses):

1. **Hero** — nome, "Construo caminhos.", foto, CTAs; strophalos + malha de rede ao fundo.
2. **Indicadores** — 30+ anos em TI · 15+ anos em redes/liderança · 10+ anos de 3D · 1 app no ar (contadores animados).
3. **Atuação** (`#atuacao`) — 4 áreas + chips das tecnologias usadas.
4. **Trajetória** (`#trajetoria`) — timeline: telecom → provedores/operadoras → bancos globais → Santander → hoje.
5. **Projetos** (`#projetos`) — **AtivoSmart** (no ar, com telas reais do app) e **Garrafa Certa** (em breve).
6. **Pesquisa** (`#pesquisa`) — mestrado **HealthRank** (UNIFESP) + MBA (FGV) + graduação.
7. **Impressão 3D** (`#bancada`) — galeria de peças + links para MakerWorld e Cults3D.
8. **Frase** — strophalos + "Abrir caminhos é remover obstáculos."
9. **Contato** (`#contato`) — chamada + hub de links (LinkedIn, GitHub, Instagram, MakerWorld, Cults3D, e-mail).
10. **Rodapé**.

---

## Recursos interativos

- **Lightbox genérico** — qualquer galeria marcada com `data-lb-group` (com filhos `data-lb-item`) abre em tela cheia, em cor plena, via `<dialog>` nativo. Cada grupo navega de forma independente (setas ‹ ›, `Esc`, clique no fundo). Usado nas **fotos 3D** e nas **telas do AtivoSmart**.
- **Filmstrip do AtivoSmart** — as telas reais do app em faixa rolável horizontal; toque/clique amplia no lightbox.
- **Galeria 3D "calma"** — as fotos recebem um véu azul-marinho + leve dessaturação por CSS para integrar à paleta; "acendem" (cor plena) no hover/foco e no lightbox.
- **Motion** — entradas em scroll, contadores, strophalos girando lentamente. Tudo respeita `prefers-reduced-motion`; o conteúdo é visível sem JS (o JS só aprimora).

---

## Estrutura de arquivos

```
/
├── index.html                 # a página inteira (HTML + CSS + JS embutidos)
├── PRODUCT.md                 # estratégia da marca (público, propósito, princípios)
├── DESIGN.md                  # sistema de design (cores, tipografia, componentes, motion)
├── AGENTS.md                  # contexto para assistentes de IA
├── robots.txt · sitemap.xml   # básico de SEO
└── images/
    ├── alexfalcao.jpg         # retrato do hero
    ├── 3d/peca-01..05.jpeg    # fotos de impressão 3D (galeria)
    └── ativosmart/            # ícone (.png) + telas reais do app (.jpg)
```

> O strophalos do site é **SVG inline** no `index.html` — não há arquivo de imagem para ele.

O site é **self-contained** no `index.html` — todo o CSS e JS estão embutidos, sem dependências nem etapa de build.

---

## Como atualizar

**Trocar/adicionar fotos de impressão 3D:** substitua os arquivos em `images/3d/`. A galeria usa `<figure class="shot" data-lb-item>` com um `<img>` e uma `<figcaption class="cap">`. Mantenha a proporção ~4:5 (a foto do card largo é ~16:10). Otimize para a web (máx. ~1600px, JPG q≈82).

**Trocar/adicionar telas do AtivoSmart:** substitua os `.jpg` em `images/ativosmart/`. Cada tela é um `<figure class="appshot" data-lb-item data-lb-src="..." data-lb-cap="...">`. Otimize (máx. ~1300px de altura, JPG q≈80).

**Ajustar cores/tipografia:** todos os tokens estão no bloco `:root` do `<style>` em `index.html`. Ver **[DESIGN.md](DESIGN.md)**.

**Links sociais / de contato:** editados diretamente nas seções `#contato` e Impressão 3D do `index.html`.

---

## Rodar localmente

Qualquer servidor estático serve. Exemplos:

```bash
python3 -m http.server 8000
# ou
npx serve .
```

Depois abra `http://localhost:8000`. (Abrir o arquivo direto com `file://` também funciona, mas um servidor evita restrições de origem.)

As fontes vêm do Google Fonts, então a primeira carga precisa de internet.

---

## Deploy

São arquivos estáticos — publique em qualquer host estático (Netlify, Vercel, Cloudflare Pages, GitHub Pages, S3/CloudFront). Aponte o domínio `alexfalcao.pro.br` para o host. Não há passo de build.

---

## Roadmap

- Link real da App Store quando o AtivoSmart publicar.
- Mockups/telas do Garrafa Certa.
- Open Graph com imagem dedicada; `sitemap.xml` completo quando houver mais páginas.
- Opcional: modo claro, blog técnico, timeline de carreira detalhada.
