# TOAD CLI, Tooling & AI Capabilities Reference

> **The Full TOAD Toolchain**: Everything available in the TOAD ecosystem to assist, validate, render, enhance, and optimize designs.

---

## 1. Compiler & Exporters (`toad build` / `toad <file>`)

Compile any `.toad` design file into high-fidelity raster, vector, PSD, or PDF files.

```bash
# Basic build (defaults to PNG alongside source)
toad design.toad

# Multi-format export (PNG, WebP, SVG, layered PSD, print-ready PDF)
toad design.toad -f png,webp,svg,psd,pdf

# Scale multipliers for retina / ultra-HD (2x, 4x)
toad design.toad -s 2 --vector-scale 2.5

# Print prepress (300 DPI, bleed margins)
toad poster.toad -f pdf --dpi 300 --bleed 3mm

# Vector text outlining (convert text to outlines in SVG)
toad logo.toad -f svg -t
```

---

## 2. Live Development Preview (`toad dev`)

Starts a local web server with hot-reload (SSE) watching the entry file and all transitive imports:

```bash
toad dev design.toad -p 3000
```
- Opens browser automatically to `http://localhost:3000/`.
- Recompiles in milliseconds upon file save.
- Displays compiler diagnostics directly in the browser and console.

---

## 3. Static Analysis & Linting (`toad lint`)

Statically analyzes `.toad` files for syntax errors, missing variables, scope problems, duplicate IDs, and invalid fonts before rendering:

```bash
toad lint design.toad
```
- Returns Clang/Rust-style rich diagnostics with line numbers, code snippets, and actionable help hints.

---

## 4. Deep Quality & Anti-Slop Auditor (`toad report` / `toad audit`)

Mathematically evaluates designs against the 8-category Design Auditor benchmark (WCAG 2.2, APCA, 4px grid, whitespace, anti-slop):

```bash
# Run full audit and show score + quick fixes
toad report design.toad --fixes

# Enforce strict zero-warning policy (fails with exit code 1 on warnings)
toad report design.toad --strict

# Machine-readable JSON output
toad report design.toad --json

# Focus exclusively on Anti-AI-Slop rule violations
toad report design.toad --slop-only
```
- **Grade A+ Target**: Score must be **>= 90/100** (ideal: **100/100**).

---

## 5. Code Formatter (`toad format` / `toad fmt`)

Formats `.toad` files with standardized indentation, spacing, and property formatting:

```bash
toad format design.toad

# Check formatting without writing changes:
toad format design.toad --check
```

---

## 6. PSD Importer & Image Converter (`toad convert`)

1. **Convert Photoshop Documents to Declarative TOAD Code**:
   ```bash
   toad convert template.psd --assets ./assets
   ```
   Extracts text layers, vector masks, shapes, and raster layers into clean, structured `.toad` DSL code.

2. **Universal Image Resizing, Conversion & Compression**:
   ```bash
   toad convert image.png -f webp -q 90 -c
   ```

---

## 7. Asset Bundler (`toad bundle`)

Generates multi-resolution icon sets, favicons, PWA manifests, and social share assets:

```bash
# Bundle web favicon package + site.webmanifest + HTML embed tags
toad icon.toad bundle -p favicons -o ./public/icons

# Target a specific element inside a larger canvas
toad app.toad bundle -p app-icon -t "#app_logo"
```

---

## 8. Motion Animation DSL (`toad motion`)

Compiles declarative `.toadm` motion files into video (MP4/WebM) or animated GIFs:

```bash
toad motion banner.toadm -f mp4 --fps 60
toad motion logo.toadm -f gif --fps 30
```

---

## 9. On-Device Local AI Neural Tools

TOAD includes local, privacy-first AI tools that run 100% on device without cloud dependencies or API keys:

1. **Background Removal (`toad remove-bg` / `toad rembg`)**:
   ```bash
   # Multi-model neural ensemble + bilateral matting (peak detail)
   toad remove-bg portrait.jpg portrait_cutout.png --dyb

   # Batch process an entire folder
   toad remove-bg ./raw-photos ./clean-assets -r --dyb
   ```

2. **Image Super-Resolution & Enhancement (`toad enhance` / `toad upscale`)**:
   ```bash
   # 2x or 4x AI Upscale + Optical Deblur + Denoise
   toad enhance product_photo.jpg -s 2 --dyb
   toad enhance blurry_camera.jpg sharp.png --deblur --denoise
   ```

---

## 10. Interactive Web-GUI Studio (`toad studio` / `toad ui`)

Launches the complete graphical studio environment:

```bash
# Launch background studio daemon
toad studio

# Check status or stop daemon
toad studio status
toad studio stop
```
Provides visual canvas inspection, real-time animation scrubbers, audit tabs, and interactive image tools.
