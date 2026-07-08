# Design — alexfalcao.pro.br

Visual system for the personal landing page. Register: **brand** (design is the product). Strategy: **committed / drenched** — a single deep indigo-navy carries the surface, with one moonlight-cyan accent. See [PRODUCT.md](PRODUCT.md) for who/what/why.

All tokens live in the `:root` block of the `<style>` element in `index.html`. This file is the reference; `index.html` is the source of truth.

---

## Theme

Dark, nocturnal, single-theme (no light mode). The mood is a night observatory / astrolabe: precise instruments in low light. The deep navy reads as focus and seniority; the moonlight accent is the only "light source" and is used sparingly so it always means *interactive* or *important*.

**Aesthetic anti-references:** navy-and-gold fintech, generic dark SaaS, editorial-serif-with-drop-caps, costume-y occult clip art. The esoteric note (strophalos of Hecate) stays a faint signature, never a theme.

---

## Color

Deep indigo-navy ramp + one cool accent. Tokens are hex/rgba (not OKLCH) for legibility in a hand-authored single file.

### Surfaces (dark → light)

| Token | Value | Use |
|---|---|---|
| `--void` | `#070b14` | Deepest — footer, veils, insets |
| `--ink` | `#0a1120` | Page background |
| `--abyss` | `#0d1526` | Cards / panels base |
| `--surface` | `#121d32` | Raised surfaces, panel gradients |
| `--surface-2` | `#17253d` | Hover surfaces |

### Text (contrast-checked on `--ink`)

| Token | Value | Use |
|---|---|---|
| `--text` | `#eef2fb` | Primary text |
| `--mist` | `#c3d1e6` | Bright secondary |
| `--haze` | `#93a7c6` | Muted secondary — passes WCAG AA (~7:1) on `--ink` |

### Accent & signal

| Token | Value | Use |
|---|---|---|
| `--accent` | `#6fb4d8` | Moonlight cyan — interactive, links, glyph glow, primary button |
| `--accent-soft` | `#a2cfe8` | Hover/highlight, small emphasis |
| `--accent-deep` | `#3f7ea0` | Gradients, bar fills |
| `--violet` | `#9585c9` | Rare esoteric whisper (reserved) |
| `--up` | `#7cd7a6` | Positive / "live" status |

### Lines & effects

- `--line: rgba(150,172,212,.14)` — hairline dividers/borders.
- `--line-strong: rgba(150,172,212,.30)` — stronger borders, inputs, buttons.
- `--glow: 0 0 40px rgba(111,180,216,.25)` — accent glow on hover.

**Rules:** the accent never carries body text on dark. Gray-on-colored is avoided — muted text is a tint of the navy hue (`--haze`), not neutral gray. Primary button is `--accent` background with a near-black ink text (`#04121c`) for contrast.

---

## Typography

Three families on distinct contrast axes (classical serif + humanist grotesque + technical mono). None are AI-default fonts.

| Role | Family | Weights | Notes |
|---|---|---|---|
| Display / headings | **Marcellus** | 400 | Inscriptional, Roman-capital feel — the "initiatory / astrolabe" voice. `letter-spacing: -0.01em`, `text-wrap: balance`. |
| Body / UI | **Hanken Grotesk** | 400/500/600/700 | Clean, warm grotesque. `line-height: 1.6`. |
| Labels / coordinates | **Spline Sans Mono** | 400/500 | Small caps-y technical labels (section tags, statuses, captions), `letter-spacing` 0.06–0.22em. |

### Fluid scale (`clamp()`)

`--step--1` … `--step-4` drive a ~1.25+ modular scale:

```
--step--1: clamp(0.82rem, ... , 0.9rem)   /* fine print */
--step-0:  clamp(1rem,    ... , 1.12rem)  /* body */
--step-1:  clamp(1.2rem,  ... , 1.5rem)   /* sub-headings, app name */
--step-2:  clamp(1.5rem,  ... , 2.1rem)   /* card titles */
--step-3:  clamp(2rem,    ... , 3.1rem)   /* section h2 */
--step-4:  clamp(2.8rem,  ... , 5.4rem)   /* hero h1 */
```

Hero `h1` letter-spacing is `-0.03em` (never below the -0.04em floor). Prose uses `text-wrap: pretty`; headings use `text-wrap: balance`. Body line length is capped via `max-width` in `ch` (~44–65ch).

---

## Layout & spacing

- Content container `.wrap`: `max-width: 1160px`, fluid side padding `clamp(20px, 4vw, 40px)`.
- Section rhythm `.band`: `padding: clamp(64px, 9vw, 120px) 0`.
- Vertical rhythm varies deliberately (generous section gaps, tight groupings inside).
- Grids use `repeat(auto-fit, minmax(...))` for breakpoint-free responsiveness where possible.
- **Breakpoints:** `820px` (hero/feature → single column, nav links hidden), `680/760px` (grids collapse), `560px` (gallery wide → single, lightbox controls tighten).
- **z-index scale (semantic):** `--z-nav: 100`, `--z-overlay: 200`; the lightbox uses the native `<dialog>` top layer.

---

## Radii, borders, shadows

- **Radii:** cards/panels `12–16px`; buttons/inputs `8–10px`; pills/tags `999px`; app icon `14px`. (No 24px+ over-rounding.)
- **Borders:** 1px, `--line` / `--line-strong`. No colored side-stripe accents.
- **Shadows:** used sparingly for depth (portrait, app icon, lightbox). Never paired with a 1px border as decoration.

---

## Motion

- **Easing:** `--ease: cubic-bezier(0.19, 1, 0.22, 1)` (ease-out-expo). No bounce/elastic.
- **Reveal on scroll:** `.reveal` fades/slides in via IntersectionObserver; content is visible by default and a `load` failsafe reveals everything after 1.6s (never ships blank in background tabs / crawlers).
- **Counters:** indicators count up (ease-out-quart) when in view.
- **Strophalos:** `.spin` rotates 360° over 240s (very slow).
- **Hover materials:** transform, `filter`, glow, backdrop-blur, gradient masks.
- **Reduced motion:** every animation has a `@media (prefers-reduced-motion: reduce)` off/instant path (rotation, counters, reveals, gallery/lightbox transitions).

---

## Signature motifs

- **Strophalos (wheel of Hecate):** a single inline `<svg>` `<symbol id="strophalos">` reused as brand mark, watermark (low opacity, `.spin`), and in the closing quote. Inline SVG = crisp, themeable via `currentColor`, no missing-asset risk.
- **Network / ley-line mesh:** thin connected nodes behind the hero (draw-in animation) — networking paths doubling as crossroads.
- **Starfield veil:** fixed, pointer-events-none radial-gradient dust over the page background.

---

## Components

- **Nav** — sticky, transparent → blurred with a hairline border on scroll (`.scrolled`). Underline-grow link hovers; ghost "Contato" CTA.
- **Buttons** — `.btn-primary` (accent fill, glow on hover), `.btn-ghost` (bordered). Arrow nudges right on hover.
- **Indicators** — 4-up stat band with animated counters (Marcellus numerals, mono labels).
- **Expertise grid** — 4 cells, hairline-joined, hover surface lift; tech **chips** (mono, pill, accent border on hover) grouped by category.
- **Timeline** — vertical line with node dots; mono year label + Marcellus role.
- **Project cards** (`.proj`) — split art panel + body. AtivoSmart's art panel holds the app header (icon + name) and a **scroll-snap filmstrip** (`.appshots` / `.appshot`) of real screenshots; Garrafa Certa uses a mini "cellar" bar viz.
- **3D gallery** (`.gallery` / `.shot`) — image cards with a calming navy veil (`::after`) + reduced-saturation filter by default, "waking" to full color on hover/focus; hover caption + zoom affordance.
- **Lightbox** (`.lightbox`, native `<dialog>`) — generic viewer for any `data-lb-group`; full-color image (no veil), caption, prev/next, close, backdrop-click, `Esc`, arrow keys. Groups cycle independently.
- **Link hub** — icon + title + mono handle rows, hover slide + accent border.

---

## Imagery

- **Portrait:** `images/alexfalcao.jpg`, framed, `object-fit: cover` at 4:5.
- **3D photos:** `images/3d/peca-0X.jpeg` — real prints, calmed by CSS (see gallery component).
- **AtivoSmart:** `images/ativosmart/` — app icon (`.png`) + 5 real in-app screenshots (`.jpg`).
- **Strophalos:** inline `<svg>` in `index.html` — no image file.
- Raster assets are downscaled/compressed for web. Keep a copy of any source/original outside the repo before overwriting.

---

## Accessibility

- Body text ≥ 4.5:1; large text ≥ 3:1. Muted text uses `--haze` (AA on `--ink`).
- Full keyboard support: gallery/app items are `role="button"` + `tabindex="0"` with `:focus-visible` outlines; lightbox is a native modal `<dialog>` (focus trap + `Esc`).
- Descriptive `alt` on all meaningful images; decorative SVGs are `aria-hidden`.
- Content renders without JavaScript; motion only enhances. `prefers-reduced-motion` honored throughout.
