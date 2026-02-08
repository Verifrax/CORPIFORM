# BODY — DEPLOY

**BODY:** DEPLOY  
**CLASS:** INFRASTRUCTURE STATE TRANSITION  
**CAPABILITY:** DEPLOYMENT PROMOTION  
**AUTHORITY REQUIRED:** YES (AUCTORISEAL)

---

## PURPOSE

The DEPLOY body performs **deployment state transitions** only.

It exists to:
- promote an already-built deployment to a declared target

It does not build artifacts.
It does not modify code.
It does not manage infrastructure lifecycle.

---

## PERMITTED ACTIONS

The DEPLOY body MAY perform only:

- DEPLOYMENT_PROMOTION

Execution is:
- explicit
- execute-once
- irreversible at this layer
- receipt-bound

---

## FORBIDDEN ACTIONS

The DEPLOY body MUST NEVER:

- build artifacts
- modify deployment configuration
- infer deployment targets
- rollback autonomously
- retry failed promotions
- escalate scope or custody

Any such attempt MUST be refused.

---

## DATA HANDLING

- Deployment secrets must not be stored in-repo
- No environment variables are persisted
- Only promotion metadata is recorded in receipts

---

## FAILURE BEHAVIOR

On failure:
- deployment is considered not promoted
- no retry occurs
- denial is emitted
- lock remains

---

## EXTERNAL DEPENDENCIES

The DEPLOY body interacts only with declared adapters:

- k8s
- ssh

Undeclared adapters are forbidden.

---

## DECLARATION

This document defines the complete capability of the DEPLOY body.

If this file is missing, altered, or ambiguous,  
**THE DEPLOY BODY MUST BE CONSIDERED NON-OPERABLE.**

---
