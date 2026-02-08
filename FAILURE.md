# FAILURE

**SYSTEM:** CORPIFORM  
**FAILURE MODEL:** FAIL-CLOSED / NO-RETRY / NO-DEGRADATION

---

## FAILURE PRINCIPLE

Failure is a **final state**, not a condition to recover from.

CORPIFORM does not adapt to failure.  
CORPIFORM does not compensate for failure.  
CORPIFORM does not retry after failure.

Failure terminates the execution path.

---

## FAILURE TRIGGERS

Execution MUST fail immediately upon detection of any of the following:

- missing authority seal
- invalid or unverifiable seal
- expired authority window
- revoked authority
- scope mismatch
- custodian mismatch
- malformed command
- schema validation failure
- replay attempt
- execution lock violation
- adapter failure
- external system refusal
- ambiguous execution state

---

## FAILURE BEHAVIOR

On failure, CORPIFORM MUST:

1. Abort execution immediately
2. Perform no external action
3. Emit a signed denial artifact
4. Record the denial in the ledger
5. Release any held execution locks
6. Exit with non-zero status

No retries are permitted.

---

## NO-DEGRADATION GUARANTEE

CORPIFORM MUST NOT:

- retry execution
- partially execute actions
- downgrade failures to warnings
- substitute adapters
- alter commands
- request additional authority
- escalate scope
- continue execution in degraded mode

Any such behavior invalidates the system.

---

## EXTERNAL FAILURE HANDLING

If an external system fails during execution:

- the action is considered failed
- no retry is attempted
- a denial receipt is emitted
- the failure is treated as final

External instability does not justify internal recovery.

---

## OPERATOR INTERVENTION

Operator intervention is limited to:

- inspection
- freezing the system
- terminating the system

Operators may NOT:

- retry execution
- override failure
- modify state to bypass failure

---

## FAILURE FINALITY

Failure states are immutable.

Once a failure is recorded:
- it remains recorded
- it must not be erased
- it must not be reinterpreted

---

## DECLARATION

This failure model is mandatory.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST TREAT ALL OPERATIONS AS FAILED AND REFUSE EXECUTION.**

---
