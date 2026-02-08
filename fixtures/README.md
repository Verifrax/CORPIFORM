# FIXTURES

This directory contains **deterministic test artifacts** used to validate
CORPIFORM’s enforcement guarantees.

Fixtures are **not inputs**, **not authority**, and **not evidence**.
They exist solely to exercise refusal and acceptance paths under control.

---

## RULES

- Fixtures MUST NOT be used in production
- Fixtures MUST NOT authorize real execution
- Fixtures MUST NOT be signed with real keys
- Fixtures MUST NOT be referenced by receipts or denials

Fixtures simulate conditions. They do not create reality.

---

## STRUCTURE

Each subdirectory represents a **single failure or acceptance class**:

- `valid_authority/` — structurally valid, test-only authority
- `invalid_authority/` — malformed or untrusted authority
- `expired_authority/` — authority outside valid time window
- `revoked_authority/` — authority explicitly revoked
- `scope_violation/` — command exceeds authorized scope
- `time_violation/` — command executed outside time bounds
- `replay_attempt/` — reuse of consumed authority or command

Each fixture set is isolated.

---

## CONTENT EXPECTATION

A fixture set MAY include:

- authority seal JSON
- execution command JSON
- revocation record JSON
- prior receipt or denial JSON

All artifacts are synthetic.

---

## ENFORCEMENT GUARANTEE

If any fixture here:
- executes successfully, or
- emits a receipt

then **CORPIFORM IS INVALID**.

---

## DECLARATION

Fixtures exist to prove refusal paths.

Acceptance of an invalid fixture is a fatal defect.
