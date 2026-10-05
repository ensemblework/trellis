# Functional Requirements

Status: draft, v0.1. Scope for the first usable prototype ("v1") is marked
**[v1]**; everything else is a later phase.

## 1. Editor

- **[v1]** Open a local project folder; show a file tree.
- **[v1]** Open/edit/save text files with syntax highlighting (Monaco).
- **[v1]** Multiple tabs, basic find/replace.
- [ ] Inline diagnostics (lint/type errors) surfaced from the running
  command, not a full LSP integration, in v1.
- [ ] Full Language Server Protocol support (v2+).

## 2. Terminal canvas

- **[v1]** Spawn a real shell (via `node-pty`) and render it with xterm.js;
  input/output must be indistinguishable from a normal terminal.
- **[v1]** Agent can overlay annotations on the terminal surface without
  altering the actual terminal buffer: highlight a line/region, draw a
  pointer/cursor toward a location, show a floating text callout.
- **[v1]** Agent can detect "waiting for you" state (e.g. you haven't typed
  the next expected command) vs. "you tried something" state, and react
  differently (nudge vs. explain).
- **[v1]** Agent can read command output (stdout/stderr) to explain errors,
  but **must not run commands on your behalf** by default — see
  `docs/private/PEDAGOGY_GUIDE.md` for the interaction contract.
- [ ] "Ghost typing" playback: agent can show (not execute) what a command
  would look like character-by-character, as a teaching aid, clearly
  visually distinct from real input (v1.5).
- [ ] Session recording/replay for reviewing a past lesson (v2).

## 3. Browser pane

- **[v1]** Minimal embedded browser (address bar, back/forward, single
  tab) for following documentation.
- **[v1]** Agent can read the currently loaded page's content (with user's
  explicit per-session consent toggle) to ground explanations and point at
  specific sections.
- [ ] Agent can draw a highlight overlay on a specific element/region of
  the loaded page (v1.5).
- [ ] Multi-tab browser (v2).

## 4. Chat / task panel

- **[v1]** Freeform text box to describe the task/goal before starting.
- **[v1]** Agent turns that into a short, visible lesson plan /
  checklist (not a silent chain-of-thought) so you know what's coming.
- **[v1]** Conversation history persists per project.
- [ ] Skill-level tracking per topic (e.g. "git merge conflicts: level 2
  of 5") that adapts how much the agent explains (v2).

## 5. Agent / LLM integration

- **[v1]** Settings UI to add/select an API key per provider: GitHub
  Copilot, OpenAI (ChatGPT models), Anthropic (Claude). Keys stored locally
  (OS keychain where available), never transmitted anywhere but the
  provider's API.
- **[v1]** Model picker per provider (e.g. pick which Claude/GPT model).
- **[v1]** Token-usage indicator so the learning experience doesn't
  silently rack up cost — see `requirements/non-functional-requirements.md`
  for budget targets.
- [ ] Local/offline model support (v2+, e.g. via Ollama).

## 6. Settings

- **[v1]** Theme picker (derived from vendored VS Code Dark+/Light+/HC
  themes initially; see `vendor/vscode-assets/themes`).
- **[v1]** Font family/size for editor and terminal.
- **[v1]** Provider/API key management (see §5).
- [ ] Keybinding customization (v2).

## 7. Non-goals for v1

- Extension/plugin marketplace.
- Remote development (SSH/containers) — local projects only.
- Multi-user/collaborative editing.
