# Board
## DOING
## TODO
- [ ] T-038 FIX encoding corruption in PROTOCOL.md + README.md | files: vacskill/PROTOCOL.md, README.md | verify: Select-String "[^\x00-\x7F]" + manual GitHub render check | needs:
- [ ] T-039 EVOLVE protocol — add missing init command alias, improve PLAN amplification guidance | files: vacskill/PROTOCOL.md | verify: line count ≤250 + 23-key grep PASS | needs: T-038
- [ ] T-040 README v4.1 — public-grade pitch, clean ASCII art, proper .git analogy section, badges | files: README.md | verify: no garbled chars, renders in browser | needs: T-038
- [ ] T-041 SHIP v4.1.0 — bump VERSION + CHANGELOG + commit + tag + push | files: VERSION, CHANGELOG.md | verify: git tag v4.1.0 + push PASS | needs: T-039, T-040
## DONE
- [x] T-037 REVIEW + SHIP v4.0.0 (verified: P0 dead-refs clean, BOM fixed, injector idempotent 11 rows, conf: high)
- [x] T-036 README v4 protocol positioning (verified: renders, version+changelog link present, conf: high)
- [x] T-035 injectors -> PROTOCOL.md scheme + stale-block upgrade + aider migration (verified: live run, 4x "block upgraded", aider "migrated" PASS, conf: high)
- [x] T-034 style/ voices: pointers not copies, opt-in switches, dup UI.md removed (verified: grep switch phrases 4/4 PASS, conf: high)
- [x] T-033 templates/ + KNOWLEDGE seed + schemas frozen README (verified: init dry-run from templates PASS, conf: high)
- [x] T-032 adapters/ 9 files, each -> vacskill/PROTOCOL.md (verified: grep 9/9 + BOM scan clean PASS, conf: high)
- [x] T-031 SKILL.md -> thin skill-reader adapter, 26 lines (verified: frontmatter + PROTOCOL.md pointer PASS, conf: high)
- [x] T-030 vacskill/PROTOCOL.md vendor-neutral canon + capability table (verified: 240/250 lines, 23-key grep PASS, conf: high)
