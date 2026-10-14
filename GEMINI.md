# TOAD Designs — Master AI System Prompt & Engineering Rules

> [!WARNING]
> ### 🤖 FOR GOOGLE GEMINI & AI AGENTS ONLY — NOT FOR HUMAN CONSUMPTION
> **This file is an automated context and instruction file for Google Gemini and AI coding agents.**

---

## 🛡️ Multi-Repository Architecture & Push Protocol (STRICTLY ENFORCED)

For details, consult `.agents/REPO_STRUCTURE.md`.

### 📌 Routing Matrix: Where to push what
1. **Public Designs (Showcase posters, open banners, public motifs)**:
   - **Target**: `razy-me/toad-designs` (`origin`)
   - **Location**: Root of `c:\toad-designs` (or `d:\toad-designs`).
   - **Command**: `git push origin main` inside `toad-designs`.
   - **Rule**: Contains ONLY public showcase work. NEVER put confidential or client designs directly here.

2. **Private & Client Designs (Confidential client work, brand assets, Urkunden, Vario, etc.)**:
   - **Target**: `razy-me/toad-designs-private` (`origin`)
   - **Location**: `c:\toad-designs\private\` (or `d:\toad-designs\private\`).
   - **Command**: `git push origin main` directly inside the `private/` subfolder.
   - **Sync**: After pushing in `private/`, update the submodule commit pointer in `toad-designs`.

3. **Code Changes (`toad` compiler, engines, tools, CLI)**:
   - **Target**: `razy-me/toad-private` (`origin` in `c:\toad`)
   - **Auto-Mirror**: Automatically mirrored to public `razy-me/toad` via GitHub Action (`sync-public.yml`).
   - **NEVER** push code directly to `public` (`razy-me/toad`).

---

## 🎨 Mandatory Design Rules for TOAD Workspaces

1. **ALL DESIGNS ARE TOAD DESIGNS**:
   - Whenever you are asked to create, draft, refine, or edit any design (posters, banners, logos, UI screens, mockups, flyers, social cards, icons, illustrations), it is ALWAYS a TOAD design (`.toad` / `.toadm`).
   - Never output HTML/CSS mockups, generic SVG, or fallback formats.

2. **WIREFRAME FIRST (VISUAL BLOCKOUT PROTOCOL)**:
   - When creating a **NEW** TOAD design from scratch, **ALWAYS generate a rough visual layout plan / wireframe `.toad` file first**.
   - This wireframe `.toad` file defines the spatial architecture, container boundaries, grid lines, and structural blocks (using outline strokes, subtle fills, and placeholder labels) so the user can review and approve the spatial balance before full visual detailing begins.
   - Only after user approval do you proceed to full aesthetic styling, typography, colors, and assets.

3. **GRADE A+ QUALITY STANDARD**:
   - Every completed design must achieve `100/100` (`Grade A+`) in `toad report --strict`.
   - Always follow the 13 TOAD syntax rules, 4px-Quantum Grid Law, APCA contrast minimums, and Anti-AI-Slop constraints.
   - Leverage the `toad-design` skill for all workflows.

4. **PILL & BADGE CENTERING LAW (MANDATORY)**:
   - Whenever placing text or icons inside a pill badge, pill banner, or rounded CTA container, **NEVER manually estimate Y coordinates with top alignment**.
   - ALWAYS use dedicated dual-axis functional centering:
     - Either `vertical-align: middle;` and `align: center;` (or `align: start;` with full container height `size: ... <height>px; at: ... 0px;`).
     - Or a flex container: `stack { direction: horizontal; align: center; justify: center; }`.
     - Or relational positioning: `at: center of <target>;`.
   - This prevents font-leading discrepancies and guarantees mathematical, optical centering across both axes in all renderers (PNG, SVG, PSD, PDF).
