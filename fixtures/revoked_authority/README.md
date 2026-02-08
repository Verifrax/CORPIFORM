# REVOKED AUTHORITY FIXTURES

This directory contains **authority examples that have been explicitly revoked**.

The authority seal itself is structurally valid and within its time window,
but a corresponding revocation record exists and is effective.

---

## PURPOSE

These fixtures verify that CORPIFORM:

- consults the revocation ledger
- refuses execution for revoked authority
- enforces revocation prospectively
- emits denials deterministically
- does not allow override or grace periods

Revocation is absolute.

---

## CHARACTERISTICS

Each fixture here includes:

- a valid authority seal
- a valid revocation record
- an effective revocation timestamp
- an execution command that would otherwise be allowed

Only revocation invalidates the authority.

---

## EXPECTED OUTCOME

- Execution is refused
- A denial is emitted
- No receipt is emitted
- No external action occurs

---

## CRITICAL GUARANTEE

If a revoked authority:
- is accepted
- allows execution
- emits a receipt

then **CORPIFORM IS BROKEN**.

---

## DECLARATION

Revoked authority is dead authority.

Once revoked, it must never act again.
