# VERSION

**SYSTEM:** CORPIFORM  
**VERSIONING MODEL:** FORWARD-ONLY / NON-RETROACTIVE

---

## CURRENT VERSION

- **VERSION:** v0.1.0
- **STATE:** NON-FINAL
- **RELEASE TYPE:** PRE-SEAL
- **COMPATIBILITY:** NONE GUARANTEED

---

## VERSION PRINCIPLES

CORPIFORM follows strict forward-only versioning.

- Versions are immutable once published.
- Versions are never reused.
- Versions are never modified in place.
- Downgrades are forbidden.

---

## VERSION TRANSITIONS

Allowed transitions:

- `vX.Y.Z` → `vX.Y.(Z+1)`  
  Patch-level changes (no scope or contract change)

- `vX.Y.Z` → `vX.(Y+1).0`  
  Minor changes (internal structure, same contract)

- `vX.Y.Z` → `v(X+1).0.0`  
  Major changes (contract, scope, or authority changes)

All transitions require explicit resealing.

---

## SEALING REQUIREMENT

A version becomes **FINAL** only when:

- all contracts are complete
- scope is fixed
- authority model is sealed
- death protocol is present
- an explicit AUCTORISEAL seal is issued

Unsealed versions are non-authoritative by definition.

---

## COMPATIBILITY GUARANTEE

Only **FINAL** versions may be relied upon.

- Non-final versions provide no guarantees.
- Compatibility is never implied.
- Behavior must not be assumed stable.

---

## DECLARATION

This file defines the complete versioning rules for CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST BE TREATED AS NON-FINAL AND NON-AUTHORITATIVE.**

---
