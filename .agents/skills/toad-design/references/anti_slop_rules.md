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
