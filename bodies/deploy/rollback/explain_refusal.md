# DEPLOYMENT ROLLBACK — REFUSAL

Deployment rollback is **explicitly forbidden** in CORPIFORM.

---

## REASON

CORPIFORM performs **forward-only state transitions** under explicit authority.

Rollback implies:
- retrospective authority
- state mutation without fresh authorization
- erasure of historical consequence

These are forbidden.

---

## POLICY

- No rollback execution paths
- No undo semantics
- No emergency reversion
- No implicit corrective action

State transitions are final at this layer.

---

## CONSEQUENCE

If rollback is required:

- a new deployment promotion must be authorized
- a new authority seal must be issued
- the previous state remains historical fact

History is not undone.

---

## DECLARATION

This refusal is final.

Rollback does not exist in CORPIFORM.
