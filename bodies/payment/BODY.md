# BODY — PAYMENT

**BODY:** PAYMENT  
**CLASS:** EXTERNAL VALUE TRANSFER  
**CAPABILITY:** FUNDS TRANSFER (OUTBOUND)  
**AUTHORITY REQUIRED:** YES (AUCTORISEAL)

---

## PURPOSE

The PAYMENT body performs **money movement** only.

It exists to:
- transfer funds via declared payment adapters

No accounting, invoicing, or reconciliation is performed here.

---

## PERMITTED ACTIONS

The PAYMENT body MAY perform only:

- PAYMENT_TRANSFER

Execution is:
- explicit
- single-pass
- execute-once
- receipt-bound

---

## FORBIDDEN ACTIONS

The PAYMENT body MUST NEVER:

- infer amounts
- infer recipients
- split payments
- batch payments
- retry transfers
- attempt reversals autonomously
- create refunds
- escalate scope or custody

Any such attempt MUST be refused.

---

## DATA HANDLING

- Payment secrets must not be stored in-repo
- No sensitive payment identifiers are recorded in receipts
- Only minimal execution metadata is recorded

---

## FAILURE BEHAVIOR

On failure:
- transfer is considered not executed
- no retry occurs
- denial is emitted
- lock remains

---

## EXTERNAL DEPENDENCIES

The PAYMENT body interacts only with declared adapters:

- stripe
- bank

Undeclared adapters are forbidden.

---

## DECLARATION

This document defines the complete capability of the PAYMENT body.

If this file is missing, altered, or ambiguous,  
**THE PAYMENT BODY MUST BE CONSIDERED NON-OPERABLE.**

---
::contentReference[oaicite:0]{index=0}
