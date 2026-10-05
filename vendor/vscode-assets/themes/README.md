# Vendored VS Code themes

Default color theme JSON files copied directly from
[microsoft/vscode](https://github.com/microsoft/vscode)
(`extensions/theme-defaults/themes/`), MIT licensed.

| File | Theme |
|---|---|
| `dark_plus.json` | Dark+ (default dark) |
| `dark_vs.json` | Base tokens Dark+ extends |
| `light_plus.json` | Light+ (default light) |
| `light_vs.json` | Base tokens Light+ extends |
| `hc_black.json` | High Contrast Dark |
| `hc_light.json` | High Contrast Light |

These are used as-is for Trellis' initial theme picker (see
`requirements/functional-requirements.md` §6) and as a reference schema for
any custom themes added later, since it's the same `color-theme` JSON
schema VS Code itself uses.

See `vendor/NOTICES/THIRD_PARTY_NOTICES.md` for full attribution.
