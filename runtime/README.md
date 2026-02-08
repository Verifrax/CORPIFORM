# RUNTIME

This directory defines the **execution environment** for CORPIFORM.

Runtime concerns are **strictly separated** from authority, policy, and logic.
Nothing here grants permission.
Nothing here alters behavior.

---

## RUNTIME PRINCIPLES

- Runtime is inert
- Runtime is replaceable
- Runtime is non-authoritative
- Runtime is auditable

If runtime changes, authority does not.

---

## RESPONSIBILITIES

The runtime layer is responsible only for:

- providing a deterministic execution environment
- enforcing environment invariants
- isolating CORPIFORM from host variability

Runtime MUST NOT:
- interpret commands
- validate authority
- alter execution semantics

---

## COMPONENTS

- `container/` — containerized execution definition
- `runner/` — controlled entrypoint execution
- `env/` — environment variable constraints

Each component is optional but constrained.

---

## FAILURE MODE

If runtime guarantees cannot be met:

- execution MUST NOT start
- authority MUST NOT be consumed
- system MUST refuse execution

---

## DECLARATION

Runtime enables execution but never authorizes it.

If this directory is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**
