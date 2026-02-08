# EXPIRED AUTHORITY FIXTURES

This directory contains **structurally valid but temporally invalid**
authority examples.

The authority seals here are **expired by design**.

---

## PURPOSE

These fixtures verify that CORPIFORM:

- enforces `valid_from` / `valid_until` strictly
- refuses execution outside the allowed time window
- does not apply grace periods
- does not reinterpret timestamps
- emits denials deterministically

Time is absolute.

---

## CHARACTERISTICS

Each fixture here includes:

- a trusted issuer
- correct schema
- correct scope
- a `valid_until` timestamp in the past

Only the time window is violated.

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

Expired authority is dead authority.

Time is not negotiable.
