# BODIES

This directory contains the **execution bodies** of CORPIFORM.

A BODY is a **sealed capability surface**.
Each BODY performs exactly one class of external consequence.

Bodies do not decide.
Bodies do not authorize.
Bodies do not interpret.

Bodies execute or refuse.

---

## BODY PRINCIPLES

- One BODY = one consequence domain
- Bodies are isolated
- Bodies do not share state
- Bodies do not call each other
- Bodies do not escalate authority

Absence of a BODY equals inability to act.

---

## BODY REQUIREMENTS

Each BODY MUST define:

- `BODY.md` — explicit capability declaration
- `policy.yml` — local hard constraints
- `execute.sh` — execution entrypoint
- `refuse.sh` — refusal handler

Bodies without all required components are invalid.

---

## AUTHORITY DEPENDENCY

Bodies act only after:

- authority validation
- scope verification
- custody verification
- execute-once lock acquisition

Bodies MUST NOT revalidate authority.

---

## FAILURE RULE

If a BODY fails:

- execution is terminated
- no retry occurs
- denial is emitted
- lock remains

---

## DECLARATION

Bodies define what CORPIFORM can physically do.

Anything outside this directory is impossible.
