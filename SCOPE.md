# SCOPE

**SYSTEM:** CORPIFORM  
**SCOPE TYPE:** EXPLICIT / BODY-BOUND / NON-EXPANDABLE

---

## CURRENT SCOPE POSTURE

CORPIFORM is currently published as a **non-final, pre-seal execution-control component**.

Current declared posture:

- **Version:** `v0.1.7`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.7.txt`

That means CORPIFORM publishes an inspectable scope boundary, but repository publication alone does **not** authorize live consequence.

Until valid AUCTORISEAL authority activates execution, the practical scope posture is a refusal-first posture under explicit bounded surfaces only.

---

## SCOPE STATEMENT

CORPIFORM may recognize and enforce **only** the execution classes, bodies, adapters, and consequence paths explicitly published in canonical repository surfaces.

Anything not explicitly declared on those surfaces is outside scope.

Nothing may be inferred from naming similarity, local convenience, operator intent, or unpublished implementation detail.

---

## CANONICAL BODY SCOPE

CORPIFORM currently partitions consequence into these body families:

- `deploy`
- `mail`
- `payment`
- `publish`

Those bodies are the published consequence domains.
They are not interchangeable.
They do not imply permission to perform one another’s actions.
They do not authorize composite or cross-body escalation by default.

---

## SCOPE UNITS

Scope in CORPIFORM is bounded simultaneously by:

1. **body**  
   the declared action family under `bodies/`

2. **action path**  
   the specific governed execution or refusal path

3. **authority scope**  
   the externally granted permitted action surface

4. **time boundary**  
   the authority-valid execution window

5. **custody boundary**  
   the intended actor or execution holder

6. **revocation state**  
   whether previously valid authority remains usable

An action is inside scope only if all relevant scope units align together.

---

## ALLOWED CONSEQUENCE CLASSES

At the repository surface level, CORPIFORM may only perform consequence through declared governed paths such as:

- mail send / receive handling surfaces
- payment transfer / reverse handling surfaces
- publish release / retract handling surfaces
- deploy promote / rollback handling surfaces

Each such path must remain:

- body-bounded
- authority-bounded
- adapter-bounded
- refusal-capable
- non-escalating

If a requested consequence does not map cleanly to a declared governed path, it is out of scope.

---

## FORBIDDEN SCOPE EXPANSIONS

CORPIFORM must never:

- infer a new body
- infer a new action class
- chain multiple consequential actions as one implied permission
- broaden a narrow authority into a wider body right
- treat adapter availability as execution permission
- treat local code presence as canonical scope
- execute against undeclared external systems
- transform release publication into operational scope legitimacy
- use undocumented glue logic as a scope bridge
- accept “close enough” scope matches

Any such expansion attempt is out of scope and must be refused.

---

## SCOPE ENFORCEMENT SURFACES

Canonical scope enforcement-related surfaces include:

- `SCOPE.md`
- `AUTHORITY.md`
- `CONTRACT.md`
- `execution/gate.sh`
- `execution/validate_authority.sh`
- `seals/verify_scope.sh`
- `seals/verify_time_window.sh`
- `seals/verify_custody.sh`
- `policy/allowed_actions.yml`
- `policy/forbidden_actions.yml`
- `bodies/`
- `interfaces/execution.command.schema.json`

These surfaces must remain mutually legible.
If they drift materially, permissive interpretation is forbidden.

---

## CURRENT ASSERTION

At the current published repository state:

- CORPIFORM is **NON-FINAL**
- CORPIFORM is **INACTIVE**
- CORPIFORM is **NOT SEALED**
- execution scope may be documented but not self-activated
- release-boundary metadata is not scope authority
- repository visibility alone does not widen scope

Therefore scope must currently be read as a declared future execution boundary plus an active present refusal boundary.

---

## NON-EXPANDABILITY RULE

Scope is non-expandable except through explicit governed repository change and a new published boundary state.

That means scope may not be expanded by:

- runtime flags
- environment variables
- operator convenience
- unpublished adapters
- undocumented scripts
- ad hoc manual approval
- silent interpretation of ambiguous authority

If scope changes materially, the canonical published surfaces must change explicitly.

---

## VIOLATION HANDLING

Any detected scope violation requires fail-closed treatment, including one or more of:

- refusal
- denial emission
- non-activation
- freeze
- ledger-visible consequence recording where applicable

No scope violation may be normalized into execution.

No retry may convert an out-of-scope action into an in-scope action unless valid authority and explicit boundary conditions independently change.

---

## RELATION TO AUTHORITY

Scope is not independent from authority.

Even an explicitly declared body path remains non-executable when:

- authority is missing
- authority is malformed
- authority is revoked
- authority is expired
- requested consequence exceeds granted scope
- custody does not match
- trust intake fails

Declared repository scope sets the outer boundary.
Valid authority determines whether any specific execution may happen inside it.

---

## RELATION TO RELEASE BOUNDARY

The repository declaration recorded in:

- `.verifrax/tags/v0.1.7.txt`

is a **release-boundary surface only**.

It records canonical repository state, but it does not itself grant execution scope, widen body permissions, or activate operational consequence.

Scope legitimacy must be established separately through explicit published doctrine plus valid external authority.

---

## FINAL RULE

> **If an action is not explicitly inside published body, authority, time, custody, and consequence boundaries together, CORPIFORM must treat it as out of scope.**

There are no implicit scope exceptions.

---

## DECLARATION

This file defines the canonical published scope posture of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION AND BE TREATED AS NON-LEGIBLE FOR SCOPE-GOVERNED CONSEQUENCE.**
