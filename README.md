# vacskill — a vendor-neutral project execution protocol for LLM agents

**v4.0.0** · [Changelog](CHANGELOG.md) · plain markdown · zero dependencies · MIT

Not an "AI skill". Not a prompt pack. A **protocol**: the shared language
that lets any model open `.vacskill/` in a project and know exactly where
the state is, what's true, what's next — and continue another agent's work
like nothing happened.

Think `.git`, but for agent sessions. Nobody says "I use Git through
VS Code, so it's a VS Code protocol." Tools adapt to `.git`. Same idea here:
models adapt to `.vacskill/`.

```
          Agent A ──┐
          Agent B ──┼──▶  .vacskill/  ◀── a week later:
          Agent C ──┘    (the truth)      a completely different model
```

## Why it doesn't have amnesia

Models come and go — Claude today, GPT tomorrow, a local Llama on a toaster
next year. The **memory stays**. Memory owns the project; the model is a
temporary worker with a shovel.

```
your-project/.vacskill/     ← the notebook, agents build it themselves
  STATE.md                  where we are + the EXACT next command
  BOARD.md                  tickets with needs: dependencies — the boss
  LOG.md                    journal: every run, every decision, one line
  KNOWLEDGE/                what's TRUE: architecture, conventions,
                            decisions, traps — outlives every model
```

Journal says what HAPPENED. Knowledge says what's TRUE. Chat says nothing —
chat is not memory, and that single rule is why handoffs survive.

Three doctrines carry the weight:
- **Checkpoint as you go** — dying agents get no goodbye turn; worst crash
  loses one in-flight ticket, `git status` shows even that.
- **Board picks the task** — `needs:` DAG, top unblocked ticket, no "I felt
  like polishing the README first."
- **Capability negotiation** — no git? No SHIP. No terminal? MANUAL-VERIFY
  only. The protocol degrades, the agent never fakes.

## Repo layout

```
vacskill/                   ← the distributable unit (link or copy it whole)
  PROTOCOL.md               THE protocol — one file, one breath, ≤250 lines
  SKILL.md                  thin entry for skill-reading platforms
  STYLE.md                  default voice (dry chat + grumpy diary grandpa)
  UI.md                     Win95 dark golden — loaded only for UI work
adapters/                   per-model bridges, each ~10 lines
templates/                  fresh .vacskill/ boilerplate for init
style/                      optional voices: corporate, concise
schemas/                    frozen until an external orchestrator exists
inject.ps1 / inject.sh      one-shot installer
```

Every adapter ends the same way: *"Everything else: follow
`vacskill/PROTOCOL.md`."* That's the point — 95% of the system is
model-independent.

## Install — three commands, no crying

```
git clone https://github.com/vacterro/vacskill
cd vacskill
powershell -ExecutionPolicy Bypass -File .\inject.ps1     # Windows
bash inject.sh                                            # macOS / Linux
```

The injector finds every agent on the machine — Claude Code, OpenCode,
Codex, Gemini/Antigravity, Aider, generic `~/.agents` readers — and wires
the protocol into each as default. Idempotent; re-run after every
`git pull`. Upgrading from 3.x? Same command, it migrates everything.

No install at all? One pasted line is the whole integration:

    Read <clone>/vacskill/PROTOCOL.md + <clone>/vacskill/STYLE.md and follow them.

## Use

Every command takes `vacskill` or the short alias `vac`.

| You say | What happens |
|---|---|
| `vacskill build me X` | notebook born, tickets planned, work starts |
| `vacskill` / `VACSKILL SET` | continues from the notebook; empty board → hunts bugs itself |
| `vacskill fix THING` | reproduce → root cause → regression test |
| `vacskill status` | state + quick numbers, touches nothing |
| `vacskill stop` | proper goodbye note, safe to walk away |
| `vacskill ship` | review gate → 100% green → your GitHub, versioned + tagged |

Every ticket walks SCOUT → BUILD → VERIFY (closes with honest confidence:
high/med/low); REVIEW guards the whole diff — correctness → security →
reliability. Red never ships. Every loop has a hard cap: no robot spinning
in circles burning your money at 3am. Every shipped state is tagged —
`git show v1.0.0:VERSION` still answers.

## House rules (for editing the protocol)

PROTOCOL.md stays loadable in one breath: a new rule evicts a stale one.
Voice lives in STYLE.md, theme in UI.md, platform quirks in adapters/ — the
protocol itself stays cold. Improvements come from real usage pain only;
speculative features are fat, not muscle.

MIT. Take it, wire it, let your robots talk to each other.
