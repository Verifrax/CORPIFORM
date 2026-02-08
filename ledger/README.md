# LEDGER

This directory contains the **append-only factual record** of all CORPIFORM activity.

The ledger is the system’s memory of reality.
It is not a log.
It is not mutable.
It is not a debugging aid.

---

## LEDGER PRINCIPLES

- Append-only
- Non-rewriteable
- Non-erasable
- Chronological
- Auditable

If something is not in the ledger, it did not happen.

---

## LEDGER CONTENTS

The ledger records only finalized artifacts:

- execution receipts
- execution denials
- authority revocations
- execution locks
- checkpoints

No intermediate state is stored.

---

## IMMUTABILITY

Ledger entries MUST NOT:

- be edited
- be deleted
- be reordered
- be compacted
- be garbage-collected

Any such action invalidates the system.

---

## WRITE RULES

- Entries are written once.
- Filenames are globally unique.
- Content is cryptographically signed.
- Timestamps are UTC.

---

## READ RULES

- Ledger may be read freely.
- Ledger may be copied for audit.
- Ledger may not be interpreted or summarized by CORPIFORM itself.

---

## FAILURE MODE

If this directory is missing, altered, or ambiguous:

- CORPIFORM MUST refuse all execution
- CORPIFORM MUST be considered invalid

---

## DECLARATION

The ledger is the authoritative historical record of CORPIFORM.

Reality lives here.
