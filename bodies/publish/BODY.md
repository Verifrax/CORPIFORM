# BODY — PUBLISH

**BODY:** PUBLISH  
**CLASS:** EXTERNAL ARTIFACT DISCLOSURE  
**CAPABILITY:** IMMUTABLE RELEASE / PUBLICATION  
**AUTHORITY REQUIRED:** YES (AUCTORISEAL)

---

## PURPOSE

The PUBLISH body performs **external publication of artifacts**.

It exists to:
- release immutable artifacts
- disclose artifacts to external registries or platforms

It does not manage content creation, editing, or lifecycle.

---

## PERMITTED ACTIONS

The PUBLISH body MAY perform only:

- ARTIFACT_PUBLISH

Execution is:
- explicit
- execute-once
- irreversible
- receipt-bound

---

## FORBIDDEN ACTIONS

The PUBLISH body MUST NEVER:

- modify artifacts prior to publication
- retract or delete published artifacts
- republish under different identifiers
- infer release targets
- batch publications
- retry failed publications
- escalate scope or custody

Any such attempt MUST be refused.

---

## DATA HANDLING

- Artifacts are treated as immutable payloads
- No artifact content is stored after publication
- Only publication metadata is recorded in receipts

---

## FAILURE BEHAVIOR

On failure:
- artifact is considered not published
- no retry occurs
- denial is emitted
- lock remains

---

## EXTERNAL DEPENDENCIES

The PUBLISH body interacts only with declared adapters:

- github_release
- registry

Undeclared adapters are forbidden.

---

## DECLARATION

This document defines the complete capability of the PUBLISH body.

If this file is missing, altered, or ambiguous,  
**THE PUBLISH BODY MUST BE CONSIDERED NON-OPERABLE.**

---
