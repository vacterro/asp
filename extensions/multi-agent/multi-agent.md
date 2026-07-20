# Multi-Agent Working Agreement

Read this before starting any Worker or Integrator session on this
project. Extension of RFC.md, never contradicts it -- if this file and
RFC.md ever disagree, RFC.md wins (RFC § 1.9: an extension can only add
checks on top of Core, never relax what Core already requires).

## Prime law

`.saipen/STATE.md`, `.saipen/BOARD.md`, `.saipen/LOG.md` are written only
by the Integrator. No exceptions, no "just this once."

## Workers

- One active ticket per Worker, one branch per ticket, one `git worktree`
  per Worker.
- MUST NOT modify `.saipen/STATE.md`/`BOARD.md`/`LOG.md`.
- MUST NOT merge into the trunk branch.
- MAY write to `.saipen/kitchen/agents/<worker-id>/` for scratch/reasoning
  the Integrator will fold into real `LOG.md` entries at merge time.
- MUST produce an evidence package before stopping (see below) -- a claim
  of "done" with no diff, no verify output, no regression test is not
  done, it's a guess.

## Integrator

- Owns `BOARD.md`/`LOG.md`/`STATE.md` -- the only writer.
- Processes the merge queue one ticket at a time: rebase onto trunk, run
  that ticket's `verify:`, run the full project verify, merge only if
  both are green.
- On merge: update `BOARD.md` (move the ticket to `## DONE`), append a
  `LOG.md` RUN entry, refresh `STATE.md`.
- On failure: do not merge. Ticket-level `## BLOCKED` with the failure
  reason (RFC § 1.2), or back to the Worker to fix, depending on whether
  the cause is clear.
- If a claim is active longer than RFC's staleness window and the Worker
  is still genuinely working, the Integrator refreshes `claim_time` --
  Workers don't write LOG, so nothing else keeps the claim alive.

## Isolation

- Branch name: `T-###`.
- Worktree per ticket, never shared between Workers.
- Two ACTIVE tickets in the same lane (`.saipen/KNOWLEDGE/lanes.md`) are
  serialized, not run in parallel.

## Merge queue

- First integrated wins; later branches rebase onto the new trunk.
- Rebase breaks that ticket's tests -> back to the Worker, not merged.
- Git merges cleanly but the full verify fails (semantic conflict, not a
  textual one) -> merge rejected, same as a textual failure.
- Same ticket fails post-rebase verify twice in a row -> `## BLOCKED`,
  worth asking whether the ticket needs splitting.

## Evidence package (what a Worker hands the Integrator)

```text
TICKET: T-###
STATUS: READY | BLOCKED
BRANCH: T-###
COMMIT: <hash>
FILES_CHANGED: <list>
VERIFY: <command> -> <output/result>
REGRESSION_TEST: <what was added, or n/a with why>
RISKS: <anything the Integrator should double-check before merging>
```

## Done

A ticket is DONE only when: merged into trunk, full verify passes,
`BOARD.md`/`LOG.md`/`STATE.md` all reflect it. Not before.
