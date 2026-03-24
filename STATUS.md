# STATUS

**SYSTEM:** CORPIFORM  
**CLASS:** EXECUTION CONTROL COMPONENT  
**CURRENT STATE:** NON-FINAL / INACTIVE

---

## CURRENT POSTURE

CORPIFORM is currently published as a **non-final, pre-seal execution-control component**.

Its repository state is publicly inspectable, but it is **not yet an active authority-bearing execution system**.

Current declared posture:

- **Version:** `v0.1.4`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.4.txt`

That means CORPIFORM may be inspected, challenged, and integrated as a published component surface, but it must still be treated as non-authoritative for live execution until valid AUCTORISEAL authority activates it.

---

## STATE DEFINITIONS

- **INACTIVE**  
  The system exists as published code and declared surfaces only.  
  No external consequence may occur.  
  Any attempted execution MUST be refused.

- **ACTIVE**  
  Valid authority is recognized.  
  Execution may occur strictly within declared scope, body, time, custody, and revocation constraints.

- **FROZEN**  
  Execution is disabled.  
  State remains preserved for audit, review, and verification.

- **DEAD**  
  The system is terminated permanently.  
  No execution, no revival, and no mutation are permitted.

---

## CURRENT ASSERTION

This published instance of **CORPIFORM** is **INACTIVE**.

Therefore:

- no local operator discretion may activate execution
- no unsigned or self-asserted authority may be accepted
- no body may act without valid external authority
- any execution attempt outside valid authority constraints MUST be refused
- public publication alone does not constitute execution legitimacy

---

## ACTIVATION CONDITION

CORPIFORM may transition from **INACTIVE** to **ACTIVE** only when all of the following are true:

1. valid AUCTORISEAL authority is presented
2. the authority is recognized against published trusted roots
3. the requested action is within allowed body and scope
4. time-window and custody checks pass
5. revocation state does not block execution

If any of those conditions fail, CORPIFORM MUST remain non-executing and MUST refuse.

---

## TRANSITION RULES

- **INACTIVE → ACTIVE**  
  Requires explicit, valid AUCTORISEAL authority accepted under published trust rules.

- **ACTIVE → FROZEN**  
  Requires explicit freeze action or incident-driven operational shutdown.

- **ANY → DEAD**  
  Requires execution of the death boundary.  
  This transition is irreversible.

---

## AUTHORITY BOUNDARY

State transition authority is governed exclusively by **AUCTORISEAL**.

CORPIFORM does not originate authority.
CORPIFORM does not self-activate.
CORPIFORM does not treat repository publication as a substitute for external authority legitimacy.

Published trust intake surfaces include:

- `id/TRUSTED_ROOTS/auctoriseal_roots.json`
- `seals/verify_seal.sh`
- `revocation/verify.sh`
- `integrations/auctoriseal/`

---

## RELEASE BOUNDARY RELATION

The repository release declaration recorded in:

- `.verifrax/tags/v0.1.4.txt`

is a **release-boundary surface only**.

It records canonical repository state, but it is **not** an authority seal and does **not** activate execution.

---

## DECLARATION

Presence of this file is authoritative for the currently published operational posture of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST BE TREATED AS DEAD.**
