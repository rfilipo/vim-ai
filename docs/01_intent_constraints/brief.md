# Phase 1 — Intent & Constraints (brief)

## Intent

Give a Vim user the K-AIDF essentials without leaving the editor:

1. Run `kob audit` on the current project and read the scorecard in a split.
2. Follow the mentor workflow (phase quiz, briefs, exit criteria).
3. See the project's contracts and instant apps at a glance.
4. Ask the project's (local) model questions with buffer context.

## Constraints (non-negotiable)

- **Local-first.** The plugin only invokes the local `kob` CLI. No network
  calls, no telemetry, no third-party services in the plugin itself.
- **Thin shell.** Governance state stays in the project repository, in the
  K-AIDF formats. The plugin keeps no parallel state of its own.
- **Honest surface.** Commands that are not wired yet must say so in the
  editor; no fake output.
- **Portability.** Vim 9+ and Neovim, no external dependencies beyond `kob`.
- **License.** MIT, like K-AIDF.

## Non-goals (v1)

- Reimplementing the audit or the mentor inside Vimscript.
- Editing contracts/apps from the editor (read + invoke first).
- Supporting editors other than Vim/Neovim.
