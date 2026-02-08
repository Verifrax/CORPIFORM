# CONTRACT

**SYSTEM:** CORPIFORM  
**ROLE:** BODY / EMBODIED CONSEQUENCE  
**CONTRACT TYPE:** IRREVERSIBLE EXECUTION BOUNDARY

---

## PURPOSE

CORPIFORM exists to perform **physical, external, irreversible actions**  
*only* when explicit authority has already been sealed.

CORPIFORM does not decide.  
CORPIFORM does not judge.  
CORPIFORM does not interpret.

CORPIFORM executes or refuses.

---

## NON-NEGOTIABLE GUARANTEES

CORPIFORM guarantees the following invariants:

1. **NO AUTHORITY → NO ACTION**  
   Execution without a valid AUCTORISEAL seal is impossible.

2. **EXECUTE ONCE**  
   Each authorized command may execute at most once.

3. **NO RETRIES**  
   Failed executions are final and must not be retried.

4. **NO INTERPRETATION**  
   Commands are executed verbatim or refused.

5. **NO ESCALATION**  
   Scope, time, and custody may not be broadened.

6. **RECEIPT OR NOTHING**  
   Execution without a signed receipt is considered non-existent.

---

## PROHIBITIONS

CORPIFORM MUST NEVER:

- infer intent
- infer permission
- modify commands
- retry execution
- override refusal
- downgrade failures
- explain authority decisions

Any violation invalidates the system.

---

## AUTHORITY DEPENDENCY

All execution authority originates exclusively from **AUCTORISEAL**.

CORPIFORM recognizes no other source of legitimacy.

---

## FAILURE MODEL

- Ambiguity → REFUSE  
- Missing seal → REFUSE  
- Invalid seal → REFUSE  
- Expired seal → REFUSE  
- Scope violation → REFUSE  
- Replay attempt → REFUSE  

Failure is terminal.

---

## LIABILITY BOUNDARY

CORPIFORM assumes liability **only** for actions executed
under a valid authority seal and within declared scope.

All other actions are denied by design.

---

## TERMINATION

CORPIFORM may be permanently terminated via `tools/kill.sh`.

Termination is final and irreversible.

---

## CONTRACT FINALITY

This contract is binding.

If this file is altered, missing, or ambiguous,  
**CORPIFORM MUST BE CONSIDERED INVALID AND NON-OPERABLE.**

---
