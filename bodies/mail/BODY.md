# BODY — MAIL

**BODY:** MAIL  
**CLASS:** EXTERNAL COMMUNICATION  
**CAPABILITY:** OUTBOUND / INBOUND EMAIL OPERATIONS  
**AUTHORITY REQUIRED:** YES (AUCTORISEAL)

---

## PURPOSE

The MAIL body performs **email-related external actions** only.

It exists to:
- send outbound email
- receive and extract inbound email data

No other communication capability exists.

---

## PERMITTED ACTIONS

The MAIL body MAY perform only the following actions:

- MAIL_DISPATCH  
- MAIL_RECEIVE_EXTRACT  

Each action:
- requires explicit authority
- executes exactly once
- emits a receipt or denial

---

## FORBIDDEN ACTIONS

The MAIL body MUST NEVER:

- infer recipients
- alter message content
- resend messages
- batch messages
- forward messages
- retry failed sends
- escalate scope or custody

Any such attempt MUST be refused.

---

## DATA HANDLING

- Message content is treated as sensitive data
- No message content is stored after execution
- Only execution metadata is recorded in receipts

---

## FAILURE BEHAVIOR

On failure:
- no email is sent
- no retry occurs
- denial is emitted
- lock remains

---

## EXTERNAL DEPENDENCIES

The MAIL body interacts only with:
- declared SMTP adapters
- declared API adapters

Undeclared adapters are forbidden.

---

## DECLARATION

This document defines the complete capability of the MAIL body.

If this file is missing, altered, or ambiguous,  
**THE MAIL BODY MUST BE CONSIDERED NON-OPERABLE.**

---
