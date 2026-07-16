---
name: vacskill
description: >
  Cross-agent work protocol. Trigger on "VACSKILL SET", "vacskill", "vac"
  (alias) and their subcommands (set/stop/status/ship/fix/GOAL), when
  resuming earlier work, or in any project containing .vacskill/. Persistent
  .vacskill/ memory lets any agent continue another's work without context
  loss. This file is only the skill-reader entry point — the protocol itself
  lives in PROTOCOL.md beside it.
---

# vacskill — skill adapter

This is a thin entry point for skill-reading platforms (Claude Code,
OpenCode, Codex, FreeBuff-class readers). The system is defined elsewhere:

1. **Read `PROTOCOL.md` in this folder — that is the protocol. Follow it.**
2. **Read `STYLE.md` in this folder — voices. Load both in one breath.**
3. UI work → also read `UI.md` here (Win95 dark golden, Verdana, no AA).

Platform notes for skill readers:
- Use your native task list (e.g. TodoWrite) only as a mirror; the
  authoritative scheduler is `.vacskill/BOARD.md` per protocol.
- Prefer your file tools over shell redirects for writing — UTF-8 no BOM.
- Everything else: PROTOCOL.md decides. No rule here may override it.
