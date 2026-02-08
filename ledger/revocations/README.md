# REVOCATIONS

This directory contains **authority revocation records** recognized by CORPIFORM.

A revocation is proof that a previously valid authority seal
has been explicitly invalidated.

Revocations are facts.  
They do not rewrite history.

---

## REVOCATION PRINCIPLES

- Revocations are append-only
- Revocations are immutable
- Revocations are cryptographically signed
- Revocations are globally unique
- Revocations are auditable

Revocation applies **prospectively only**.

---

## REVOCATION CONTENT

Each revocation MUST include:

- revocation identifier
- authority issuer identity
- authority seal identifier being revoked
- revocation reason
- effective timestamp (UTC)
- cryptographic signature

Incomplete revocations are invalid.

---

## EFFECT OF REVOCATION

After a revocation is recorded:

- the revoked seal MUST NOT be accepted
- any execution attempt using the seal MUST be refused
- historical executions remain valid

Revocation does not erase prior facts.

---

## WRITE RULES

- Written once per revocation
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

Revocations define the boundary of authority validity.

A revoked seal is dead.
