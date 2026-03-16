# GOVERNANCE

**SYSTEM:** CORPIFORM  
**GOVERNANCE MODEL:** EXPLICIT / AUTHORITY-DEPENDENT / FAIL-CLOSED

---

## CURRENT GOVERNANCE POSTURE

CORPIFORM is currently published as a **non-final, pre-seal execution-control component**.

Current declared posture:

- **Version:** `v0.1.0`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.0.txt`

That means CORPIFORM governance is publicly inspectable, but repository publication alone does not grant active execution legitimacy.

Until valid AUCTORISEAL authority activates execution, CORPIFORM governance is primarily a governance-of-refusal and governance-of-boundaries posture.

---

## PURPOSE

CORPIFORM governance exists to answer these questions:

- who defines the execution boundary
- who may activate execution legitimacy
- what may change without breaking the published boundary
- what must remain explicit, inspectable, and fail-closed
- what happens when authority, trust, or operational posture becomes ambiguous

All governance inside CORPIFORM is subordinate to explicit external authority legitimacy and explicit published repository surfaces.

---

## GOVERNANCE SCOPE

This document governs:

- published operational posture
- execution-boundary doctrine
- body-boundary doctrine
- refusal and consequence doctrine
- trust-intake boundary visibility
- governance of public repository surfaces
- governance evolution rules for CORPIFORM itself

It does not govern:

- AUCTORISEAL root issuance rules
- VERIFRAX verdict semantics
- downstream product policy
- law, regulation, or legal enforceability
- implicit operator discretion

---

## GOVERNANCE AUTHORITY BOUNDARY

CORPIFORM does not originate authority.

CORPIFORM governance is constrained by three layers:

1. **published repository doctrine**  
   files such as `STATUS.md`, `AUTHORITY.md`, `CONTRACT.md`, `SECURITY.md`, and this file define the public control posture

2. **external authority legitimacy**  
   AUCTORISEAL determines whether valid authority exists for activation or execution

3. **execution enforcement surfaces**  
   execution, refusal, revocation, and trust-intake surfaces determine whether a requested action may proceed

If those layers disagree, CORPIFORM must resolve toward non-execution, refusal, freeze, or death rather than permissive interpretation.

---

## CURRENT GOVERNANCE ASSERTION

At the current published version:

- CORPIFORM is **NON-FINAL**
- CORPIFORM is **INACTIVE**
- CORPIFORM is **NOT SEALED**
- repository publication does not equal execution legitimacy
- no operator may self-upgrade repository state into active authority

Therefore no governance interpretation may claim active execution merely because the repository is present, cloned, or publicly visible.

---

## ROLE OF AUCTORISEAL

AUCTORISEAL is the authority source governing activation legitimacy.

That means AUCTORISEAL may determine whether:

- valid authority exists
- valid authority is revoked
- valid authority is frozen
- execution legitimacy may begin

CORPIFORM may consume that authority.
CORPIFORM may verify and enforce against that authority.
CORPIFORM may not replace, invent, or silently broaden that authority.

---

## ROLE OF CORPIFORM GOVERNANCE

CORPIFORM governance defines how the component must behave once its own repository surfaces are published.

It governs whether the repository remains:

- explicit instead of implied
- bounded instead of open-ended
- authority-dependent instead of self-authorizing
- refusal-capable instead of silently permissive
- legible to adversarial readers instead of documentation-fragmented

Governance failure occurs when the published surfaces allow ambiguity about legitimacy, execution scope, refusal conditions, or trust intake.

---

## OPERATOR LIMITS

Operators are not governance roots.

Operators may:

- inspect repository state
- review outputs and evidence
- run tests and fixtures
- freeze operations where allowed
- terminate the system where allowed
- publish clarified repository doctrine through governed review

Operators may not:

- self-authorize execution
- override declared refusal boundaries
- treat release declaration as active seal authority
- mutate governance by undocumented practice
- treat undocumented local behavior as canonical

---

## GOVERNANCE-RELEVANT CANONICAL SURFACES

The minimum canonical governance surfaces include:

- `README.md`
- `STATUS.md`
- `AUTHORITY.md`
- `CONTRACT.md`
- `SCOPE.md`
- `FAILURE.md`
- `DEATH.md`
- `SECURITY.md`
- `VERSION.md`
- `evidence/README.md`
- `.verifrax/tags/v0.1.0.txt`

If those surfaces drift materially from one another, governance legibility is broken.

---

## CHANGE GOVERNANCE

Changes to CORPIFORM governance must be:

- explicit
- committed in repository history
- reviewed through the governed pull-request path
- published on canonical repository surfaces
- non-implicit in effect

Governance may not evolve through private convention alone.

Any governance-relevant change that leaves public root surfaces inconsistent is governance drift and must be corrected before being treated as canonical.

---

## RELEASE BOUNDARY RELATION

The repository declaration recorded in:

- `.verifrax/tags/v0.1.0.txt`

is a **release-boundary surface only**.

It records canonical repository state, but it is not an authority seal, not a governance root by itself, and not an activation event.

It must be read together with `VERSION.md`, `STATUS.md`, `SECURITY.md`, `README.md`, and `evidence/README.md`.

---

## DISPUTE RULE

If there is disagreement about CORPIFORM posture, precedence is resolved by explicit published surfaces and fail-closed interpretation.

That means:

- undocumented intent loses to documented boundary
- local convenience loses to published refusal conditions
- ambiguous activation claims lose to explicit non-final posture
- repository publication alone loses to explicit authority requirements

If legitimacy cannot be established explicitly, CORPIFORM must be treated as non-active.

---

## NON-CLAIMS

CORPIFORM governance does not claim:

- sovereign authority
- legal supremacy
- automatic production readiness
- independent authority issuance
- active execution legitimacy prior to valid seal activation

It defines governance only for the execution-control component published under this repository.

---

## FINAL RULE

> **If governance is not explicit on published canonical surfaces, it must not be assumed.**

There are no implicit governance exceptions.

---

## DECLARATION

This file defines the canonical published governance posture of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST BE TREATED AS NON-LEGIBLE FOR GOVERNED EXECUTION.**
