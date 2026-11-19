# Phase 2 — Discovery & Mapping (system map)

## Components

- **Vim/Neovim** — the user's editor; hosts the plugin.
- **vim-ai plugin** — `plugin/vim_ai.vim` (commands, config) and
  `autoload/vim_ai.vim` (root detection, kob invocation, result rendering).
- **`kob` CLI (agent-aidf)** — audit engine, mentor workflow, contracts and
  instant-app runtime. The single integration point.
- **Project repository** — the K-AIDF-shaped repo being edited: `.kaidf/`,
  `docs/`, `contracts/`, `apps/`, `policy/`.
- **Local model** — resolved by K-AIDF (`--model`, `AIDF_MODEL`, Ollama
  defaults); the plugin never talks to a model directly.

## Flows

1. **Audit:** `:KobAudit` → detect root → `kob audit <root>` → scorecard
   rendered in a scratch split.
2. **Contracts/apps:** read-only listing of `contracts/` and `apps/` under
   the detected root.
3. **Mentor/chat:** editor surface over the same workflows the `kob shell`
   exposes (`mentor`, `chat`) — integration points in the scaffold.

## Touchpoints & risks

- `kob` not on `PATH` → explicit error message, no silent failure.
- Rich terminal output of `kob audit` → captured as plain text lines.
- Project root ambiguity → nearest ancestor holding `.kaidf/` wins.
