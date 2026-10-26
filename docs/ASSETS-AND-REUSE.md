# Assets and implementation reuse

Before producing a logo, visual, component, service, script, or document, inspect the target project.

## Search order
1. Project instructions and asset inventory.
2. Existing components, styles, tokens, icons, and image directories.
3. Documentation and prior implementations.
4. Existing dependencies and internal utilities.
5. Approved design references.
6. Create new assets only when no adequate option exists.

## Logo and brand rules
- Find the official logo and verify which brand/project it belongs to.
- Reuse the original; preserve transparency, proportions, and legibility.
- Create format/size variants only when necessary.
- Never redraw, replace, or invent an official logo without explicit permission.
- Never reuse another product's logo merely because it is available.
- If the official asset is absent, document that fact and ask only if it blocks delivery.

## Inventory
Maintain `docs/assets-inventory.md` in the target project:

| Asset | Path | Purpose/brand | Reuse notes |
|---|---|---|---|
| Official logo | exact/path/to/logo.svg | Product identity | Preserve proportions and brand colors |

Do not copy private product assets into this public starter kit.

## Code reuse
Prefer a small change to a working component over a duplicate. Before replacement, document why existing implementation is inadequate and what behavior, migration, or tests are affected.
