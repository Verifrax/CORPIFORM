# CHECKPOINTS

This directory contains **explicit state checkpoints** of CORPIFORM.

A checkpoint is a **snapshot of acknowledged system state** taken
for audit, verification, or controlled shutdown purposes.

Checkpoints do not grant authority.
Checkpoints do not alter execution behavior.

---

## CHECKPOINT PRINCIPLES

- Checkpoints are append-only
- Checkpoints are immutable
- Checkpoints are cryptographically signed
- Checkpoints are auditable

A checkpoint records *what was known*, not *what happened*.

---

## CHECKPOINT CONTENT

Each checkpoint MUST include:

- checkpoint identifier
- CORPIFORM system identity
- system fingerprint
- build hash
- version
- ledger index reference
- timestamp (UTC)
- cryptographic signature

Incomplete checkpoints are invalid.

---

## PURPOSE

Checkpoints may be used for:

- external audit
- forensic analysis
- controlled freeze
- pre-termination capture

Checkpoints MUST NOT be used to resume or replay execution.

---

## WRITE RULES

- Written only by explicit operator action
- Never modified
- Never deleted
- Never replaced

---

## READ RULES

- May be read freely
- May be copied for audit
- Must not be interpreted as execution history

---

## FAILURE MODE

If this directory is missing, altered, or ambiguous:

- CORPIFORM MUST refuse all execution
- CORPIFORM MUST be considered invalid

---

## DECLARATION

Checkpoints preserve state visibility without enabling action.

They remember without acting.
