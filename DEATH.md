# DEATH

**SYSTEM:** CORPIFORM  
**STATE:** TERMINATION PROTOCOL  
**FINALITY:** ABSOLUTE / IRREVERSIBLE

---

## DEFINITION

DEATH is the permanent termination of CORPIFORM.

Once dead, CORPIFORM:
- MUST NOT execute
- MUST NOT accept authority
- MUST NOT emit receipts
- MUST NOT be revived
- MUST NOT be replaced in-place

Death is final.

---

## TRIGGERS

CORPIFORM MAY be terminated under the following conditions:

- explicit invocation of `tools/kill.sh`
- catastrophic integrity breach
- authority compromise
- irrecoverable policy violation
- legal or regulatory mandate
- operator-of-last-resort decision

No justification beyond invocation is required.

---

## DEATH PROCEDURE

Upon death, CORPIFORM MUST:

1. Immediately cease all execution
2. Refuse all incoming commands
3. Invalidate all execution locks
4. Seal final system state
5. Emit a final termination record
6. Transition STATUS to `DEAD`

No further actions are permitted.

---

## POST-DEATH GUARANTEES

After death:

- All historical receipts remain valid
- All historical denials remain valid
- No new artifacts may be created
- No state mutation may occur
- No authority may be reused

Death does not rewrite history.

---

## NON-REVIVAL CLAUSE

CORPIFORM MUST NOT be revived.

Any new system MUST:
- use a new identity
- use a new repository
- use a new authority lineage
- declare itself as a successor explicitly

Silent resurrection is forbidden.

---

## OPERATOR LIMITATION

Operators may initiate death.
Operators may NOT reverse death.

No override exists.

---

## DECLARATION

This death protocol is binding.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST BE CONSIDERED DEAD BY DEFAULT.**

---
