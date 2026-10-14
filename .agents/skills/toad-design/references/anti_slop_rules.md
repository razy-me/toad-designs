# TOAD Anti-AI-Slop Laws & Heuristics Reference

> [!WARNING]
> Any single `fatal` Anti-Slop violation instantly deducts up to 35 points and caps the overall Design Auditor score at **`78%` (`Grade C+`)**, failing the agency gold standard.

---

## 1. The Banned AI-Slop Hex List (`SLOP-WEB-001`)

Never use raw, saturated default AI palette hexes:
- ❌ `#8b5cf6` (Vivid generic purple)
- ❌ `#06b6d4` (Raw cyan)
- ❌ `#6366f1` (Generic indigo)
- ❌ `#ec4899` (Raw pink)
- ❌ `#00ffff` (Pure electric cyan)
- ❌ `#ff00ff` (Pure electric magenta)
- ❌ `#00ff00` (Pure neon green)

**Replacement Strategy**: Use the pre-calculated, nuanced semantic tokens defined in `visual_archetypes.md`.

---

## 2. Banned Green Polarity (`SLOP-DASH-005` — Fatal Violation)

- **The Trap**: Labeling negative metric changes, latency, errors, or losses in green text (`#10b981`, `#22c55e`, `#6ee7b7`).
- **The Rule**: Text containing `-X%`, `error`, `errors`, `churn`, `drop`, `loss`, `failure`, `latenz`, or `packet loss` must NEVER be colored in green.
- **Critical Catch**: Even `"0 ERRORS"` in green triggers `SLOP-DASH-005`!
- **Safe Alternatives**:
  - Color error/drop metrics in neutral gray (`>ink_secondary`) or crimson (`#f87171` / `#ef4444`).
  - Reframe status strings positively: write `"STATUS: NOMINAL"` or `"ZERO CONTENTION"` instead of `"0 ERRORS"`.

---

## 3. The 4px-Quantum Grid Law (`SLOP-WEB-021` & `SLOP-TYPE-014` — Fatal)

- **The Calculation**:
  `SLOP-WEB-021` inspects every element coordinate and flags:
  $$\text{round}(x) \bmod 8 \in \{1, 7\} \quad \text{OR} \quad \text{round}(y) \bmod 8 \in \{1, 7\}$$
  Notice that $\bmod 8 \in \{1, 7\}$ only happens on ODD coordinates.
- **The Immunity Rule**:
  1. Every `at: X Y;`, `size: W H;`, `gap:`, `padding:`, and explicit `line-height:` MUST be a multiple of `4px` (prefer `8px`).
  2. Inside vertical `stack` containers, always use `align: start;` so text X positions don't drift onto odd pixel boundaries.
  3. Never use centered alignment on odd-width strings inside fixed pills; use explicit `padding: 12px 20px;`.

---

## 4. Typography Discipline (`SLOP-TYPE-*` & `SLOP-WEB-002`)

1. **Max 2 Font Families** (`SLOP-WEB-002`):
   - Never register or use more than 2 font families in one document.
2. **Mandatory 4px-Multiple Line-Height** (`SLOP-TYPE-001`):
   - NEVER use unitless `line-height` (`1.4`, `1.5`) or omit line-height.
   - Use the lookup table:
     - `12px -> 16px`
     - `13px / 14px -> 20px`
     - `16px -> 24px`
     - `18px / 20px -> 28px`
     - `24px -> 32px`
     - `36px -> 44px`
     - `40px -> 48px`
     - `48px -> 60px`
     - `88px -> 104px`
3. **Uppercase Tracking** (`SLOP-TYPE-004`):
   - Every ALL-CAPS `text` node MUST declare `letter-spacing: 1.5px;` or `letter-spacing: 2px;`.
4. **Punctuation Cleanliness** (`SLOP-TYPE-009`):
   - Never use more than one em-dash (`—`) per text element.

---

## 5. Container & Whitespace Discipline (`SLOP-WEB-007` & `SLOP-WEB-008`)

1. **Card Radius Discipline** (`SLOP-WEB-007`):
   - Keep card `radius:` between `8px` and `16px` (`12px` is standard).
   - Never apply `radius: >= 24px` to large content cards.
2. **Negative Space Budget** (`SLOP-WEB-008`):
   - Canvas whitespace must remain between **40% and 65%**.
   - Root-level content containers must cover 35%–60% of the canvas area.
3. **Spine Gutter Rule** (`SLOP-PRINT-010`):
   - On wide landscape canvases ($W > 1.5H$), keep text at least `30px` away from the horizontal center line $X = W / 2$.

---

## 6. Wave 2 Anti-AI-Slop Catalog (107 Total Active Heuristics)

### A. Web & SaaS-Layouts (`SLOP-WEB-022` to `028`)
- **`SLOP-WEB-022` (Faux Command-K Badge):** Decorative `⌘K` or `Ctrl+K` badges in search fields within static layouts without interactive search handlers.
- **`SLOP-WEB-023` (Symmetric 3-Tier Pricing Cliché):** 3 pricing cards where the middle card uses `scale(1.05)`, colored border, and `"MOST POPULAR"` pill, with identical feature row counts across all 3 cards.
- **`SLOP-WEB-024` (Monochrome Logo Marquee Soup):** Desaturated tech logo strips (`opacity: 0.35–0.55`) placed < 32px below the Hero CTA.
- **`SLOP-WEB-025` (50/50 Split-Screen Monotony):** 3+ consecutive sections alternating 50/50 split (text left, floating mockup right) without asymmetric grid variance.
- **`SLOP-WEB-026` (Detached Floating UI Snippets):** Isolated mini-UI cards (e.g. "+42% Conversion" toasts) tilted ±3°–8° overlapping hero images.
- **`SLOP-WEB-027` (Fake Trust-Star Cluster):** Generic 5-star ratings (`★★★★★ 4.9/5 from 2,000+ happy users`) adjacent to primary CTA without verifiable source anchor.
- **`SLOP-WEB-028` (Accordion FAQ Graveyard):** Bottom accordion list with symmetric `+` icons containing generic placeholder questions.

### B. UI/UX & Lighting Physics (`SLOP-UI-007` to `011`)
- **`SLOP-UI-008` (Fitts's Law Micro-Target):** Interactive controls with hitboxes < 32×32px (desktop) or < 44×44px (touch/mobile), or < 4px gap to adjacent interactive targets.
- **`SLOP-UI-009` (Phantom Overflow Clip):** Fixed-height containers (`overflow: hidden`) where the last child element clips through the bottom by 1px–18px.
- **`SLOP-UI-010` (Elevation Shadow Inversion):** Nested child element with larger blur radius or Y-offset in its shadow than its floating parent container.
- **`SLOP-UI-011` (Ghost Input CTA):** Single email input field with embedded pill button in hero area lacking label, validation space, or privacy notice.

### C. Typography & Micro-Typo (`SLOP-TYPE-021` to `027`)
- **`SLOP-TYPE-021` (Gradient Text Washout):** Text with `background-clip: text` having > 2 stops, local contrast drop under $|Lc| < 45$, or any gradient on font-size < 28px.
- **`SLOP-TYPE-022` (Faux-Bold / Synthesized Oblique):** Computationally skewed (`skewX`) or stroke-dilated text without native font cut.
- **`SLOP-TYPE-023` (Monospace Brutalist Cosplay):** Monospace fonts used for > 20% of text volume outside code snippets, telemetry tables, or technical IDs.
- **`SLOP-TYPE-024` (Optical Margin Neglect):** Display headlines (>= 48px) starting with quotes, `T`, `V`, `W`, `Y`, `O` lacking negative optical margin compensation (-0.04em to -0.08em).
- **`SLOP-TYPE-025` (Rivers of White):** Justified text (`text-align: justify`) without hyphenation creating word gaps > 0.45em aligning across 3+ lines.
- **`SLOP-TYPE-026` (Sawtooth Rag):** Left-aligned ragged text oscillating > 35% in line width between consecutive lines lacking `text-wrap: balance / pretty`.
- **`SLOP-TYPE-027` (Colon-Headline Syndrome):** Two-part AI headlines following `"[Abstract Buzzword]: [Generic Promise]"`.

### D. Colors & Gradients (`SLOP-COLOR-004` to `008`)
- **`SLOP-COLOR-004` (Chromostereopsis Vibration):** High-chroma complementary colors ($C_{\text{OKLCH}} > 0.20$) bordering at near-identical luminance ($\Delta L < 0.12$).
- **`SLOP-COLOR-005` (Dead Alpha-Gray Neutrals):** Secondary text or divider lines formed solely by alpha overlay on colored backgrounds rather than dedicated OKLCH neutral ramps.
- **`SLOP-COLOR-006` (Semantic Color Hijacking):** Reserved system state hues (Error Red, Warning Amber, Success Green) used for purely decorative illustrations or branding accents.
- **`SLOP-COLOR-007` (Dark-Mode Chroma Clipping):** Light-mode high-chroma accents ($C_{\text{OKLCH}} > 0.24$) unadjusted on dark surfaces ($L < 0.20$) without 15–25% chroma desaturation.
- **`SLOP-COLOR-008` (Banding-Prone Shallow Gradient):** Gradients > 400px with minimal luminance delta ($\Delta L < 0.08$) lacking dithering/noise.

### E. Vectors, Icons & Geometry (`SLOP-ICON-002` to `003`, `SLOP-GEOM-003` to `006`, `SLOP-GFX-014`)
- **`SLOP-ICON-002` (Icon Style Chimera):** Mixing solid/filled, outlined, and duotone icons or inconsistent stroke-linecap (`round` vs `square`) in the same section.
- **`SLOP-ICON-003` (Optical Icon Weight Imbalance):** Square solid icon and circular/diagonal icon sharing identical bounding box (24×24px) without optical area compensation.
- **`SLOP-GEOM-003` (Non-G2 Tangential Corner Break):** Containers >= 300px with corner radius >= 20px using hard $G^1$ arcs instead of smooth $G^2$ squircle curvature ($n \approx 4$).
- **`SLOP-GEOM-004` (Aspect-Ratio Uncanny Valley):** Containers slightly deviating from exact 1:1 square (1.02–1.06) or 16:9 widescreen (1.70–1.75).
- **`SLOP-GEOM-005` (Subpixel Coordinate Jitter):** Non-integer coordinates with subpixel fractions (e.g. `124.37px`).
- **`SLOP-GEOM-006` (Bento-Grid Gap Discordance):** Bento grids with inconsistent column/row gaps or mixed corner radii across adjacent cards.
- **`SLOP-GFX-014` (Mesh Gradient Mud Core):** Complex multi-point mesh gradients whose interpolation intersects gray/muddy RGB neutral zones.

### F. Print & Prepress Flightchecks (`SLOP-PRINT-012` to `014`)
- **`SLOP-PRINT-012` (Gutter Creep Denial):** Multi-page saddle-stitched print layouts without dynamic inner-margin creep allowance.
- **`SLOP-PRINT-013` (Missing Barcode Quiet Zone):** EAN/QR codes without mandatory white quiet zone (>= 5× narrow bar width or >= 3.5mm).
- **`SLOP-PRINT-014` (Deep Die-Cut Radius Trap):** Die-cut paths with internal corner radii < 1.5mm causing paper tears during high-speed stamping.

### G. Dashboards & Data Vis (`SLOP-DASH-006` to `010`)
- **`SLOP-DASH-006` (Floating Sparkline Amputation):** Sparkline charts lacking baseline, zero-axis, or min/max reference points.
- **`SLOP-DASH-007` (Donut Hole Anorexia):** Donut charts with ring thickness < 8% or > 40% of outer diameter.
- **`SLOP-DASH-008` (Percentage Sum Anomaly):** Part-to-whole charts whose percentage values sum to != 100.0% (tolerance ±0.5%).
- **`SLOP-DASH-009` (Rainbow Metric Spaghetti):** Line charts with > 4 lines colored in unrelated rainbow hues lacking direct data labels.
- **`SLOP-DASH-010` (Truncated K-Metric Blindness):** Metric cards displaying abbreviated integers (e.g. `"$1.2M"`) without full precision tooltip or secondary delta.

---

## 7. Accessibility, Prepress & Layout Hygiene Error Codes

- **`A11Y-HALATION-GLARE` (Warn):** Dark mode extreme contrast ($|Lc| \ge 106$, $L_{\text{OKLCH}} < 0.12$ bg vs $> 0.94$ fg) causing irradiation glare for astigmatic users.
- **`A11Y-CVD-COLLAPSE` (Fatal Error):** Viénot/Brettel CVD simulation indicates Deuteranopia, Protanopia, or Tritanopia perceptual delta $\Delta E_{\text{OKLCH}} < 0.06$ between semantically adjacent colors lacking secondary differentiators.
- **`PRINT-RICH-BLACK-TYPE` (Warn):** Text < 14pt (18.6px) or strokes <= 1pt in rich black ($C+M+Y > 0, K=100$) causing misregistration halos.
- **`PRINT-EFFECTIVE-PPI-DROP` (Warn < 250 PPI, Fatal Error < 150 PPI):** Image asset effective resolution calculation at physical print scale.
- **`PRINT-FOLD-GUILLOTINE` (Fatal Error):** Critical text or QR/barcodes within $\pm 3\text{mm}$ safety buffer of folding axes.
- **`PRINT-WHITE-OVERPRINT-TRAP` (Fatal Error):** Pure white vector or text elements set to `overprint: true`.
- **`DOM-REDUNDANT-WRAPPER` (Warn):** Redundant 1:1 wrapper without styling wrapping single child element.
- **`LAYOUT-Z-INDEX-SPAM` (Warn):** Arbitrary high z-index ($z \ge 100$) on non-modal element.

---

## 8. Mathematical Visual Telemetry Suite & Synergy Rules

- **`LAYOUT-AXIS-DRIFT`:** 1D projection axis analysis detects near-miss fluchtlinien drift ($1\text{px} \le \Delta \le 6\text{px}$) between structural siblings or primary column containers.
- **`TELEM-SPACING-ENTROPY`:** Micro-grid residual entropy verifies $\ge 90\%$ of spacings quantize cleanly to 4px multiples.
- **`TELEM-SACCADE-WHIPLASH`:** Salience trajectory graph flags reading saccades $> 135^\circ$ across $> 35\%$ viewport span.
- **`TELEM-CLUTTER-INDEX`:** Rosenholtz local feature congestion index ($\tau \le 0.35$ recommended under text containers).
- **`TELEM-FFT-SPECTRUM`:** 2D-FFT radial spatial frequency slope ($0.85 \le \alpha \le 1.25$ natural scene pink noise statistics).
- **`COMPOUND-SLOP-SYNERGY`:** Multiplier applying $1.5\times$ penalty weight when $\ge 3$ Anti-AI-Slop heuristics trigger simultaneously.
- **`Telemetry Soft-Cap`:** Hard ceiling capping overall score at **88% (`Grade B+`)** whenever $\ge 2$ mathematical telemetry thresholds are breached.
