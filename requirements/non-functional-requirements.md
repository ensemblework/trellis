# Non-Functional Requirements

## Performance

- Editor must stay responsive (<16ms input latency target) for files up to
  ~10k lines without a full LSP — Monaco handles this natively.
- Terminal canvas rendering (xterm.js + annotation overlay) must not
  introduce visible input lag; annotations are a separate canvas/DOM layer
  composited over xterm's own rendering, never injected into the PTY
  stream.

## Cost / token efficiency

This is a first-class constraint, not an afterthought, because the whole
point is to avoid "just ask the agent and read the answer":

- The agent should prefer **deterministic, local** checks (e.g. "did the
  user's last command match the expected next step pattern?") over LLM
  calls whenever possible. LLM calls are reserved for generating
  explanations, adapting to unexpected situations, and reasoning about
  errors — not for routine state tracking.
- Lesson plans/checklists are generated once per task, then driven by
  local state machine logic (see `packages/lesson-engine`), re-invoking
  the LLM only at decision points (user stuck, user deviated, user asked a
  question, error occurred).
- Target: a typical "learn one small task" session (e.g. "resolve a merge
  conflict") should use a small, bounded number of LLM calls regardless of
  how many terminal commands the user tries, not one LLM call per
  keystroke or per command.
- Visible token/cost counter in the UI (see functional requirements §5).

## Privacy & consent

- Terminal content and editor file contents are local by default; nothing
  leaves the machine except what's explicitly sent to the selected LLM
  provider as part of a request.
- Browser-pane page content is only shared with the agent when the user
  has an explicit per-session "let the agent see this page" toggle on.
- API keys are stored via OS-level secret storage where available
  (Keychain on macOS, etc.), never committed to disk in plaintext, never
  logged.
- No telemetry/analytics in the open-source core without explicit opt-in.

## Reliability

- A crash in the agent/LLM layer must never corrupt the terminal session
  or unsaved editor buffers; the agent process is isolated from the PTY
  and editor processes.
- Terminal canvas must remain fully usable as a plain terminal even if the
  agent/LLM is unavailable (offline, rate-limited, no API key set).

## Accessibility

- Respect VS Code's high-contrast themes (vendored) as first-class theme
  options, not an afterthought.
- Keyboard-navigable UI; agent annotations must have a text-equivalent
  (e.g. a chat message), not rely on visual-only cues.

## Security

- No remote code execution beyond what the user explicitly types into the
  terminal or explicitly asks to run; the agent does not have a hidden
  "execute on behalf of user" path in v1 (see functional requirements §2
  and `docs/private/PEDAGOGY_GUIDE.md`).
- Dependencies vendored or added must be license-compatible with a public
  MIT-licensed repo; see `vendor/NOTICES/THIRD_PARTY_NOTICES.md`.

## Portability

- v1 targets macOS first (primary dev environment), with Linux/Windows
  compatibility kept in mind in architecture choices (e.g. `node-pty`,
  Electron/Tauri both are cross-platform) but not required to be
  fully verified at v1.
