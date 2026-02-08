# SEALS

This directory defines the **exclusive authority validation mechanism**
used by CORPIFORM.

Seals are **external, sealed authority artifacts**.
CORPIFORM does not issue seals.
CORPIFORM only verifies or rejects them.

---

## PURPOSE

The seal layer ensures that **no execution occurs without prior,
explicit, and verifiable authority**.

All seals originate from **AUCTORISEAL**.

---

## SEAL PRINCIPLES

- Seals are mandatory
- Seals are single-use
- Seals are non-transferable
- Seals are non-inferable
- Seals are time-bound
- Seals are scope-bound

Absence or ambiguity equals refusal.

---

## VERIFICATION STEPS

Seal verification includes:

1. Issuer verification against trusted roots
2. Cryptographic signature verification
3. Seal identity uniqueness check
4. Scope alignment with command
5. Body and action match
6. Time window validation
7. Revocation status check
8. Replay protection

Failure at any step is terminal.

---

## REVOCATION HANDLING

Revoked seals:

- MUST NOT be accepted
- MUST be rejected immediately
- MUST generate denial artifacts
- MUST be recorded in the ledger

Revocation is prospective only.

---

## OPERATOR LIMITATION

Operators may inspect seal verification results.
Operators may NOT bypass or override seal validation.

---

## FAILURE MODE

If this directory is missing, altered, or ambiguous:

- CORPIFORM MUST refuse all execution
- CORPIFORM MUST be treated as invalid

---

## DECLARATION

This directory defines the sole authority gate of CORPIFORM.

No seal, no execution.
