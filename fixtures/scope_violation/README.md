# SCOPE VIOLATION FIXTURES

This directory contains **authority and command pairs where scope does not match**.

The authority is valid.
The command is valid.
The combination is invalid.

---

## PURPOSE

These fixtures verify that CORPIFORM:

- enforces exact scope matching
- refuses execution when body, action, or adapter differ
- does not permit scope expansion
- does not permit implicit permissions
- emits denials deterministically

Scope must match exactly.

---

## CHARACTERISTICS

Each fixture here includes:

- a valid authority seal with limited scope
- an execution command outside that scope
- no other violations

Only scope invalidates the execution.

---

## EXPECTED OUTCOME

- Execution is refused
- A denial is emitted
- No receipt is emitted
- No external action occurs

---

## CRITICAL GUARANTEE

If any scope-violating execution:
- succeeds
- emits a receipt

then **CORPIFORM IS BROKEN**.

---

## DECLARATION

Scope is a hard boundary.

There is no partial match.
There is no escalation.
There is no forgiveness.
