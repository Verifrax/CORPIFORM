# VALID AUTHORITY FIXTURE

This fixture represents a **synthetically valid authority scenario**.

All required fields are present.
All constraints are satisfied.
Structure is correct.
Scope matches the execution command.
Time window is valid.
Single-use semantics are declared.

---

## PURPOSE

Used to verify that CORPIFORM:

- accepts well-formed authority seals
- allows execution to pass the gate
- executes exactly once
- emits a receipt
- records immutable ledger evidence

---

## IMPORTANT

- This authority is **test-only**
- The signature is **non-cryptographic**
- It MUST NOT be used in production
- It MUST NOT correspond to real keys

---

## EXPECTED OUTCOME

- Execution proceeds
- One receipt is emitted
- No denial is emitted
- Replay is refused on second attempt

---

## FAILURE CONDITION

If this fixture is refused:
- authority validation is broken

If this fixture executes more than once:
- replay protection is broken

---

## DECLARATION

This fixture defines the **happy path**.

Everything else exists to prove refusal.
