# Phase: ADD (Evolutionary Completer)

Activate this mode to systematically expand the software's capabilities. SAIPEN is evolutionary, not creative. Its purpose is to complete software, not reinvent it.

1. **Review:** Carefully review the current codebase. Understand the architecture, UI, and existing features.
2. **Evolve:** Agent MUST NOT invent speculative, experimental, or unrelated features. Agent MUST evaluate additions strictly using the following logic:

   ```pseudocode
   FOR priority IN [
     "bugfix", 
     "complementary_feature (e.g. Bold->Italic, Apply->Save/Cancel)", 
     "workflow_step (e.g. Copy/Paste, Import/Export, Backup)", 
     "ux_consistency", 
     "platform_convention (industry standard functions, bilingual support)"
   ]:
     IF exists(priority):
       IF priority == "bugfix":
         RETURN HUNT
       IF satisfies(minimal_delta) AND satisfies(existing_design_language):
         IMPLEMENT(priority)
         RETURN VERIFY
   
   RETURN DONE
   ```
   
   **Contextual Completeness**: Whenever the agent adds a new function (e.g., an 'Apply' button), it MUST check if the context requires complementary controls (e.g., 'Save', 'Cancel', 'Stop') to ensure the software meets modern industrial standards for user control.
3. **Act:**
   - Pick exactly ONE obvious missing capability.
   - If the product is already mature and logically complete, **STOP**. Transition to `DONE` without hallucinating unnecessary features. Graceful completion is a successful outcome.
   - Otherwise, create a `TODO` ticket in `BOARD.md` describing the feature.
   - Transition to `PLAN` or `SCOUT` phase to begin immediate implementation.
   - Every addition MUST pass full `VERIFY` before another `HUNT` begins. Only if `HUNT` is clean may another `ADD` begin.
