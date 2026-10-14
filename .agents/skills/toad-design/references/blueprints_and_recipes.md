# TOAD Gold-Standard Blueprints & Vector Recipes

> Every blueprint in this file is pre-verified against `toad report --strict` to achieve a flawless **100 / 100 (`Grade A+`)**.

---

## 0. Wireframe & Spatial Blockout Template (`wireframe_blockout.toad`)

Use this pattern whenever starting a **NEW** design to present the rough layout, container bounds, and negative space to the user for approval before full styling.

```toad
@font "Space Grotesk" bold;
@font "Inter" regular medium;

>wf_bg = #090d16;
>wf_card = alpha(#38bdf8, 0.04);
>wf_stroke = alpha(#38bdf8, 0.40);
>wf_dash = alpha(#38bdf8, 0.25);
>wf_label = #bae6fd;
>wf_sub = #94a3b8;

canvas 1440px 1024px #090d16 {
  // Navigation Bar Wireframe Block
  stack #wf_nav "Wireframe: Navigation Bar" {
    at: 120px 64px;
    size: 1200px 64px;
    direction: horizontal;
    justify: space-between;
    align: center;
    padding: 16px 24px;
    fill: >wf_card;
    stroke: >wf_stroke 1px;
    radius: 12px;

    text #wf_nav_lbl "[HEADER: BRAND & NAVIGATION // 1200x64]" {
      font-family: "Space Grotesk";
      font-size: 13px;
      line-height: 20px;
      letter-spacing: 1.5px;
      fill: >wf_label;
    }
  }

  // Hero Card Wireframe Block
  stack #wf_hero "Wireframe: Hero Card" {
    at: 120px 176px;
    size: 464px 424px;
    direction: vertical;
    justify: space-between;
    padding: 24px;
    fill: >wf_card;
    stroke: >wf_stroke 1px dashed;
    radius: 12px;

    text #wf_hero_tag "[HERO COMPUTE NODE // 464x424]" {
      font-family: "Space Grotesk";
      font-size: 13px;
      line-height: 20px;
      letter-spacing: 1.5px;
      fill: >wf_label;
    }

    rect #wf_hero_placeholder "Hero Metric Placeholder" {
      size: 416px 160px;
      fill: alpha(#ffffff, 0.02);
      stroke: >wf_dash 1px;
      radius: 8px;
    }

    text #wf_hero_meta "[FOOTER SPEC: P99 LATENCY RESPONSE]" {
      font-family: "Inter";
      font-size: 12px;
      line-height: 16px;
      letter-spacing: 1.5px;
      fill: >wf_label;
    }
  }

  // Visual Chart Wireframe Block
  stack #wf_chart "Wireframe: Chart Container" {
    at: 616px 176px;
    size: 704px 424px;
    direction: vertical;
    justify: space-between;
    padding: 24px;
    fill: >wf_card;
    stroke: >wf_stroke 1px dashed;
    radius: 12px;

    text #wf_chart_tag "[SPECTRAL FLUX & THROUGHPUT // 704x424]" {
      font-family: "Space Grotesk";
      font-size: 13px;
      line-height: 20px;
      letter-spacing: 1.5px;
      fill: >wf_label;
    }

    rect #wf_chart_area "Graph Area Placeholder" {
      size: 656px 240px;
      fill: alpha(#ffffff, 0.02);
      stroke: >wf_dash 1px;
      radius: 8px;
    }

    text #wf_chart_meta "[GRAPH LEGEND: MIN / MAX CONTROLS]" {
      font-family: "Inter";
      font-size: 12px;
      line-height: 16px;
      letter-spacing: 1.5px;
      fill: >wf_label;
    }
  }

  // Tri-Column KPI Grid Wireframe Block
  grid #wf_kpi_grid "Wireframe: KPI Matrix" {
    at: 120px 648px;
    size: 1200px 176px;
    columns: 3;
    gap: 24px;

    stack #wf_kpi_1 "Wireframe: KPI 1" {
      size: 384px 176px;
      padding: 24px;
      fill: >wf_card;
      stroke: >wf_stroke 1px dashed;
      radius: 12px;

      text #wf_kpi_1_lbl "[KPI 1: ACTIVE SHARDS // 384x176]" {
        font-family: "Space Grotesk";
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >wf_label;
      }
    }

    stack #wf_kpi_2 "Wireframe: KPI 2" {
      size: 384px 176px;
      padding: 24px;
      fill: >wf_card;
      stroke: >wf_stroke 1px dashed;
      radius: 12px;

      text #wf_kpi_2_lbl "[KPI 2: MEMORY METRICS // 384x176]" {
        font-family: "Space Grotesk";
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >wf_label;
      }
    }

    stack #wf_kpi_3 "Wireframe: KPI 3" {
      size: 384px 176px;
      padding: 24px;
      fill: >wf_card;
      stroke: >wf_stroke 1px dashed;
      radius: 12px;

      text #wf_kpi_3_lbl "[KPI 3: NETWORK EGRESS // 384x176]" {
        font-family: "Space Grotesk";
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >wf_label;
      }
    }
  }
}
```

---

## 1. Blueprint: Obsidian FinTech & AI Dashboard (`100/100 A+`)


- **Archetype**: `A01` (Obsidian FinTech / Linear Precision)
- **Canvas**: `1440px 1024px #030712` (Ratio 1.406 <= 1.50)
- **Whitespacce**: Exactly 40% (Passes `SLOP-WEB-008`).

```toad
@font "Space Grotesk" bold;
@font "Inter" regular medium bold;

>bg_canvas = #030712;
>bg_surface = #0f172a;
>bg_elevated = #1e293b;
>ink_primary = #f8fafc;
>ink_secondary = #e2e8f0;
>ink_sky = #bae6fd;
>ink_emerald = #6ee7b7;
>ink_amber = #fde68a;
>accent_sky = #38bdf8;
>accent_emerald = #10b981;
>accent_amber = #f59e0b;

canvas 1440px 1024px #030712 {
  // 1. Top Navigation & Telemetry Header (1200x64 at 120, 64)
  stack #header_bar "Top Navigation Bar" {
    at: 120px 64px;
    size: 1200px 64px;
    direction: horizontal;
    justify: space-between;
    align: center;
    padding: 12px 24px;
    fill: >bg_surface;
    stroke: >bg_elevated 1px;
    radius: 12px;

    stack #brand_cluster "Brand Identity" {
      size: 360px 40px;
      direction: horizontal;
      gap: 16px;
      align: center;

      rect #brand_mark "Brand Pulse Mark" {
        size: 16px 16px;
        radius: 4px;
        fill: >accent_sky;
        glow: rgba(56, 189, 248, 0.35) 12px;
      }

      text #brand_name "AETHER // QUANTUM TELEMETRY" {
        font-family: "Space Grotesk";
        font-weight: bold;
        font-size: 16px;
        line-height: 24px;
        letter-spacing: 2px;
        fill: >ink_primary;
      }
    }

    stack #status_pill "Global Health Pill" {
      size: 192px 40px;
      direction: horizontal;
      gap: 12px;
      align: center;
      padding: 8px 16px;
      fill: alpha(>accent_emerald, 0.12);
      stroke: >accent_emerald 1px;
      radius: 8px;

      circle #health_dot "Pulse Dot" {
        radius: 4px;
        fill: >ink_emerald;
        glow: rgba(110, 231, 183, 0.5) 8px;
      }

      text #status_label "STATUS: NOMINAL" {
        font-family: "Inter";
        font-weight: bold;
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_emerald;
      }
    }
  }

  // 2. Main Hero Telemetry Card (464x424 at 120, 176)
  stack #hero_card "Primary Compute Node" {
    at: 120px 176px;
    size: 464px 424px;
    direction: vertical;
    justify: space-between;
    padding: 32px;
    fill: >bg_surface;
    stroke: >bg_elevated 1px;
    radius: 12px;
    shadow: 0px 16px 32px rgba(0, 0, 0, 0.16);

    stack #hero_meta "Node Metadata" {
      size: 400px 120px;
      direction: vertical;
      gap: 8px;
      align: start;

      text #node_tag "PRIMARY COMPUTE CLUSTER // US-EAST-01" {
        font-family: "Inter";
        font-weight: bold;
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_sky;
      }

      text #kpi_val "99.984%" {
        font-family: "Space Grotesk";
        font-weight: bold;
        font-size: 48px;
        line-height: 60px;
        fill: >ink_primary;
      }

      text #kpi_sub "AGGREGATE PIPELINE SYNCHRONIZATION" {
        font-family: "Inter";
        font-weight: medium;
        font-size: 14px;
        line-height: 20px;
        letter-spacing: 1.5px;
        fill: >ink_secondary;
      }
    }

    stack #hero_footer "Node Health Spec" {
      size: 400px 48px;
      direction: horizontal;
      justify: space-between;
      align: center;
      padding: 12px 20px;
      fill: alpha(#ffffff, 0.03);
      radius: 8px;

      text #lat_lbl "P99 LATENCY RESPONSE" {
        font-family: "Inter";
        font-weight: medium;
        font-size: 13px;
        line-height: 20px;
        letter-spacing: 1.5px;
        fill: >ink_secondary;
      }

      text #lat_val "1.42 MS" {
        font-family: "Space Grotesk";
        font-weight: bold;
        font-size: 14px;
        line-height: 20px;
        letter-spacing: 1.5px;
        fill: >ink_emerald;
      }
    }
  }

  // 3. Visual Telemetry Chart Card (704x424 at 616, 176)
  stack #chart_card "Spectral Distribution" {
    at: 616px 176px;
    size: 704px 424px;
    direction: vertical;
    justify: space-between;
    padding: 32px;
    fill: >bg_surface;
    stroke: >bg_elevated 1px;
    radius: 12px;
    shadow: 0px 16px 32px rgba(0, 0, 0, 0.16);

    stack #chart_header "Chart Head" {
      size: 640px 48px;
      direction: horizontal;
      justify: space-between;
      align: center;

      text #chart_title "THROUGHPUT DENSITY & FLUX" {
        font-family: "Space Grotesk";
        font-weight: bold;
        font-size: 18px;
        line-height: 28px;
        letter-spacing: 1.5px;
        fill: >ink_primary;
      }

      text #chart_window "WINDOW: 60 SECONDS" {
        font-family: "Inter";
        font-weight: bold;
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_sky;
      }
    }

    // Sparkline Graph Path
    path #flux_wave "Flux Trajectory" {
      d: "M 0 160 L 64 120 L 128 144 L 192 80 L 256 104 L 320 48 L 384 88 L 448 32 L 512 72 L 576 16 L 640 40";
      stroke: >accent_sky 3px;
      fill: none;
      glow: rgba(56, 189, 248, 0.40) 16px;
    }

    stack #chart_footer "Legend Bar" {
      size: 640px 32px;
      direction: horizontal;
      justify: space-between;
      align: center;

      text #leg_min "0.0 GB/S" {
        font-family: "Inter";
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_secondary;
      }
      text #leg_max "PEAK: 128.4 GB/S" {
        font-family: "Inter";
        font-weight: bold;
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_primary;
      }
    }
  }

  // 4. Tri-Column KPI Matrix (1200x176 at 120, 648)
  grid #kpi_grid "Secondary Metrics" {
    at: 120px 648px;
    size: 1200px 176px;
    columns: 3;
    gap: 24px;

    stack #kpi_col_1 "KPI 1" {
      size: 384px 176px;
      direction: vertical;
      justify: space-between;
      padding: 24px;
      fill: >bg_surface;
      stroke: >bg_elevated 1px;
      radius: 12px;

      text #kpi_t1 "ACTIVE SHARDS" {
        font-family: "Inter";
        font-weight: bold;
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_sky;
      }
      text #kpi_v1 "16,384" {
        font-family: "Space Grotesk";
        font-weight: bold;
        font-size: 36px;
        line-height: 44px;
        fill: >ink_primary;
      }
      text #kpi_d1 "ZERO PARTITION DRIFT" {
        font-family: "Inter";
        font-size: 13px;
        line-height: 20px;
        letter-spacing: 1.5px;
        fill: >ink_secondary;
      }
    }

    stack #kpi_col_2 "KPI 2" {
      size: 384px 176px;
      direction: vertical;
      justify: space-between;
      padding: 24px;
      fill: >bg_surface;
      stroke: >bg_elevated 1px;
      radius: 12px;

      text #kpi_t2 "MEMORY EFFICIENCY" {
        font-family: "Inter";
        font-weight: bold;
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_emerald;
      }
      text #kpi_v2 "94.2%" {
        font-family: "Space Grotesk";
        font-weight: bold;
        font-size: 36px;
        line-height: 44px;
        fill: >ink_primary;
      }
      text #kpi_d2 "ALLOCATION PRESSURE: LOW" {
        font-family: "Inter";
        font-size: 13px;
        line-height: 20px;
        letter-spacing: 1.5px;
        fill: >ink_secondary;
      }
    }

    stack #kpi_col_3 "KPI 3" {
      size: 384px 176px;
      direction: vertical;
      justify: space-between;
      padding: 24px;
      fill: >bg_surface;
      stroke: >bg_elevated 1px;
      radius: 12px;

      text #kpi_t3 "GLOBAL BACKBONE" {
        font-family: "Inter";
        font-weight: bold;
        font-size: 12px;
        line-height: 16px;
        letter-spacing: 1.5px;
        fill: >ink_amber;
      }
      text #kpi_v3 "3.8 TB/S" {
        font-family: "Space Grotesk";
        font-weight: bold;
        font-size: 36px;
        line-height: 44px;
        fill: >ink_primary;
      }
      text #kpi_d3 "ALL POP EGRESS SATURATED" {
        font-family: "Inter";
        font-size: 13px;
        line-height: 20px;
        letter-spacing: 1.5px;
        fill: >ink_secondary;
      }
    }
  }
}
```
