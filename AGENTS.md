# AGENTS.md

Context for AI assistants working on this repo.

## What this is

Personal/professional landing page for **Alex Falcão** (alexfalcao.pro.br). Static, **vanilla HTML/CSS/JS**, no framework, no build step. The site itself is `index.html` (CSS and JS are embedded), plus `mandala/` — a published copy of a separate project (see below).

## Read first

- **[PRODUCT.md](PRODUCT.md)** — strategy: register (brand), users, purpose, brand personality, anti-references, design principles.
- **[DESIGN.md](DESIGN.md)** — visual system: color tokens, typography, motion, components. Tokens live in the `:root` block of `index.html` (the source of truth).
- **[README.md](README.md)** — structure, features, how to update, run, deploy.

## Working here

- **Edit `index.html` directly.** All CSS and JS are embedded in it; there are no separate stylesheet/script files.
- Keep the three-font system (Marcellus / Hanken Grotesk / Spline Sans Mono) and the navy + moonlight-cyan palette. Don't introduce AI-default fonts or navy-and-gold.
- The site is built with the `impeccable` design skill (register: brand). Prefer its conventions.
- Motion must keep `prefers-reduced-motion` fallbacks; content must remain visible without JS (reveals only enhance).
- **Images:** optimize new raster assets for web; keep a copy of any source/original outside the repo before overwriting. 3D photos → `images/3d/`; app screenshots → `images/ativosmart/`.
- **Lightbox is generic:** to make any gallery zoomable, wrap it with `data-lb-group` and mark each item `data-lb-item` (optionally `data-lb-src` / `data-lb-cap`).
- **`mandala/` is not authored here.** It is a copy of the Mandala Forge project (`~/Documents/Projetos/Mandala`): its `index.html`, `mandala-cloisonne.html` and `img/`. That repo is the source of truth — edit there and re-copy the three, never patch `mandala/` in place, or the next copy silently reverts it. **Do the copy with `./publicar.sh` here**, never by hand: `./publicar.sh --verificar` says whether `mandala/` matches its source, and the plain form pulls the files over (refusing while the source repo has uncommitted changes). It reads the source from `$MANDALA`, defaulting to `~/Documents/Projetos/Mandala`, and also brings that project's `LICENSE` in as `LICENSE.txt` — the app is AGPL-3.0 and the licence has to travel with it. Two past commits here — `e767a33` (Open Graph card) and `6e422b0` (footer) — broke this rule by editing `mandala/index.html` in place and only converged because they were back-ported by hand. It has its own design system (champagne accent on cold near-black) and does not follow this site's palette.
- **New page, three chores:** add it to `sitemap.xml`, link it from the relevant section of `index.html`, and give it Open Graph tags with a 1200×630 image of its own (`mandala/img/og.png` is the pattern — the page's own hero art on the page's own background, so the card matches what the click leads to).

## Verifying changes

There's no test suite. Verify visually by rendering `index.html` in a headless browser and screenshotting at desktop (~1180px) and mobile (~390px) widths; check there's no horizontal overflow (`scrollWidth === clientWidth`).

`file://` breaks the reveal-on-scroll and lazy images in some browsers — serve the folder (`python3 -m http.server`) and open it over `localhost`. Reveals are gated on class, so force them before screenshotting deep sections: `document.querySelectorAll('.reveal').forEach(e => e.classList.add('in'))`.

Deploy is GitHub Pages off `main` in this repo, custom domain via `CNAME` (`www.alexfalcao.pro.br`, apex redirects). A push builds in about a minute; `gh api repos/alexjfalcao/alexfalcao.pro.br/pages/builds/latest --jq .status` says when it is `built`.

## Facts (so you don't re-derive)

- Live: **AtivoSmart** (iOS + web, screenshots in `images/ativosmart/`), **Garrafa Certa** (iOS), **Mandala Forge** (this domain, `/mandala/`).
- **Mandala Forge** is a cloisonné mandala generator for 3D printing: it runs entirely in the browser and exports a 3MF that Bambu Studio opens with each color already on the right extruder. Gallery images under `mandala/img/` are real output of the generator.
- Research: master's **HealthRank**, Informática em Saúde, UNIFESP (orient. Prof. Dr. Daniel Sigulem); MBA (FGV).
- Profiles: LinkedIn/GitHub/Instagram `@alexjfalcao`; MakerWorld `@alexjfalcao`; Cults3D `/usuarios/alexjfalcao`; e-mail `alexjfalcao@gmail.com`.
- Through-line: "Abrir caminhos é remover obstáculos" (networks route paths; the strophalos of Hecate opens crossroads).
