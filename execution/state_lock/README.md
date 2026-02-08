# STATE LOCK

This directory implements the **execute-once locking mechanism** for CORPIFORM.

Locks prevent:
- command replay
- execution retries
- duplicate external actions

A lock represents a **permanent execution attempt**, not success.

---

## LOCK PRINCIPLES

- One lock per `command_id`
- Locks are immutable
- Locks are non-overridable
- Locks are fail-closed

Presence of a lock means the command has already been attempted.

---

## LOCK LIFECYCLE

1. Lock is acquired before execution
2. Execution is attempted exactly once
3. Lock remains after execution
4. Lock is never reused or reset

Locks do **not** indicate success or failure—only attempt.

---

## FAILURE HANDLING

If a lock already exists:

- execution is refused
- a denial artifact is emitted
- the attempt is recorded

No retry is permitted.

---

## STORAGE

Locks are stored in `ledger/locks/`.

Lock files are append-only artifacts.

---

## OPERATOR LIMITATION

Operators may inspect lock state.
Operators may NOT delete, modify, or override locks.

---

## DECLARATION

This lock mechanism is mandatory.

If this directory is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**

---
