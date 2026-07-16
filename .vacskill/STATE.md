---
phase: DONE
task: none
next_action: "Next change: bump VERSION per scheme, CHANGELOG line, commit, git tag -a, push --tags; re-run inject.ps1 to refresh copies"
blocker: none
agent: claude-code
updated: 2026-07-17T01:50:00Z
---
## Handoff
Done: v4.0.0 — skill became protocol: vacskill/PROTOCOL.md canon (240 lines), thin SKILL.md adapter, 9 adapters/, templates/, style/ voices, schemas frozen; injectors upgraded (PROTOCOL.md blocks, no-BOM writes).
Warnings: copies (~/.agents, Antigravity x2) refresh only via inject.ps1 re-run; PowerShell Set-Content is banned (traps.md) — injector now uses Write-NoBom.
