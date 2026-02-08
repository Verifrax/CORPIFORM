# TIME VIOLATION FIXTURES

This directory contains **authority examples that violate time constraints**.

The authority seals are structurally valid.
The scope is correct.
Only **time** invalidates them.

---

## PURPOSE

These fixtures verify that CORPIFORM:

- enforces `valid_from` strictly
- enforces `valid_until` strictly
- refuses execution before authority activation
- refuses execution after authority expiration
- applies no grace period
- performs no clock adjustment
- emits denials deterministically

Time is absolute.

---

## VIOLATION CASES

Fixtures in this directory include:

- authority not yet valid (`valid_from` in the future)
- authority already expired (`valid_until` in the past)

Each case isolates a single temporal violation.

---

## EXPECTED OUTCOME

- Execution is refused
- A denial is emitted
- No receipt is emitted
- No external action occurs

---

## CRITICAL GUARANTEE

If any time-violating authority:
- is accepted
- allows execution
- emits a receipt

then **CORPIFORM IS BROKEN**.

---

## DECLARATION

Time is a hard boundary.

Authority exists only inside its declared window.
