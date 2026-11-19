# Vim-AI — K-AIDF inside Vim

A Vim extension that integrates the editor with the [K-AIDF](https://github.com/kobkob/K-AIDF)
framework: run governance audits, talk to the mentor workflow, and inspect a
project's contracts and instant apps without leaving Vim.

This repository is also a **public case study**: the extension is being
developed *with* the K-AIDF framework itself — the `kob` agent generates and
operates on this project under the K-AIDF methodology (contracts, phases and
audit), and the repository follows the K-AIDF Repository Contract layout.

## Status

Scaffold. The repository structure, the plugin skeleton and the methodology
documents are in place; the command implementations are being built
incrementally with `kob`.

## What it will do

| Command          | Action                                                                 |
| ---------------- | ---------------------------------------------------------------------- |
| `:KobAudit`      | Run `kob audit` on the current project and show the KAIDF-AMM scorecard in a split. |
| `:KobChat`       | Ask the project's model a question, with the current buffer as context. |
| `:KobMentor`     | Continue the mentor workflow (phase quiz, briefs, exit criteria) from the editor. |
| `:KobContracts`  | List the project's phase contracts (`contracts/`).                     |
| `:KobApps`       | List the project's instant apps (`apps/`).                            |

## Requirements

- Vim 9+ or Neovim
- The `kob` CLI from [K-AIDF](https://github.com/kobkob/K-AIDF) installed and on `PATH`
- A local model configured for K-AIDF (the framework is local-first; Vim-AI
  shells out to your local `kob` and sends nothing anywhere else)

## Install

With a plugin manager, e.g. vim-plug:

```vim
Plug 'kobkob/vim-ai'
```

Or with Vim's native packages:

```bash
git clone https://github.com/kobkob/vim-ai ~/.vim/pack/plugins/start/vim-ai
```

## Configuration

```vim
let g:vim_ai_kob = 'kob'          " path to the kob executable
let g:vim_ai_model = ''           " optional: model override (AIDF_MODEL)
```

## How it works

Vim-AI is a thin, honest shell over the local `kob` CLI: the plugin detects
the project root (the directory holding `.kaidf/`, or the current working
directory), invokes `kob`, and renders the result in a scratch split. All
governance state stays where K-AIDF keeps it — in the project repository
(`docs/`, `contracts/`, `apps/`, `.kaidf/specs/`).

## Repository layout (K-AIDF Repository Contract)

- `docs/00-overview` … `docs/05_verification_transfer` — the methodology phases of this case
- `contracts/` — phase contracts created by the mentor flow / `contract-create`
- `apps/` — instant apps created during design & simulation
- `.kaidf/specs/kaidf.yaml` — the spec this repository was generated from
- `plugin/`, `autoload/`, `doc/` — the Vim extension itself

## License

MIT — see [LICENSE](LICENSE).
