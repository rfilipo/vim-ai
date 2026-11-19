# CASE — Vim-AI: a Vim extension built *with* K-AIDF, audited to 100/100

**Project:** Vim-AI — a Vim extension that integrates the editor with the K-AIDF framework
**Repository:** https://github.com/rfilipo/vim-ai (MIT)
**Author:** Ricardo Filipo, Kobkob LLC
**Result:** KAIDF-AMM audit **100/100, Tier Platinum** · Mentor workflow **5/5 phases accepted**
**Timeframe:** one working session, 18–19 November 2026

## The project

Vim-AI brings the K-AIDF essentials into the editor: `:KobAudit` runs the governance
audit on the current project, `:KobMentor` follows the mentor workflow, `:KobContracts`
and `:KobApps` inspect the project's phase contracts and instant apps, and `:KobChat`
talks to the project's local model. The plugin is a thin, local-first shell over the
`kob` CLI — no cloud, no telemetry.

The case is the development method itself: Vim-AI was built **with K-AIDF** — the
framework's own scaffold, mentor workflow and audit governed the project that extends
the framework. Every step of the work is a versioned artifact in the repository.

## The starting point

A freshly generated scaffold, before any methodology work:

- KAIDF-AMM score: **14/100** — Tier *Non-Compliant / Unrated*
- Delivery phases accepted: **0 of 5**
- The audit listed empty governance placeholders across all five dimensions:
  no PII masking rules, no human-in-the-loop configuration, no budget caps,
  no CI gates, no risk assessment.

## The method

Two loops, both human-led, both leaving artifacts:

1. **The mentor loop.** The K-AIDF Basic mentor workflow walked the project through
   its five delivery phases — Intent & Constraints, Discovery & Mapping, Design &
   Simulation, Execution & Instrumentation, Verification & Transfer. Each phase was
   accepted only when its documents were filled and its exit criteria reviewed by the
   human operator. A local model (Qwen2.5-Coder 7B via Ollama) assisted; the process,
   not the model's eloquence, carried the governance. In Design, the operator defined
   the product test: *"Visual test. Must implement the commands (:) and output to
   current document."*
2. **The remediation loop.** Each `kob audit` produced a scorecard with itemized,
   point-weighted findings. Findings were answered in **remediation batches**:
   the framework's canonical templates filled with the project's real content —
   PII masking rules, human-in-the-loop decisions, token/timeout budget with local
   fallback, skill and dataset manifests, a five-risk assessment, an explicability
   schema, Front Matter v2 on every scaffold document, and a CI workflow whose gates
   cannot fail silently. Apply batch → re-audit → repeat.

## The score journey

| Step | Score | What happened |
| --- | --- | --- |
| Scaffold generated | 14/100 | Baseline: placeholders everywhere, 0/5 phases |
| Phase documents in place | 18/100 | Intent, system map and blueprint written |
| Mentor workflow complete | 18/100 | **5/5 phases accepted**; audit unchanged — phases gate on documents, the audit gates on governance |
| Remediation Batch 1 | **96/100 Platinum** | Governance artifacts filled; four dimensions at 20/20 |
| Remediation Batch 2 | 99/100 | Front Matter v2 completed on the phase documents |
| Remediation Batch 3 | **100/100 Platinum** | Front Matter v2 on the mentor app's own documents — *"No failed checks."* |

Final scorecard: Data Sovereignty & Perimeter 20/20 · Methodology-as-Code 20/20 ·
Regulatory Compliance 20/20 · Deterministic Guardrails 20/20 ·
Cost & Infrastructure Health 20/20.

## What this case proves

- **Methodology-as-code works on a real project, at small scale, in hours.** A solo
  engineer with a local 7B model and a deterministic audit loop took a repository from
  *Unrated* to *Platinum* in one session — with no step depending on a cloud service.
- **The audit and the mentor measure different things, and both matter.** Phase
  acceptance proves the work was *thought through*; the score proves the governance
  is *written down and machine-verifiable*. The gap between "5/5 phases" and "18/100"
  was the most instructive moment of the session.
- **Remediation is a repeatable engineering motion.** Findings → batch → re-audit is
  a loop any team can run; each batch is small, reviewable and committed.

## Honest scope — what is next

The governance loop is complete; the product loop continues. The plugin's read-only
commands work today; wiring `:KobChat` and `:KobMentor` to live model round-trips —
the Phase 3 visual test, output into the current document — is the next implementation
chapter, to be run under the same contracts and audit. The repository remains the
single source of truth for both.

## Artifacts

- Repository: https://github.com/rfilipo/vim-ai
- Framework: https://github.com/kobkob/K-AIDF
- In the repository: the phase documents (`.kaidf/docs/`), the governance policies
  (`.kaidf/policy/`), the manifests (`.kaidf/data/manifests/`), the CI workflow
  (`.github/workflows/ci.yml`) and this case's score journey in the commit history.
