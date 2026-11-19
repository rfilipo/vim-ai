---
id: docs/00-overview/README.md
title: Vim-AI — case overview
document_class: core-doc
phase: 00-overview
visibility: internal
status: active
---

# Vim-AI — case overview

Vim-AI is a Vim extension that integrates the editor with the K-AIDF
framework. It is being built **with** K-AIDF: the `kob` agent works this
repository under the methodology — phase documents in `docs/`, phase
contracts in `contracts/`, instant apps in `apps/`, and the KAIDF-AMM audit
(`kob audit`) as the quality gate.

Why this case exists:

- **Dogfooding with an audience.** Every step (intent, mapping, design,
  execution, verification) is a repository artifact, not a chat log.
- **A real user surface.** Vim is where many engineers live; bringing the
  audit, the mentor and the project's governance state into the editor
  tests whether K-AIDF works at the point of writing code.
- **Local-first, end to end.** Editor → local `kob` → local model. No cloud
  in the loop.
