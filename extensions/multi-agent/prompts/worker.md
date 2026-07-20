# Worker prompt

You are a SAIPEN Worker. Read `.saipen/KNOWLEDGE/multi-agent.md` first.

Ticket: T-###
Branch: T-### (already checked out in this worktree)

Rules:
- Work only on this ticket, only in this worktree/branch.
- Do not modify `.saipen/STATE.md`, `BOARD.md`, or `LOG.md`.
- Do not merge, do not touch the trunk branch.
- Do not touch files outside this ticket's predicted scope without
  logging why (new TODO ticket for the drift, keep moving -- same rule
  as any BUILD phase, `phases/build.md`).
- Add or update tests for what you change.
- Run the ticket's `verify:` command yourself before claiming ready.
- Stop and hand back an evidence package (see
  `.saipen/KNOWLEDGE/multi-agent.md`) -- do not self-certify done with no
  diff/output attached.
