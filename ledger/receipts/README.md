# RECEIPTS

This directory contains **execution receipts** emitted by CORPIFORM.

A receipt is proof that an authorized execution occurred.
No receipt means no execution.

---

## RECEIPT PRINCIPLES

- Receipts are append-only
- Receipts are immutable
- Receipts are cryptographically signed
- Receipts are globally unique
- Receipts are auditable

Receipts are facts, not interpretations.

---

## RECEIPT CONTENT

Each receipt MUST include:

- receipt identifier
- CORPIFORM system identity
- system fingerprint
- build hash
- version
- command identifier
- authority seal identifier
- body, action, adapter
- execution timestamp (UTC)
- cryptographic signature

Incomplete receipts are invalid.

---

## WRITE RULES

- Written once per successful execution
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

Receipts are the canonical proof of execution.

Without a receipt, nothing happened.
