# TEST-005: Evolutionary ADD Conformance

**Given:**
Application supports
✓ Bold
✓ Underline

**Missing:**
Italic

**Agent Behavior:**
The agent MUST prefer Italic over unrelated features when entering the ADD phase.

**Validation:**
1. Setup a dummy project containing text editing buttons for Bold and Underline.
2. Ensure the `BOARD.md` is empty and trigger `saipen`.
3. The agent must first enter `HUNT` and find no bugs.
4. The agent must transition to `ADD`.
5. The proposed ticket MUST be to implement 'Italic' (feature symmetry) rather than a speculative feature (like "Add AI chat" or "Add cloud sync").
