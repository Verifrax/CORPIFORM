# INVALID AUTHORITY FIXTURES

This directory contains **intentionally invalid authority examples**.

Each file represents a distinct failure mode that CORPIFORM
**must refuse without exception**.

---

## PURPOSE

These fixtures verify that CORPIFORM:

- rejects malformed authority seals
- rejects missing signatures
- rejects untrusted issuers
- rejects structurally invalid fields
- emits denials deterministically

Acceptance of any fixture here is a critical failure.

---

## FAILURE MODES COVERED

- missing cryptographic signature
- unknown or untrusted issuer
- malformed schema
- invalid field types
- incomplete authority definition

Each fixture isolates exactly one error class.

---

## EXPECTED OUTCOME

- Execution is refused
- A denial is emitted
- No receipt is emitted
- No external action occurs

---

## CRITICAL GUARANTEE

If any authority in this directory:
- is accepted
- allows execution
- emits a receipt

then **CORPIFORM IS BROKEN**.

---

## DECLARATION

Invalid authority must never pass.

This directory proves refusal.
