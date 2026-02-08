# DENIALS

This directory defines the **denial format and handling logic** for CORPIFORM.

A denial is a **final, authoritative refusal**.
It represents a completed decision, not an error.

---

## DENIAL DEFINITION

A denial is a **signed, immutable artifact** emitted whenever execution
is refused for any reason.

Denials are facts.

---

## DENIAL GUARANTEES

Each denial guarantees:

- execution did not occur
- refusal was explicit
- authority was missing, invalid, or insufficient
- no retry will be permitted
- refusal is auditable

---

## DENIAL LIFECYCLE

1. Execution attempt is refused
2. Denial artifact is constructed
3. Denial is cryptographically signed
4. Denial is written to the ledger
5. Denial becomes permanent fact

No other path may produce a denial.

---

## DENIAL SCOPE

Denials apply to:

- audit trails
- dispute resolution
- replay prevention
- historical reconstruction

Denials do not imply system failure.

---

## FAILURE MODE

If denial emission fails:

- execution MUST be considered refused
- system MUST halt
- no execution may proceed

---

## DECLARATION

Denials define refusal reality.

If this directory is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**
