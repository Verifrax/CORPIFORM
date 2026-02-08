# AUTHORITY

**SYSTEM:** CORPIFORM  
**AUTHORITY MODEL:** EXTERNAL / SINGLE-SOURCE / NON-DELEGABLE

---

## AUTHORITY SOURCE

All execution authority for CORPIFORM originates **exclusively** from:

**AUCTORISEAL**

No other system, process, identity, or signal is recognized as legitimate authority.

---

## AUTHORITY REQUIREMENTS

For any execution to be permitted, a valid authority seal MUST:

- be issued by AUCTORISEAL
- be cryptographically verifiable
- explicitly name CORPIFORM as the execution BODY
- explicitly declare the action class
- explicitly declare the scope
- explicitly declare the custodian
- explicitly declare the time window
- be unexpired and unrevo​ked

Absence of any requirement results in refusal.

---

## AUTHORITY NON-DELEGATION

CORPIFORM does not delegate authority.

- Authority may not be inferred.
- Authority may not be inherited.
- Authority may not be escalated.
- Authority may not be substituted.

Each execution requires its own explicit seal.

---

## AUTHORITY VALIDATION

Authority validation is mandatory and occurs:

1. prior to any execution attempt
2. prior to any state change
3. prior to any external interaction

Validation failure is terminal.

---

## REVOCATION

Authority may be revoked **only** by AUCTORISEAL.

- Revocation applies prospectively.
- Past executions remain factual.
- Revoked authority must never be reused.

Any revoked seal MUST be refused.

---

## AUTHORITY FAILURE MODES

The following conditions require immediate refusal:

- missing authority
- malformed authority
- invalid signature
- scope mismatch
- custodian mismatch
- expired time window
- revoked seal
- replayed seal

No fallback behavior exists.

---

## OPERATOR LIMITATION

Human operators possess **no authority**.

Operators may:
- observe
- inspect
- terminate

Operators may NOT:
- authorize
- override
- retry
- approve execution

---

## DECLARATION

This document defines the complete authority model for CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**

---
