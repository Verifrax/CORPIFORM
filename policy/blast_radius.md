# BLAST RADIUS

**SYSTEM:** CORPIFORM  
**BOUNDARY TYPE:** HARD / NON-EXPANDABLE

---

## DEFINITION

Blast radius defines the **maximum external impact** CORPIFORM is capable
of producing under any circumstance.

This boundary is absolute.

---

## GLOBAL LIMITS

CORPIFORM is limited to:

- executing a **single action per authority seal**
- interacting with **explicitly declared external adapters only**
- affecting **only the resources named in the authority scope**
- producing **no side effects beyond the declared action**

No hidden effects are permitted.

---

## BODY-LEVEL ISOLATION

Each BODY operates in complete isolation.

- MAIL body affects email systems only
- PAYMENT body affects payment rails only
- PUBLISH body affects registries only
- DEPLOY body affects deployment targets only

Bodies do not share state, memory, or execution context.

---

## PROHIBITED EXPANSION

CORPIFORM MUST NOT:

- broaden scope dynamically
- cascade actions across bodies
- chain executions
- infer related actions
- act on undeclared resources

Any attempt to expand blast radius results in refusal.

---

## FAILURE CONTAINMENT

On failure:

- no external rollback is attempted
- no compensating action is executed
- no alternative path is taken

Failure is contained to the attempted action only.

---

## TERMINATION ESCALATION

If blast radius containment is compromised:

- CORPIFORM MUST be frozen immediately
- authority MUST be revoked
- death protocol MUST be considered

---

## DECLARATION

This document defines the complete blast radius of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**

---
