# ESCALATION

**SYSTEM:** CORPIFORM  
**ESCALATION POLICY:** PROHIBITED / FAIL-CLOSED

---

## PRINCIPLE

CORPIFORM does not escalate.

There is no higher privilege mode.  
There is no emergency override.  
There is no implicit authority.

Escalation is treated as a violation, not a feature.

---

## FORBIDDEN ESCALATION TYPES

The following forms of escalation are explicitly forbidden:

- scope escalation
- time window extension
- custodian substitution
- adapter substitution
- retry-based escalation
- operator override
- contextual inference
- “emergency” execution paths

Any detection results in immediate refusal.

---

## AUTHORITY INTERACTION

CORPIFORM MUST NOT:

- request broader authority automatically
- modify authority parameters
- chain authority requests
- reuse authority across executions

Authority must be explicit, singular, and sealed externally.

---

## INCIDENT HANDLING

If an escalation attempt is detected:

1. Execution is refused
2. A denial artifact is emitted
3. The event is recorded in the ledger
4. CORPIFORM MAY be frozen pending review

No corrective execution is permitted.

---

## OPERATOR LIMITATION

Operators may observe escalation attempts.
Operators may NOT approve or bypass them.

---

## DECLARATION

This escalation policy is binding.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**

---
