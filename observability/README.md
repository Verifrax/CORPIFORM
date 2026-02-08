# OBSERVABILITY

This directory defines **what CORPIFORM exposes for inspection**.

Observability exists for audit and diagnosis only.  
It does not influence execution.  
It does not grant authority.  

---

## OBSERVABILITY PRINCIPLES

- Observability is passive
- Observability is non-authoritative
- Observability is non-interactive
- Observability is post-hoc

Nothing in this directory may alter behavior.

---

## CONTENT TYPES

Observability may include:

- execution traces (structure, not data)
- metrics (counts, timings)
- samples (non-authoritative examples)

No sensitive data is permitted.

---

## FORBIDDEN CONTENT

CORPIFORM MUST NOT expose:

- secrets
- payload contents
- credentials
- message bodies
- payment details
- authority internals

Any such exposure is a violation.

---

## RUNTIME RULE

Observability output MUST be generated outside the repository
and copied here only as samples if needed.

Live logs MUST NOT be committed.

---

## FAILURE MODE

If observability interferes with execution:

- execution MUST be refused
- system integrity is compromised

---

## DECLARATION

Observability reveals behavior without enabling it.

Inspection is allowed. Interaction is not.
