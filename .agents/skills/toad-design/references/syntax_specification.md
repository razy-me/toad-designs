# TOAD Ground-Truth Syntax & Language Specification

> **Status**: Canonical DSL Reference for `.toad` & `.toadm`.

---

## 1. Top-Level Directives & Variables

```toad
// 1. Font registration (max 2 families per file to satisfy SLOP-WEB-002!)
@font "Space Grotesk" bold;
@font "Inter" regular medium bold;
// Or local font files:
@font "./fonts/CustomSans.ttf" as "CustomSans" regular bold;

// 2. Token Imports
@import "./tokens.toad";

// 3. Variables: Use '>' for BOTH declaration and reference (NEVER '$var' or '--var'!)
>bg = #030712;
>surface = #0f172a;
>ink_primary = #f8fafc;
>ink_muted = #e2e8f0;
>accent = #38bdf8;
>radius_card = 12px;

// 4. Canvas block: Supports dimensions or standard presets
canvas 1440px 1024px #030712 {
  // Elements live here
}
```

### Canvas Presets
- `social-post`: 1080px × 1080px (1:1 Square)
- `story`: 1080px × 1920px (9:16 Vertical)
- `youtube-thumb`: 1280px × 720px (16:9 Landscape)
- `presentation`: 1920px × 1080px (16:9 Full HD)
- `banner`: 1920px × 1080px (16:9 Full HD)
- `twitter-header`: 1500px × 500px (3:1 Ultra-Wide Banner)
- `dribbble-shot`: 1600px × 1200px (4:3 Showcase)
- `desktop-hd`: 1440px × 1024px (Desktop UI Viewport)
- `macbook-air`: 1280px × 832px (Laptop UI Viewport)
- `iphone-15-pro`: 393px × 852px (Mobile UI Viewport)
- `a3`: 297mm × 420mm (Print Poster, supports `bleed: 3mm;`)
- `a4`: 210mm × 297mm (Print Document, supports `bleed: 3mm;`)

---

## 2. The 16 Element Signatures

**Signature Rule**: `#id` ALWAYS precedes the `"Label"` / `"Content"` string!
`element #id "Label" { ... }`

### Containers
1. **`stack`**: Auto-layout flexbox container
   ```toad
   stack #card "Metrics Card" {
     at: 120px 176px;
     size: 464px 424px;
     direction: vertical;      // or horizontal
     gap: 16px;
     padding: 24px;
     justify: start;           // start | center | end | space-between | space-around
     align: start;             // start | center | end | stretch
     fill: >surface;
     radius: 12px;
   }
   ```
2. **`grid`**: Uniform or structured column/row grid
   ```toad
   grid #kpi_grid "KPI Overview" {
     at: 120px 648px;
     size: 1200px 176px;
     columns: 3;
     rows: 1;
     gap: 24px;
   }
   ```
3. **`group`**: Grouping container for absolute positioning or emblems
   ```toad
   group #emblem "Graphic Emblem" {
     at: center of canvas;
     size: 320px 320px;
   }
   ```

### Primitives
4. **`rect`**:
   ```toad
   rect #badge "Badge Background" {
     size: 140px 32px;
     radius: 6px;
     fill: alpha(>accent, 0.12);
     stroke: >accent 1px;
   }
   ```
5. **`circle`**:
   ```toad
   circle #indicator "Status Orb" {
     at: 24px 24px;
     radius: 8px;
     fill: >ink_emerald;
     glow: rgba(110, 231, 183, 0.35) 12px;
   }
   ```
6. **`text`**:
   ```toad
   text #title "SYSTEM TELEMETRY\nACTIVE REGION" {
     font-family: "Space Grotesk";
     font-weight: bold;
     font-size: 36px;
     line-height: 44px;        // ALWAYS pair font-size with 4px-multiple line-height!
     letter-spacing: 1.5px;    // MANDATORY on uppercase text (SLOP-TYPE-004)!
     fill: >ink_primary;
     size: 400px;              // Single width value auto-wraps and calculates height
   }
   ```
7. **`path`**: SVG vector path
   ```toad
   path #wave "Wave Graphic" {
     d: "M 0 50 Q 50 0 100 50 T 200 50";
     stroke: >accent 2px;
     fill: none;
   }
   ```
8. **`polygon`**:
   ```toad
   polygon #chevron "Direction Chevron" {
     points: (0 0, 40 0, 20 36);
     fill: >accent;
   }
   ```
9. **`image`**:
   ```toad
   image #hero_img "assets/hero.png" {
     size: 600px 400px;
     radius: 12px;
     fit: cover;               // cover | contain | fill
   }
   ```

### Procedural Shapes (Use Keyword DIRECTLY — Never write `shape "star"`!)
10. **`star`**: `star #sparkle "Deco" { points: 8; inner-radius: 36%; size: 48px 48px; fill: >accent; }`
11. **`triangle`**: `triangle #arrow_up "Indicator" { direction: "up"; size: 16px 16px; fill: >ink_emerald; }`
12. **`arrow`**: `arrow #dir "Flow" { head-size: 12px; shaft-width: 4px; size: 32px 16px; }`
13. **`cross`**: `cross #plus "Add" { thickness: 4px; size: 24px 24px; fill: >ink_primary; }`

### Vectors, Codes & Special Elements
14. **`icon`**: Lucide icons built-in
    ```toad
    icon #stat_icon "activity" {
      size: 20px;
      stroke: >accent 2px;
    }
    ```
15. **`qrcode`**:
    ```toad
    qrcode #portal "https://toad.design" {
      size: 96px;
      color: >ink_primary;
      background: transparent;
    }
    ```
16. **`barcode`**:
    ```toad
    barcode #sku "9783161484100" {
      size: 200px 56px;
      format: "ean13";
      color: >ink_primary;
    }
    ```
17. **`adjust`**: Non-destructive adjustment layer
    ```toad
    adjust #post_fx "Color Grading" {
      brightness: 105%;
      contrast: 110%;
      saturation: 95%;
    }
    ```

---

## 3. Positioning & Layout Math

- **Absolute Coordinates**: `at: 120px 64px;`
- **Relative Positioning**:
  - `at: below #title offset 16px;`
  - `at: above #footer offset 24px;`
  - `at: right of #sidebar offset 32px;`
  - `at: left of #badge offset 16px;`
- **Canvas Anchors**:
  - `at: center of canvas;`
  - `at: top-left of canvas;`
  - `at: top-right of canvas;`
  - `at: bottom-left of canvas;`
  - `at: bottom-right of canvas;`
  - `at: center of #container;`

## 4. Paint, Stroke & Visual Effects

- **Fill**:
  - Solid: `fill: >bg;` or `fill: #030712;`
  - Alpha: `fill: alpha(#38bdf8, 0.15);`
  - Linear Gradient: `fill: linear-gradient(180deg, #030712 0%, #0f172a 100%);` (Always `deg`, never `to bottom`!)
- **Stroke**:
  - `stroke: >border 1px;`
  - `stroke: #38bdf8 2px dashed;`
- **Shadow**: `shadow: 0px 12px 24px rgba(0, 0, 0, 0.14);` (Always space-separated, alpha <= 0.16).
- **Glow**: `glow: rgba(56, 189, 248, 0.30) 16px;` (alpha >= 0.20).
- **Backdrop Blur (Glassmorphism)**: `backdrop-blur: 16px;`
- **Blend Mode**: `blend-mode: multiply;` (normal, multiply, screen, overlay, darken, lighten, color-dodge, color-burn).
