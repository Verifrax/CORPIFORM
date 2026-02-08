# CICULLIS INTEGRATION

This directory defines the **pre-damage enforcement integration**
between CORPIFORM and **CICULLIS**.

CICULLIS is a **hard gate**.
It enforces all constraints **before** irreversible action can occur.

---

## ROLE

CICULLIS exists to ensure that:

- no execution reaches a BODY without full validation
- no partial state escapes enforcement
- no damage occurs before refusal is possible

It is the last barrier before consequence.

---

## ENFORCEMENT POSITION

CICULLIS operates at the boundary between:

- validated intent  
- irreversible execution  

Once CICULLIS allows passage, execution must complete or die.

---

## ENFORCED CONDITIONS

CICULLIS requires that **all** of the following are true:

- authority is valid and trusted
- scope is exact
- time window is valid
- custody is verified
- execute-once lock is acquired
- no ambiguity exists

Failure of any condition results in refusal.

---

## NON-AUTHORITY

CICULLIS does NOT:

- issue authority
- modify authority
- interpret intent
- retry execution
- override denial

It enforces mechanically.

---

## FAILURE HANDLING

If CICULLIS cannot complete enforcement:

- execution MUST NOT proceed
- denial MUST be emitted
- system integrity is preserved

---

## DECLARATION

CICULLIS ensures damage is impossible before validation is complete.

Nothing passes unless everything is satisfied.
