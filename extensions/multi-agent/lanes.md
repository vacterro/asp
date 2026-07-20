# Lanes

A lane groups files that tend to change together. Two ACTIVE tickets in
the same lane should be serialized, not run in parallel -- editing the
same files from two worktrees at once just means a bigger merge conflict
later, not real concurrency.

Format: lane name, then the file globs that belong to it. Keep this file
current as the project's real structure changes -- a stale lane map is
worse than none, since it gives false confidence.

## Example (adapt to your actual project structure)

```text
ui:
  - src/ui/**

editor-core:
  - src/editor/**

persistence:
  - src/state/**
  - src/persistence/**

infra:
  - tests/**
  - .saipen/**
```

## How the Planner uses this

For each ticket, predict which files it will likely touch, then check
which lane(s) those files fall under. Two TODO tickets sharing a lane
get a `needs:` dependency on each other (or explicit sequencing) instead
of being offered to two Workers at once.
