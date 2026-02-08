# POLICY

This directory defines the **hard, non-negotiable policy constraints**
under which CORPIFORM is permitted to exist and act.

Policies in this directory are **enforcement boundaries**, not guidance.

They are evaluated mechanically and without interpretation.

---

## POLICY PRINCIPLES

- Policies are **fail-closed**
- Policies are **non-overridable**
- Policies are **non-extendable at runtime**
- Policies are **local to CORPIFORM**
- Absence of policy implies denial

CORPIFORM does not negotiate policy.

---

## POLICY SCOPE

Policies apply to:

- execution eligibility
- action classes
- adapters
- rate limits
- blast radius
- escalation prohibition

Policies do **not** grant authority.
They only restrict behavior.

---

## POLICY HIERARCHY

1. AUTHORITY (external, sealed by AUCTORISEAL)
2. POLICY (local, static)
3. EXECUTION (mechanical)

Policy never overrides authority.
Policy may further restrict authority.

---

## MODIFICATION RULES

Any change to policy requires:

- version increment
- BUILD_HASH regeneration
- resealing before execution

Runtime modification is forbidden.

---

## FAILURE MODE

If this directory is missing, altered, or ambiguous:

- CORPIFORM MUST refuse all execution
- CORPIFORM MUST be considered invalid

---

## DECLARATION

Policies define what CORPIFORM will **never** do.

Anything not explicitly permitted is forbidden.
