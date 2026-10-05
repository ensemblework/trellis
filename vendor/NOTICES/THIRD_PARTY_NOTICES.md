# Third-Party Notices

This project builds on ideas and, in limited cases, code/assets from
[Visual Studio Code](https://github.com/microsoft/vscode) and its ecosystem.
We deliberately do **not** vendor the full VS Code source (it is a huge,
tightly-coupled codebase). Instead we reuse small, well-isolated, permissively
licensed pieces, and depend on the rest as normal npm packages.

## Vendored files

| Path | Source | License | Notes |
|---|---|---|---|
| `vscode-assets/themes/dark_plus.json` | microsoft/vscode `extensions/theme-defaults/themes/dark_plus.json` | MIT | Default dark color theme, used as base for Trellis' default theme |
| `vscode-assets/themes/dark_vs.json` | microsoft/vscode | MIT | Base tokens Dark+ extends |
| `vscode-assets/themes/light_plus.json` | microsoft/vscode | MIT | Default light color theme |
| `vscode-assets/themes/light_vs.json` | microsoft/vscode | MIT | Base tokens Light+ extends |
| `vscode-assets/themes/hc_black.json` | microsoft/vscode | MIT | High-contrast dark theme (accessibility) |
| `vscode-assets/themes/hc_light.json` | microsoft/vscode | MIT | High-contrast light theme (accessibility) |

VS Code core and `extensions/theme-defaults` are MIT licensed. See
https://github.com/microsoft/vscode/blob/main/LICENSE.txt.

## Dependencies planned (not vendored, installed via package manager)

| Package | License | Why |
|---|---|---|
| `monaco-editor` | MIT | The actual code-editing component VS Code is built on. Using it directly instead of forking VS Code gets us the editing experience without the IDE shell complexity. |
| `@xterm/xterm` (xterm.js) + addons | MIT | Terminal emulator rendering, same library VS Code's integrated terminal uses. We render our "terminal canvas" on top of it. |
| `node-pty` | MIT | Real pseudo-terminal process spawning or backend terminal sessions. |
| `vscode-textmate` + `vscode-oniguruma` | MIT | TextMate grammar tokenizing for syntax highlighting, matching VS Code's highlighting fidelity. |
| `@vscode/codicons` | CC-BY-4.0 | VS Code's icon font. Pulled in at build time, not vendored as raw files, because of the different (attribution) license terms. Attribution is included at runtime in the About/Settings panel. |

## Why this approach

We are explicitly **not** forking `microsoft/vscode` wholesale:
- It's a huge codebase (100k+ files) tuned for an extension-host architecture
  we don't need.
- Our product is intentionally smaller in scope (editor + terminal canvas +
  lite browser + chat), so we compose focused, well-maintained libraries
  that already power VS Code instead of inheriting its full complexity.
- This keeps the diff between "ideas borrowed from VS Code" and "our own
  code" honest and auditable, which matters since this repository is public.

If/when we need closer parity (e.g. a real extension API), we will
re-evaluate vendoring more of VS Code's `src/vs/editor` or
`src/vs/workbench` layers individually, with notices updated accordingly.
