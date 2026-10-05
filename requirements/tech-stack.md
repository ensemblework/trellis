# Tech Stack (proposed, v1)

Status: proposal — open to revision once prototyping starts.

## Shell / desktop app

**Candidate: Tauri (Rust shell + webview) over Electron.**

| | Tauri | Electron |
|---|---|---|
| Bundle size | Small (~10-20MB) | Large (~100MB+, ships Chromium+Node) |
| Memory footprint | Lower (uses OS webview) | Higher (bundled Chromium) |
| Native PTY/FS access | Via Rust commands | Via Node natively (very mature, same runtime VS Code uses) |
| Ecosystem maturity for IDE-like apps | Newer | Proven (VS Code itself is Electron) |

Decision: **start with Electron** for v1 despite the size cost, because:
- `node-pty`, `xterm.js`, and `monaco-editor` all have first-class, battle
  tested Node/Electron integration (this is literally VS Code's own stack).
- We want to spend our engineering effort on the teaching/agent layer, not
  on re-solving PTY/webview integration problems Tauri would require Rust
  glue code for.
- Revisit Tauri once the product is proven, if bundle size/memory become
  real complaints.

## Editor

- **Monaco Editor** (`monaco-editor` npm package) — the actual editor
  component from VS Code, usable standalone.
- **vscode-textmate** + **vscode-oniguruma** for grammar-based syntax
  highlighting consistent with VS Code, if/when Monaco's bundled grammars
  aren't sufficient.

## Terminal

- **`@xterm/xterm`** (xterm.js) for rendering.
- **`node-pty`** for the actual pseudo-terminal/shell process.
- A custom **annotation overlay layer**: an absolutely-positioned
  canvas/SVG layer on top of the xterm DOM, driven by `packages/lesson-engine`,
  that can draw a pointer, highlight a cell range, or show a callout
  bubble — without touching the PTY stream or xterm's own buffer.

## Browser pane

- Electron `<webview>` tag (or `BrowserView`) for a minimal embedded
  browser: address bar, back/forward, one tab, v1.
- Agent "sees" the page via `webview.executeJavaScript` to extract
  rendered text/structure on demand (only when the per-session consent
  toggle is on).

## Backend / agent orchestration

- `apps/agent-server`: Node (TypeScript) process, local to the user's
  machine (not a hosted backend for v1) — keeps the "your code stays
  local" story simple and avoids hosting cost for what's still an
  experiment.
- `packages/llm-providers`: thin adapters implementing one common
  interface over:
  - GitHub Copilot (via Copilot's chat/completions API surface)
  - OpenAI (ChatGPT models) via `openai` SDK
  - Anthropic (Claude) via `@anthropic-ai/sdk`
- `packages/lesson-engine`: the core "teach don't tell" state machine —
  deterministic where possible, LLM-assisted at decision points. See
  `docs/private/PEDAGOGY_GUIDE.md` for the interaction design (private).

## Language / tooling

- TypeScript across the board (apps + packages).
- pnpm workspaces (monorepo) — fast installs, good disk usage via
  content-addressable store, same tool choice VS Code's own repo uses in
  spirit (they use a similar internal build approach).
- Vite for renderer bundling (editor-webview, terminal-canvas,
  browser-pane, chat-panel) — fast dev server, good Monaco/xterm support
  via existing community plugins.

## Themes

- Start from vendored VS Code Dark+/Light+/HC themes
  (`vendor/vscode-assets/themes`), expose as selectable themes, allow
  custom theme JSON later (same schema VS Code uses, so existing VS Code
  themes are portable in principle).

## Open questions

- Hosted sync (settings/API keys/lesson progress across machines) is out
  of scope for v1; local-only storage first.
- Whether `ensemblework.com` eventually fronts a hosted/managed version is
  a business decision tracked in private docs, not here.
