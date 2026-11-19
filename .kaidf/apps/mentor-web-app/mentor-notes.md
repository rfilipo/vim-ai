---
id: apps/mentor-web-app/mentor-notes.md
title: Mentor notes — mentor-web-app
document_class: core-doc
phase: 04_execution_instrumentation
visibility: internal
status: active
---

# Mentor Notes for mentor-web-app
## Step 7 :: Execution & Instrumentation

Question: What should the mentor implement or update first in the active instant app or workflow?
Answer: Implement the plugin commands for real, as the visual test defined in Phase 3: :KobChat sends the prompt with the current document as context to the local model and inserts the answer into the current document at the cursor; :KobAudit runs the audit and shows the scorecard; :KobContracts and :KobApps list the project's contracts and instant apps. Work in plugin/vim_ai.vim and autoload/vim_ai.vim. No instant app is needed for this step.
Mentor reply: Understood. Let's proceed with implementing the plugin commands as defined in Phase 3.

What should the mentor implement or update first in the active instant app or workflow?

Please review this answer yourself: check it, decide whether it's right for your situation, and accept or reject it accordingly.
## Step 8 :: Verification & Transfer

Question: What evidence must exist before this work is considered verified and transferable?
Answer: Evidence: (1) all 5 delivery phases accepted in kob status; (2) kob audit re-run after the remediation batch is applied, with the new score and any remaining findings recorded under docs/05_verification_transfer; (3) the CI workflow green on GitHub (Vimscript lint plus headless plugin load test, no continue-on-error); (4) a headless Vim smoke test proving the plugin loads and :KobAudit, :KobChat, :KobMentor, :KobContracts and :KobApps are registered; (5) the full state — plugin code, .kaidf scaffold, contracts and apps — committed and pushed, so the repository itself is the transferable artifact.
Mentor reply: Thank you for providing the evidence. Let's review it to ensure completeness and accuracy.

### Evidence Breakdown:
1. **All 5 delivery phases accepted in kob status**: This indicates that each phase of the project has been completed and approved.
2. **Kob audit re-run after the remediation batch is applied, with the new score and any remaining findings recorded under docs/05_verification_transfer**: This ensures that the plugin's functionality has been thoroughly tested and any issues have been addressed.
3. **CI workflow green on GitHub (Vimscript lint plus headless plugin load test, no continue-on-error)**: This confirms that the plugin loads correctly in a clean environment and passes all linting checks.
4. **Headless Vim smoke test proving the plugin loads and :KobAudit, :KobChat, :KobMentor, :KobContracts and :KobApps are registered**: This provides evidence that the plugin commands are functional and properly integrated.
5. **The full state — plugin code, .kaidf scaffold, contracts and apps — committed and pushed, so the repository itself is the transferable artifact**: This ensures that all necessary files are included for a complete transfer.

### Next Steps:
- **Verification Report**: Summarize the evidence and create a verification report.
- **Handover Notes**: Prepare notes on any additional steps or considerations during ownership transfer.
- **Next-Step Backlog**: Identify the next tasks to be completed after transferring ownership.

Would you like me to draft the verification report and handover notes based on this evidence?

Please review this answer yourself: check it, decide whether it's right for your situation, and accept or reject it accordingly.

