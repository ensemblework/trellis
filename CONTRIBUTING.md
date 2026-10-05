# Contributing to Trellis

Thanks for your interest — this is an early-stage, mostly-solo project,
so process is intentionally light.

## Status

Pre-implementation. The repo currently holds structure, requirements, and
architecture notes (see `README.md`). Code contributions aren't being
accepted yet since the core interaction design is still being validated;
issues/discussion are welcome.

## Reporting issues / ideas

Open a GitHub issue. Useful ones at this stage:
- Gaps or inconsistencies in `requirements/` or `docs/public/`.
- Prior art we should be aware of (similar "teach, don't tell" tools).
- Licensing concerns with anything in `vendor/`.

## Code style (once implementation starts)

- TypeScript, strict mode.
- One lint/format config at the repo root (to be added in Phase 1 of
  `requirements/tech-stack.md`), applied consistently across
  `apps/*` and `packages/*`.
- Keep `packages/lesson-engine` dependency-light and well-tested — it's
  the core logic the rest of the product depends on being trustworthy.

## Licensing

By contributing, you agree your contribution is licensed under this
repo's MIT license (`LICENSE`). If you add a new third-party dependency or
vendored asset, update `vendor/NOTICES/THIRD_PARTY_NOTICES.md` in the same
PR.
