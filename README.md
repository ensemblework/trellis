# Trellis

**Trellis is a minimal IDE + terminal, observed by an AI agent whose job is
to teach you — not to do the work for you.**

LLM coding agents have become extremely good at writing code and running
commands for us. That's great for shipping software, but it quietly erodes
the skill of the person at the keyboard. Trellis is an experiment in the
opposite direction: an environment where the agent watches what you're
doing and helps you *learn to do it yourself*, at your own pace, instead of
handing you the answer.

Think of it as a flight instructor sitting next to you, not an autopilot.

## What Trellis is

- A **small, focused code editor** (not a full VS Code fork) for editing
  files in a project.
- A **"terminal canvas"**: looks and behaves like a real terminal (you type
  real commands, you get real output), but it's a canvas the agent can also
  draw on — highlighting parts of the output, pointing at a specific line,
  waiting for you to try the next step before moving on.
- A **lite, agent-aware browser pane** for following documentation,
  so the agent can point you at the right doc section instead of restating
  it.
- A **chat/task panel** where you describe what you're trying to accomplish
  *before* touching the keyboard, so the agent can plan a teaching
  path instead of just executing a task.
- Pluggable **LLM providers**: bring your own API key (GitHub Copilot,
  OpenAI/ChatGPT, Anthropic/Claude, others later).

## What Trellis is not

- It is not a VS Code replacement or extension host. We deliberately keep
  the editor/IDE shell simple.
- It is not an "agent does your task for you" tool. If you want that,
  existing coding agents already do it very well — that's precisely the
  gap Trellis exists to balance.

## Why borrow from VS Code instead of forking it

VS Code's *editor core* (Monaco), *terminal* (xterm.js), and *default
themes* are mature, MIT-licensed, and already what most developers expect
a code editor to feel like. Rather than fork the entire VS Code codebase
(huge, built around an extension-host architecture we don't need), Trellis
composes the same underlying libraries VS Code itself uses, plus a small
number of vendored assets (see
[`vendor/NOTICES/THIRD_PARTY_NOTICES.md`](vendor/NOTICES/THIRD_PARTY_NOTICES.md)).

## Project layout

```
apps/
  ide-shell/         Desktop shell (window, menus, panel layout)
  editor-webview/    Monaco-based code editor panel
  terminal-canvas/   xterm.js-based terminal + agent annotation overlay
  browser-pane/      Lite embedded browser for docs
  chat-panel/        Task framing / conversation UI
  agent-server/      Backend: LLM orchestration, PTY sessions, lesson state
packages/
  ui-theme/          Shared design tokens / VS Code-derived themes
  pty-bridge/         node-pty wrapper for real shell sessions
  llm-providers/      Adapters for Copilot / OpenAI / Anthropic / etc.
  lesson-engine/       Core "teach, don't tell" interaction logic
vendor/
  vscode-assets/      Small vendored VS Code assets (themes, etc.)
  NOTICES/            Attribution for everything borrowed from elsewhere
docs/
  public/             Architecture notes safe for a public repo
requirements/         Functional / non-functional requirements, tech stack
```

## Status

Early planning stage. This repository currently contains structure,
requirements, and architecture notes — implementation has not started yet.
See [`docs/public/`](docs/public) and [`requirements/`](requirements) for
the current thinking, and follow along as it evolves.

## License

MIT — see [`LICENSE`](LICENSE). Vendored third-party assets retain their
original licenses; see [`vendor/NOTICES/THIRD_PARTY_NOTICES.md`](vendor/NOTICES/THIRD_PARTY_NOTICES.md).
