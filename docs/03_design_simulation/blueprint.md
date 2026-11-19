# Phase 3 — Design & Simulation (blueprint)

## Command surface

| Command | Design |
| --- | --- |
| `:KobAudit [path]` | Synchronous `systemlist()` call in the scaffold; move to an async job (`job_start`) when output size/latency demands it. Result in a reused scratch split titled `[vim-ai] audit`. |
| `:KobChat {prompt}` | Opens `[vim-ai] chat` with project + prompt header; the model round-trip (buffer/selection as context) is the integration point for the generated implementation. |
| `:KobMentor [answer]` | Mirrors `mentor` in the kob shell: no argument = next mentor message; argument = answer to the current quiz question. State stays in the project's mentor files. |
| `:KobContracts` / `:KobApps` | Read-only listings from `contracts/` and `apps/`; selecting an entry to open its `contract.md` / `app.json` is a fast follow. |

## UX rules

- Scratch buffers: `buftype=nofile`, reused per title, never clobber user files.
- Errors are `echohl ErrorMsg` one-liners in the editor — visible, not silent.
- No mappings are imposed by default; users map the commands themselves.

## Simulation notes

- The scaffold was exercised by hand against this repository: root
  detection resolves to the repo (`.kaidf/` present), and the contracts/apps
  listings render the (currently empty) state honestly.
