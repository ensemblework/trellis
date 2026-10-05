# Roadmap (public, high-level)

This is intentionally coarse. Detailed task breakdowns, timelines, and
success metrics live in private planning docs.

## Phase 0 — Foundations (current)

- Repo structure, requirements, architecture notes (this phase).
- Tech stack decisions finalized (`requirements/tech-stack.md`).
- Vendor a first set of VS Code themes for the default theme picker.

## Phase 1 — Walking skeleton

- Electron shell boots with three panels: editor (Monaco), terminal
  (xterm.js + node-pty), chat panel — no agent intelligence yet, just the
  "feels like an IDE" shell.
- Settings: theme picker, API key entry for one provider.

## Phase 2 — First teaching loop

- One hand-built lesson (e.g. "resolve a merge conflict") end-to-end:
  chat task framing → terminal overlay hints → completion detection.
- `lesson-engine` v1: deterministic state machine + a small number of LLM
  calls at decision points.

## Phase 3 — Generalize

- Replace the single hand-built lesson with an agent that can construct a
  lesson plan for an arbitrary stated task.
- Browser pane + doc-pointing.
- Multiple LLM providers wired through `llm-providers`.

## Phase 4 — Polish & distribute

- Packaging/signing for macOS (then other platforms).
- Public beta.

No committed dates yet — this is still a solo side project being shaped.
