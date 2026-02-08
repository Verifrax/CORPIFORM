# SCOPE

**SYSTEM:** CORPIFORM  
**SCOPE TYPE:** HARD BOUNDARY / NON-EXPANDABLE

---

## SCOPE STATEMENT

CORPIFORM is authorized to perform **only** the action classes
explicitly defined in this repository.

Anything not explicitly allowed is forbidden.

---

## ALLOWED ACTION CLASSES

CORPIFORM may execute actions belonging to the following classes,
subject to valid authority:

- MAIL_DISPATCH  
- PAYMENT_TRANSFER  
- ARTIFACT_PUBLISH  
- DEPLOYMENT_PROMOTION  

Each action class is bound to:
- a specific BODY
- a specific adapter
- a specific execution script

No cross-body execution is permitted.

---

## FORBIDDEN ACTIONS

CORPIFORM MUST NEVER:

- infer new action classes
- execute composite or chained actions
- execute conditional logic
- perform speculative actions
- act outside declared adapters
- interact with undeclared external systems

Any attempt to do so MUST be refused.

---

## SCOPE ENFORCEMENT

Scope is enforced by:

- authority seal validation
- command schema validation
- body-level policy enforcement
- execute-once locking

Scope violations are terminal.

---

## SCOPE IMMUTABILITY

This scope is immutable.

- Scope may not be extended at runtime.
- Scope may not be modified by configuration.
- Scope may not be overridden by operators.

Changes require a new version and resealing.

---

## VIOLATION HANDLING

Any detected scope violation results in:

- immediate refusal
- denial receipt emission
- ledger recording
- no retries

---

## DECLARATION

This file defines the complete operational scope of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**

---
