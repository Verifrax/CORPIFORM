# FAILURE

**SYSTEM:** CORPIFORM  
**FAILURE MODEL:** FAIL-CLOSED / NO-RETRY / NO-LEGITIMACY-ON-AMBIGUITY

---

## CURRENT FAILURE POSTURE

CORPIFORM is currently published as a **non-final, pre-seal execution-control component**.

Current declared posture:

- **Version:** `v0.1.0`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.0.txt`

That means CORPIFORM publishes a failure doctrine that is inspectable and binding as a public control surface, but it does **not** currently possess active execution legitimacy merely because the repository is public.

Until valid AUCTORISEAL authority activates execution, the dominant live failure posture is refusal, non-activation, and fail-closed handling of ambiguity.

---

## FAILURE PRINCIPLE

Failure in CORPIFORM is not a prompt for improvisation.

CORPIFORM does not compensate for legitimacy failure.  
CORPIFORM does not reinterpret ambiguous state into permission.  
CORPIFORM does not retry consequential action as a substitute for validity.  
CORPIFORM does not degrade from explicit boundaries into convenience.

Failure terminates the attempted execution path or blocks it from becoming legitimate in the first place.

---

## FAILURE DOMAINS

Failure may arise in any of the following domains:

- authority legitimacy
- trust-root interpretation
- scope matching
- custody matching
- time-window validity
- revocation state
- command structure
- execution state
- adapter behavior
- external consequence path
- repository-surface legibility

Failure in any one critical domain is sufficient to require fail-closed handling.

---

## FAILURE TRIGGERS

CORPIFORM must fail closed immediately upon detection of conditions including:

- missing authority
- malformed authority
- invalid or unverifiable authority
- unknown issuer
- trust-root mismatch
- expired authority window
- revoked authority
- scope mismatch
- custody mismatch
- body mismatch
- malformed command
- schema validation failure
- replay attempt
- execution lock violation
- adapter substitution
- adapter failure
- external system refusal
- ambiguous execution state
- ambiguity about whether release metadata is being misused as authority
- material drift between canonical public control surfaces

There is no permissive fallback for these conditions.

---

## FAILURE BEHAVIOR

On fail-closed outcome, CORPIFORM must do only what remains contractually legitimate, including as applicable:

1. stop the attempted execution path immediately
2. perform no unauthorized external consequence
3. preserve non-execution over degraded execution
4. emit a governed denial artifact where the path requires denial emission
5. preserve or record failure state where the system surface requires it
6. release execution locks or transient guards safely
7. exit with a failure status rather than pretending success

Failure behavior must preserve system legibility, not operational appearance.

---

## NO-RETRY RULE

CORPIFORM must not treat a failed consequential path as a candidate for automatic retry.

That means it must not:

- replay the same attempted action automatically
- reinterpret prior refusal as temporary permission
- continue execution after a failed legitimacy gate
- resubmit consequence because an external adapter was unstable
- use operator intent as a substitute for new valid authority

A new attempt is legitimate only if all required boundary conditions are re-established independently under valid authority and explicit public surfaces.

---

## NO-DEGRADATION RULE

CORPIFORM must never respond to failure by becoming more permissive.

It must not:

- downgrade failure to warning
- partially execute consequence
- silently skip validation
- silently switch adapters
- broaden scope after validation failure
- broaden custody after mismatch
- continue after revocation ambiguity
- convert missing legitimacy into “best effort” behavior
- treat documentation inconsistency as harmless

Degradation under failure is itself a failure.

---

## EXTERNAL FAILURE RELATION

If an external system fails during or before consequence:

- CORPIFORM must treat the consequential path as failed or non-completable
- no implicit retry is allowed
- no silent continuation is allowed
- no legitimacy is gained from partial external progress
- governed outputs must reflect refusal, failure, or non-completion according to the declared path

External instability does not justify internal contract relaxation.

---

## OPERATOR FAILURE LIMITS

Operators are not allowed to repair legitimacy by assertion.

Operators may:

- inspect failure state
- inspect outputs and evidence
- freeze the system
- terminate the system
- publish clarified doctrine through governed review

Operators may not:

- override failure semantics
- retry consequence as if failure never occurred
- rewrite legitimacy after the fact
- convert ambiguous state into permission
- bypass fail-closed handling locally

---

## FAILURE FINALITY

Failure outcomes must remain legible.

Once a failure, refusal, or blocked execution state is established under canonical rules:

- it must not be erased by undocumented practice
- it must not be normalized into success
- it must not be reinterpreted by convenience
- it must not be hidden behind degraded execution
- it must remain consistent with receipts, denials, and ledger-visible consequence surfaces where applicable

---

## RELATION TO RELEASE BOUNDARY

The repository declaration recorded in:

- `.verifrax/tags/v0.1.0.txt`

is a **release-boundary surface only**.

It records canonical repository state, but it does not negate failure conditions, override refusal boundaries, or activate execution legitimacy.

If a system path depends on treating release declaration as authority or as permission to ignore failure, that path is invalid.

---

## FINAL RULE

> **If legitimacy, scope, state, or consequence cannot be established explicitly under canonical published surfaces, CORPIFORM must resolve to failure, refusal, or non-activation rather than execution.**

There are no implicit failure exceptions.

---

## DECLARATION

This file defines the canonical published failure posture of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST TREAT ALL OPERATIONS AS FAILED, REFUSE EXECUTION, AND BE TREATED AS NON-LEGIBLE FOR FAIL-CLOSED CONSEQUENCE.**
