# AGENTS.md

Context for AI assistants working on this repo.

## What this is

Personal/professional landing page for **Alex Falcão** (alexfalcao.pro.br). Single static page, **vanilla HTML/CSS/JS**, no framework, no build step. The entire site is `index.html` (CSS and JS are embedded).

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

## Verifying changes

There's no test suite. Verify visually by rendering `index.html` in a headless browser and screenshotting at desktop (~1180px) and mobile (~390px) widths; check there's no horizontal overflow (`scrollWidth === clientWidth`).

## Facts (so you don't re-derive)

- Live app: **AtivoSmart** (iOS + web) — real in-app screenshots in `images/ativosmart/`. In progress: **Garrafa Certa**.
- Research: master's **HealthRank**, Informática em Saúde, UNIFESP (orient. Prof. Dr. Daniel Sigulem); MBA (FGV).
- Profiles: LinkedIn/GitHub/Instagram `@alexjfalcao`; MakerWorld `@alexjfalcao`; Cults3D `/usuarios/alexjfalcao`; e-mail `alexjfalcao@gmail.com`.
- Through-line: "Abrir caminhos é remover obstáculos" (networks route paths; the strophalos of Hecate opens crossroads).
