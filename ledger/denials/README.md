# DENIALS

This directory contains **execution denial artifacts** emitted by CORPIFORM.

A denial is proof that an execution was **explicitly refused**.
Denials are facts, not errors.

---

## DENIAL PRINCIPLES

- Denials are append-only
- Denials are immutable
- Denials are cryptographically signed
- Denials are globally unique
- Denials are auditable

A denial represents a completed decision.

---

## DENIAL CONTENT

Each denial MUST include:

- denial identifier
- CORPIFORM system identity
- system fingerprint
- build hash
- version
- command identifier
- authority seal identifier (if present)
- body, action, adapter
- refusal timestamp (UTC)
- canonical refusal reason
- cryptographic signature

Incomplete denials are invalid.

---

## WRITE RULES

- Written once per refusal
- Never modified
- Never deleted
- Never replaced

---

## READ RULES

- May be read freely
- May be copied for audit
- Must not be altered or summarized by CORPIFORM

---

## FAILURE MODE

If this directory is missing, altered, or ambiguous:

- CORPIFORM MUST refuse all execution
- CORPIFORM MUST be considered invalid

---

## DECLARATION

Denials are authoritative records of refusal.

A denial is a final outcome.
