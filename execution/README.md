# EXECUTION

This directory defines the **mechanical execution spine** of CORPIFORM.

Execution here is **not logic**, **not judgment**, and **not workflow**.  
It is a strict, linear enforcement pipeline.

---

## EXECUTION PRINCIPLES

- Execution is **authority-gated**
- Execution is **single-pass**
- Execution is **non-retryable**
- Execution is **fail-closed**
- Execution is **non-interpreting**

If any step fails, execution stops permanently.

---

## EXECUTION FLOW

Execution MUST occur in the following order:

1. Require authority seal
2. Verify seal integrity
3. Verify scope alignment
4. Verify time window
5. Verify custody
6. Acquire execution lock
7. Execute exactly once
8. Emit receipt
9. Release lock
10. Exit

No step may be skipped or reordered.

---

## FAILURE HANDLING

On failure at any stage:

- execution stops immediately
- no external action occurs
- a denial artifact is emitted
- the failure is recorded
- no retry is allowed

Failure is final.

---

## LOCKING MODEL

Execution uses an **execute-once lock**.

- Only one execution per command ID
- Replay attempts are rejected
- Locks are never forcefully overridden

---

## OPERATOR LIMITATION

Operators may:
- inspect execution state
- freeze execution
- terminate the system

Operators may NOT:
- force execution
- retry execution
- bypass authority checks

---

## DECLARATION

This directory defines the only execution mechanism of CORPIFORM.

If this directory is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**

---
