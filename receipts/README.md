# RECEIPTS

This directory defines the **receipt format and handling logic** for CORPIFORM.

A receipt is the **only proof** that an execution occurred.
Without a receipt, execution is considered nonexistent.

---

## RECEIPT DEFINITION

A receipt is a **signed, immutable artifact** emitted only after:

- valid authority verification
- successful execute-once completion
- irreversible external action

Receipts are facts.

---

## RECEIPT GUARANTEES

Each receipt guarantees:

- authority existed before execution
- execution occurred exactly once
- execution scope was respected
- execution cannot be replayed
- execution is auditable

---

## RECEIPT LIFECYCLE

1. Execution completes successfully
2. Receipt is constructed
3. Receipt is cryptographically signed
4. Receipt is written to the ledger
5. Receipt becomes permanent fact

No other path may produce a receipt.

---

## RECEIPT SCOPE

Receipts apply to:

- execution verification
- audit trails
- dispute resolution
- historical reconstruction

Receipts do not imply approval beyond declared authority.

---

## FAILURE MODE

If receipt emission fails:

- execution MUST be considered failed
- denial MUST be emitted instead
- no partial state is allowed

---

## DECLARATION

Receipts define executed reality.

If this directory is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**
