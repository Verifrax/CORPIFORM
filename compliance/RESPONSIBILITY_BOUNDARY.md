# RESPONSIBILITY BOUNDARY

**SYSTEM:** CORPIFORM  
**BOUNDARY TYPE:** HARD / NON-DELEGABLE / NON-EXPANDABLE

---

## PURPOSE

This document defines **where CORPIFORM’s responsibility begins and ends**.

CORPIFORM is a **mechanical executor**, not a decision-maker, advisor, or guarantor.

---

## WHAT CORPIFORM IS RESPONSIBLE FOR

CORPIFORM is responsible **only** for:

- enforcing authority exactly as sealed
- executing commands exactly once
- refusing execution when constraints are not met
- emitting accurate receipts and denials
- preserving an immutable ledger

Nothing else.

---

## WHAT CORPIFORM IS NOT RESPONSIBLE FOR

CORPIFORM is **not** responsible for:

- correctness of authority decisions
- intent behind authority issuance
- correctness of command parameters
- outcomes beyond declared execution
- external system behavior
- downstream effects of execution
- business logic
- legal interpretation
- human judgment

These responsibilities exist outside the system.

---

## AUTHORITY RESPONSIBILITY

Responsibility for **why** an action was authorized belongs exclusively to:

- the authority issuer (AUCTORISEAL)
- the named custodian

CORPIFORM does not share this responsibility.

---

## OPERATOR RESPONSIBILITY

Operators are responsible only for:

- operating the system environment
- freezing or terminating the system when required
- preserving artifacts for audit

Operators do not authorize actions.

---

## USER RESPONSIBILITY

Users are responsible for:

- requesting authority appropriately
- supplying correct command inputs
- understanding consequences of execution

Misuse does not transfer responsibility to CORPIFORM.

---

## LEGAL POSITIONING

CORPIFORM is an **instrument**, not an agent.

It performs actions under explicit authority.
It does not exercise discretion.

This boundary is intentional.

---

## FAILURE AND LIABILITY

If CORPIFORM behaves according to this specification:

- responsibility lies with authority issuers and custodians
- CORPIFORM bears no decision liability

If CORPIFORM deviates, the system is invalid and must be terminated.

---

## DECLARATION

This boundary is final.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**
