# Design System Document

## 1. Overview & Creative North Star
**The Creative North Star: "The Architectural Core"**

This design system moves away from the "generic corporate blue" template by embracing an editorial, architectural approach to IT solutions. Instead of a flat, grid-locked interface, we treat the digital space as a series of high-precision layers. Our goal is to convey technical mastery through **intentional asymmetry** and **tonal depth**.

The system relies on "Atmospheric Precision"—where the space between elements (white space) is as important as the elements themselves. We replace traditional structural lines with shifting light and surface elevations to create a UI that feels engineered, not just "designed."

---

## 2. Colors & Surface Architecture

### The Palette
The palette is grounded in the stability of deep blues (`primary: #00366b`) and the high-tech energy of vibrant cyan (`secondary: #00687a`). 

### The "No-Line" Rule
**Strict Mandate:** Designers are prohibited from using 1px solid borders for sectioning or containment. 
Boundary definition must be achieved through:
- **Background Color Shifts:** Transitioning from `surface` (#f8f9ff) to `surface-container-low` (#eff4ff).
- **Tonal Transitions:** Using the `surface-container` tiers to denote functional changes in the layout.

### Surface Hierarchy & Nesting
Treat the UI as a physical stack of materials. Use the following hierarchy to define importance:
1.  **Base Layer:** `surface` (#f8f9ff) – The primary canvas.
2.  **Sectional Break:** `surface-container-low` (#eff4ff) – Use for large background blocks to group content.
3.  **Interactive Components:** `surface-container-lowest` (#ffffff) – Reserved for cards or inputs to make them "pop" against the tinted background.
4.  **Information Overlays:** `surface-container-high` (#dce9ff) – For navigation or tertiary sidebars.

### The "Glass & Gradient" Rule
To inject "soul" into the tech-forward aesthetic:
- **Glassmorphism:** For floating navigation or modal headers, use `surface_variant` at 60% opacity with a `20px` backdrop-blur.
- **Signature Gradients:** Main CTAs and Hero accents should utilize a linear gradient from `primary` (#00366b) to `primary_container` (#204e87) at a 135-degree angle.

---

## 3. Typography
We utilize **Inter** for its mathematical precision and neutral, "engineered" feel.

*   **Display (lg/md/sm):** Used for bold, authoritative statements. Leverage `display-lg` (3.5rem) with `-0.02em` letter spacing to create a high-end editorial impact.
*   **Headline (lg/md/sm):** The primary driver of hierarchy. Headlines should always be paired with generous vertical spacing (`spacing-12` or `spacing-16`) to let the "Architectural Core" breathe.
*   **Title & Body:** `body-lg` (1rem) is the workhorse. Ensure a line-height of at least 1.6 for maximum readability in technical documentation.
*   **Labels:** Use `label-md` in all-caps with `0.05em` letter spacing for technical metadata or small eyebrow copy.

---

## 4. Elevation & Depth

### The Layering Principle
Depth is achieved through **Tonal Layering** rather than shadows. 
*   *Example:* A "White Paper" card (`surface-container-lowest`) placed on a "Cloud" background (`surface-container-low`) creates a perceived lift of 2mm without a single drop shadow.

### Ambient Shadows
When a floating effect is non-negotiable (e.g., a primary dropdown):
- **Blur:** 32px to 48px.
- **Opacity:** 6% of `on_surface` (#0d1c2e).
- **Color:** Tint the shadow with `primary` to ensure it feels like part of the environment, not a generic grey smudge.

### The "Ghost Border" Fallback
If accessibility requires a container boundary, use a **Ghost Border**:
- **Token:** `outline_variant` (#c3c6d5).
- **Opacity:** 15%. 
- **Rule:** Never use 100% opaque borders.

---

## 5. Components

### Buttons (High-Precision CTAs)
- **Primary:** Gradient fill (`primary` to `primary_container`), `xl` (0.75rem) roundedness. No border. High-contrast `on_primary` (#ffffff) text.
- **Secondary:** Surface-tinted. Use `secondary_container` (#57dffe) with `on_secondary_container` (#006172) text.
- **Tertiary:** Text-only with a `2px` underline that appears only on hover, using the `secondary` cyan.

### Cards & Feature Sections
- **Construction:** Use `surface-container-lowest` (#ffffff). Forbid the use of divider lines. 
- **Separation:** Use `spacing-8` (2rem) of internal padding. Separate distinct content blocks within the card using a subtle background shift to `surface-container-low`.
- **Feature Sections:** Use intentional asymmetry. Place the `headline-lg` on the left and the descriptive `body-lg` text offset to the right, creating a sophisticated "Z-pattern" layout.

### Input Fields
- **Default State:** `surface-container-low` fill. No border.
- **Focus State:** `2px` Ghost Border (`outline` at 30%) and a subtle `primary` glow.
- **Error:** Utilize `error` (#ba1a1a) text but keep the container fill soft (`error_container`).

### Additional Component: The "Data-Glass" Widget
For IT metrics or stats, use a semi-transparent `surface_bright` container with a `20px` blur, topped with a `secondary` (cyan) accent bar at the top (2px height).

---

## 6. Do’s and Don’ts

### Do:
- **Use "White Space" as a Separator:** Leverage `spacing-16` (4rem) between major sections to emphasize a premium, uncluttered experience.
- **Layer with Intent:** Ensure that every "layer" serves a functional purpose (e.g., the darkest layers are for base information, the brightest are for interaction).
- **Micro-Interactions:** Use smooth, 300ms transitions for all hover states to mimic the "fluidity" of modern software.

### Don't:
- **Don't use 1px Dividers:** Never use a line to separate two pieces of content. Use a background color change or a spacing increment of at least `spacing-4`.
- **Don't use Pure Black:** The darkest point in our system is `on_background` (#0d1c2e). Pure black (#000000) will break the "Architectural Core" aesthetic.
- **Don't Crowd the Grid:** Avoid putting too many cards in a single row. Limit to 3 items to maintain the editorial feel.