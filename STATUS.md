# STATUS

**SYSTEM:** CORPIFORM  
**CLASS:** BODY / EMBODIED CONSEQUENCE  
**CURRENT STATE:** NON-FINAL / INACTIVE

---

## STATE DEFINITIONS

- **INACTIVE**  
  The system exists as code only.  
  No execution is permitted.  
  No external consequence may occur.

- **ACTIVE**  
  Authority seals are accepted.  
  Execution may occur strictly within scope.

- **FROZEN**  
  Execution is disabled permanently.  
  State is preserved for audit and verification only.

- **DEAD**  
  The system is terminated.  
  No execution, no revival, no mutation.

---

## CURRENT ASSERTION

This instance of **CORPIFORM** is **INACTIVE**.

- No authority is recognized.
- No BODY is permitted to act.
- Any attempt to execute MUST be refused.

---

## TRANSITION RULES

- INACTIVE → ACTIVE  
  Requires explicit, valid AUCTORISEAL seal.

- ACTIVE → FROZEN  
  Requires explicit freeze command or incident protocol.

- ANY → DEAD  
  Requires execution of `tools/kill.sh`.  
  This transition is irreversible.

---

## AUTHORITY

State transitions are governed exclusively by **AUCTORISEAL**.

No local override exists.

---

## DECLARATION

Presence of this file is authoritative.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST BE TREATED AS DEAD.**

---
