# CONTRACT

**SYSTEM:** CORPIFORM  
**ROLE:** EXECUTION-CONTROL COMPONENT  
**CONTRACT TYPE:** AUTHORITY-GATED / FAIL-CLOSED / CONSEQUENCE-BOUND

---

## CURRENT CONTRACT POSTURE

CORPIFORM is currently published as a **non-final, pre-seal execution-control component**.

Current declared posture:

- **Version:** `v0.1.7`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.7.txt`

That means CORPIFORM publishes a contract surface that is inspectable and challengeable, but it does **not** currently possess active execution legitimacy merely because the repository is public.

Until valid AUCTORISEAL authority activates execution, this contract is primarily a contract-of-refusal, contract-of-boundaries, and contract-of-non-escalation.

---

## PURPOSE

CORPIFORM exists to enforce whether an external action may occur under explicit authority constraints.

CORPIFORM does not originate authority.  
CORPIFORM does not determine truth.  
CORPIFORM does not convert repository publication into legitimacy.  
CORPIFORM either executes within valid bounds or refuses.

Its contract is to make execution consequence bounded, inspectable, and fail-closed.

---

## CONTRACTUAL GUARANTEES

CORPIFORM guarantees the following published invariants:

1. **NO VALID AUTHORITY → NO ACTION**  
   No consequential execution may occur without valid externally grounded authority.

2. **FAIL-CLOSED ON AMBIGUITY**  
   Ambiguous authority, scope, custody, revocation, or execution state must resolve to refusal or non-activation.

3. **EXECUTE ONCE**  
   An authorized execution path must not be silently replayed or retried as a new legitimate action.

4. **NO LOCAL LEGITIMACY ESCALATION**  
   Operators, repository publication, release declaration, and local convenience may not be treated as substitutes for authority.

5. **BODY- AND SCOPE-BOUND EXECUTION**  
   Execution must remain inside the explicit body, scope, time, custody, and revocation boundaries.

6. **GOVERNED OUTPUTS**  
   Successful execution must produce governed receipt surfaces; refused execution must produce governed denial surfaces.

7. **NO SILENT CONTRACT DRIFT**  
   If canonical public surfaces become inconsistent, permissive interpretation is forbidden.

---

## NON-NEGOTIABLE PROHIBITIONS

CORPIFORM must never:

- infer permission
- infer authority
- infer missing scope
- broaden custody
- broaden time window
- reinterpret release metadata as seal authority
- retry failed consequence as if it were fresh authority
- bypass refusal boundaries
- silently downgrade security or revocation failures
- substitute undocumented local behavior for published doctrine

Any such behavior breaks contract legibility.

---

## AUTHORITY DEPENDENCY

All execution legitimacy consumed by CORPIFORM must be externally grounded in AUCTORISEAL-facing surfaces.

This contract therefore depends on:

- valid authority intake
- explicit trust-root surfaces
- explicit revocation handling
- explicit refusal on invalidity or ambiguity

If authority cannot be established explicitly under published surfaces, the contract requires non-execution.

---

## EXECUTION CONSEQUENCE BOUNDARY

CORPIFORM may only perform consequence when all relevant conditions hold together:

1. valid external authority exists
2. trust intake succeeds
3. requested action matches declared body
4. scope matches requested consequence
5. custody checks pass
6. time-window checks pass
7. revocation does not block execution
8. replay protections do not block execution

If any one of these fails, CORPIFORM must refuse.

There is no contractually valid permissive fallback.

---

## REFUSAL CONTRACT

Refusal is not an error fallback.
Refusal is a first-class contract outcome.

CORPIFORM is contractually required to refuse when authority, trust, scope, timing, custody, replay status, or revocation status is insufficiently established.

A refusal-preserving system is more contract-faithful than a permissive one.

---

## RECEIPT AND DENIAL CONTRACT

CORPIFORM binds itself to governed result classes:

- **receipt** for permitted execution
- **denial** for refused execution

Those outputs must remain inspectable, structured, and compatible with ledger-visible consequence recording.

Execution without governed output is contractually incomplete.

---

## FAILURE MODEL

The contract requires fail-closed outcomes for conditions including:

- missing authority
- malformed authority
- unverifiable authority
- unknown issuer
- trust-root mismatch
- revoked authority
- expired authority
- scope mismatch
- body mismatch
- custody mismatch
- replay attempt
- ambiguous execution legitimacy
- confusion between release declaration and execution authority

Failure must not be normalized into silent success.

---

## OPERATOR BOUNDARY

Operators are not parties that can unilaterally expand this contract.

Operators may inspect, test, freeze, terminate, and publish clarified doctrine through governed repository change.

Operators may not:

- self-authorize execution
- override refusal semantics
- reinterpret contract silence as permission
- convert undocumented practice into canonical contract
- treat publication as activation

---

## RELEASE BOUNDARY RELATION

The repository declaration recorded in:

- `.verifrax/tags/v0.1.7.txt`

is a **release-boundary surface only**.

It records canonical repository state, but it does not itself grant authority, alter trust rules, or activate execution.

This contract must be read consistently with:

- `README.md`
- `STATUS.md`
- `SECURITY.md`
- `GOVERNANCE.md`
- `AUTHORITY.md`
- `VERSION.md`
- `evidence/README.md`

---

## TERMINATION RELATION

If contract legibility collapses, permissive execution is forbidden.

Where integrity, legitimacy, or recoverability is lost, CORPIFORM may require freeze, refusal, or death rather than continued operation.

Continued execution under broken contract conditions is contract violation.

---

## FINAL RULE

> **If a consequential action is not explicitly justified under valid authority and explicit published boundaries, CORPIFORM must not perform it.**

There are no implicit contract exceptions.

---

## DECLARATION

This file defines the canonical published contract posture of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST BE TREATED AS NON-OPERABLE FOR AUTHORITY-GOVERNED EXECUTION.**
