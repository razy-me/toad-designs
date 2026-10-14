# TOAD Layout Math, Typography Scale & Skeletons

> **Retrieval Anchors**: 4px-Quantum Grid, Negative Space Math, Golden-Ratio Skeletons.

---

## 1. The 4px-Quantum Grid Law

Every structural dimension in `.toad` must follow modular arithmetic:
- **X and Y Coordinates**: Multiples of `4px` or `8px`.
- **Width and Height**: Multiples of `4px` or `8px`.
- **Gap and Padding**: Multiples of `4px` or `8px`.
- **Line Heights**: Multiples of `4px`.

### Mandatory Line-Height Lookup Table

| Role | `font-size` | Mandatory `line-height` | 1-Line Height | 2-Line Height | Tracking / Spacing |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Micro / Tag** | `12px` | `16px` | `16px` | `32px` | `1.5px` (if uppercase) |
| **Caption / Meta** | `14px` | `20px` | `20px` | `40px` | `1.5px` (if uppercase) |
| **Button Label** | `14px` | `24px` | `24px` | `48px` | `1.5px` with `padding: 12px 20px;` |
| **Body Regular** | `16px` | `24px` | `24px` | `48px` | `0px` |
| **Lead Copy** | `18px` / `20px` | `28px` | `28px` | `56px` | `-0.2px` |
| **H3 / Card Header**| `24px` | `32px` | `32px` | `64px` | `-0.5px` |
| **H2 / Section Title**| `36px` | `44px` | `44px` | `88px` | `-1px` |
| **H1 / Display** | `48px` | `60px` | `60px` | `120px` | `-1px` |
| **Hero Title** | `64px` | `76px` | `76px` | `152px` | `-1.5px` |
| **Mega Poster** | `88px` | `104px` | `104px` | `208px` | `-2px` |

---

## 2. The 4 Golden-Ratio Skeletons (40%–55% Negative Space)

### 1. `DESKTOP_BENTO_1440x1024` (Dashboards, DevTools, Telemetry)
- **Canvas**: `canvas 1440px 1024px #030712` ($W/H = 1.406 \le 1.50$, immune to spine gutter check).
- **Safe Margins**: Left/Right `120px`, Top/Bottom `64px` (Inner Width $= 1200\text{px}$).
- **Geometry**:
  - `#header_bar`: `at: 120px 64px; size: 1200px 64px;`
  - `#hero_card`: `at: 120px 176px; size: 464px 424px;`
  - `#chart_card`: `at: 616px 176px; size: 704px 424px;`
  - `#kpi_grid`: `at: 120px 648px; size: 1200px 176px; columns: 3; gap: 24px;`
- **Whitespace**: Exactly **`40%`** ($\to 100/100$ Grade A+).

### 2. `SWISS_POSTER_1200x1600` (Exhibition, Architecture, Events)
- **Canvas**: `canvas 1200px 1600px #f3efe6`
- **Safe Margins**: `80px` all around (Inner Width $= 1040\text{px}$).
- **Geometry**:
  - `#top_meta`: `at: 80px 80px; size: 1040px 72px;`
  - `#emblem`: `at: 280px 248px; size: 640px 560px;`
  - `#title_block`: `at: 80px 952px; size: 1040px 344px;`
  - `#colophon_grid`: `at: 80px 1376px; size: 1040px 144px; columns: 3; gap: 40px;`

### 3. `SOCIAL_SQUARE_1080x1080` (Instagram, Drops, Album Covers)
- **Canvas**: `canvas social-post #0c0a09` (`1080px × 1080px`)
- **Safe Margins**: Left/Right `80px`, Top/Bottom `64px` (Inner Width $= 920\text{px}$).
- **Geometry**:
  - `#top_bar`: `at: 80px 64px; size: 920px 48px;`
  - `#center_visual`: `at: 160px 176px; size: 760px 520px;`
  - `#bottom_stack`: `at: 80px 760px; size: 920px 240px;`

### 4. `EDITORIAL_SPREAD_1920x1080` (Keynotes, Showcases, Presentations)
- **Canvas**: `canvas presentation #090d16` (`1920px × 1080px`)
- **Safe Margins**: Left/Right `160px`, Top/Bottom `80px` (Inner Width $= 1600\text{px}$).
- **Geometry**:
  - `#nav_header`: `at: 160px 80px; size: 1600px 64px;`
  - `#editorial_left`: `at: 160px 208px; size: 720px 680px;`
  - `#visual_right`: `at: 944px 208px; size: 816px 680px;`
