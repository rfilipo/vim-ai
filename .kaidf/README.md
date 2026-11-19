---
id: README.md
title: K-AIDF scaffold — Vim-AI case
document_class: core-doc
phase: root
visibility: internal
status: active
---

# .kaidf — K-AIDF scaffold for the Vim-AI case

This directory holds the K-AIDF methodology scaffold for the Vim-AI project:
the repository the `kob` agent operates on and the KAIDF-AMM audit scores.

- `specs/kaidf.yaml` — the spec this scaffold was generated from
- `docs/` — the methodology documents of the case (phases 00–05, ethical
  model in `docs/20-ethical-model/`)
- `policy/` — machine-readable governance: PII masking, human-in-the-loop,
  budget and fallbacks
- `data/manifests/` — skill and dataset manifests the audit reads

Run `kob status` for the phase/score summary and `kob audit` for the full
scorecard with remediations.
