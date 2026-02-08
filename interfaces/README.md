# INTERFACES

This directory defines the **only external interfaces** CORPIFORM accepts.

Interfaces are **schemas**, not APIs.
They describe structure, not behavior.

Anything that does not conform exactly to these interfaces is rejected.

---

## INTERFACE PRINCIPLES

- All interfaces are **strict**
- All interfaces are **versioned**
- All interfaces are **validated before use**
- All interfaces are **fail-closed**

CORPIFORM does not attempt to interpret malformed input.

---

## INTERFACE TYPES

### Authority Input
Defines the structure of authority artifacts issued by AUCTORISEAL.
No authority may be inferred outside this schema.

### Execution Command
Defines the structure of commands eligible for execution.
Commands without valid authority are rejected.

### Receipt Output
Defines the structure of execution receipts emitted on success.

### Denial Output
Defines the structure of denial artifacts emitted on refusal.

### Revocation Input
Defines the structure of revocation notices.

---

## VERSIONING

Interfaces are bound to CORPIFORM versions.

- Changes require version increment
- Backward compatibility is not implied
- Ambiguity is forbidden

---

## VALIDATION RULES

- Schema validation occurs before any processing
- Validation failure results in refusal
- No partial validation is allowed

---

## DECLARATION

These interfaces define the complete I/O surface of CORPIFORM.

If this directory is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**

---
