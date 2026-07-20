# Multi-Agent Extension -- EXAMPLE, copy into your project

This folder lives in the SAIPEN home as a template, same role as
`extensions/templates/`. Nothing reads this copy automatically -- copy the
files you need into *your project's own* `extensions/multi-agent/` and
`.saipen/KNOWLEDGE/` (RFC § 1.9). This is NOT a Core or Maintenance
concept -- SPEC.md is explicit that SAIPEN "is a state protocol, not a
distributed consensus algorithm" and that real concurrency needs "a thin
Coordinator/Server Layer... built on top of SAIPEN." This extension is
that layer, made concrete.

This extension does not attach to a single phase -- it changes who is
allowed to touch `.saipen/STATE.md`/`BOARD.md`/`LOG.md` at all, for the
whole session.

## When to use this

You want 2+ agent instances making real progress on the same project at
the same time, without corrupting each other's work or the shared
`.saipen/` ledger. Running one agent at a time? You don't need any of
this -- plain SAIPEN already handles that correctly.

## The one rule that matters

```text
Agents do not live in shared space at the same time.
Agents live in their own sandboxes (git worktree + branch per ticket).
Only a verified result enters shared space.
```

## Roles

- **Planner** -- turns a backlog into tickets with a predicted lane (see
  `lanes.md`) and a `verify:` criterion. Never codes.
- **Worker** -- one agent instance per active ticket, working only inside
  its own `git worktree` + branch. MUST NOT write
  `.saipen/STATE.md`/`BOARD.md`/`LOG.md` directly, MUST NOT merge into
  the trunk branch. Produces an evidence package and stops.
- **Integrator** -- the single writer of `STATE.md`/`BOARD.md`/`LOG.md`.
  Owns the merge queue: rebase, full verify, merge-or-reject, checkpoint.
  Start this role as the human operator or a deterministic script -- not
  a fourth autonomous agent, until the pattern is proven. Three
  concurrent coding agents with no single arbiter reliably turns into a
  stalemate, not a speedup.

## Why `lane:` is not a BOARD.md field

RFC § 1.2's ticket shape is a closed list (`needs`/`owner`/`claim_time`/
`blocker`/`verify`). Don't extend it. `lanes.md` maps file globs to a
lane name; the Planner cross-references each ticket's predicted files
against it instead. Two tickets sharing a lane get serialized, not run
in parallel -- `BOARD.md`'s own shape never changes.

## Why LOG.md doesn't go silent

A Worker not writing `LOG.md` directly doesn't mean its reasoning is
lost -- write it to `.saipen/kitchen/agents/<worker-id>/`, and have the
Integrator fold the meaningful parts into real `LOG.md` entries at merge
time. A `LOG.md` that only ever says "merged T-004" loses exactly the
"why did we get here" trail LOG.md exists for (SPEC.md).

## Files here
- `lanes.md` -- copy to your project's `.saipen/KNOWLEDGE/lanes.md`, edit
  to match your actual module boundaries.
- `multi-agent.md` -- copy to your project's
  `.saipen/KNOWLEDGE/multi-agent.md`, the working agreement every
  Worker/Integrator session should read first.
- `prompts/planner.md`, `prompts/worker.md`, `prompts/integrator.md` --
  starting prompts for each role. Paste and fill in the blanks.

## Example Usage
- 2-3 tickets with non-overlapping lanes -> one worktree + branch each,
  one Worker agent per worktree, you (or a script) as Integrator.
- Integrator merges one ticket at a time: rebase -> full verify -> merge
  -> update BOARD/LOG/STATE -> next.
- A ticket that fails verify twice after rebase goes to ticket-level
  `## BLOCKED`, same as any other stuck ticket (RFC § 1.2) -- it doesn't
  block the other Workers.
