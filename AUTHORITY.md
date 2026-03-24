# AUTHORITY

**SYSTEM:** CORPIFORM  
**AUTHORITY MODEL:** EXTERNAL / EXPLICIT / FAIL-CLOSED

---

## CURRENT AUTHORITY POSTURE

CORPIFORM is currently published as a **non-final, pre-seal execution-control component**.

Current declared posture:

- **Version:** `v0.1.4`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.4.txt`

That means CORPIFORM may publish its authority model and intake rules, but it does **not** currently possess active execution legitimacy merely because the repository exists or is public.

Until valid AUCTORISEAL authority activates execution, CORPIFORM authority posture is a refusal-first posture.

---

## AUTHORITY SOURCE

All execution authority recognized by CORPIFORM must originate externally from **AUCTORISEAL**.

CORPIFORM does not create authority.
CORPIFORM does not infer authority.
CORPIFORM does not elevate repository publication into authority.
CORPIFORM does not accept operator preference as authority.

If authority does not resolve to explicit AUCTORISEAL-grounded legitimacy, execution must not occur.

---

## AUTHORITY REQUIREMENTS

For any execution to be permitted, authority material must be all of the following:

- externally issued through AUCTORISEAL legitimacy surfaces
- structurally well-formed
- cryptographically verifiable under published trust rules
- within valid time constraints
- within valid scope constraints
- compatible with the requested execution body
- not revoked
- not replayed
- not ambiguous in issuer, subject, custody, or effect

Failure of any one requirement requires refusal or non-activation.

---

## AUTHORITY INTAKE SURFACES

Canonical intake and verification-related authority surfaces include:

- `id/TRUSTED_ROOTS/auctoriseal_roots.json`
- `seals/verify_seal.sh`
- `seals/verify_scope.sh`
- `seals/verify_time_window.sh`
- `seals/verify_custody.sh`
- `revocation/verify.sh`
- `integrations/auctoriseal/`
- `interfaces/authority.input.schema.json`
- `interfaces/revocation.input.schema.json`

These surfaces define how CORPIFORM recognizes authority-related legitimacy boundaries.
If they are missing, drifted, altered ambiguously, or inconsistent with published doctrine, CORPIFORM must fail closed.

---

## CURRENT ASSERTION

At the currently published repository state:

- CORPIFORM is **NOT SEALED**
- CORPIFORM is **NON-FINAL**
- CORPIFORM is **INACTIVE**
- repository publication is not authority activation
- release-boundary metadata is not authority material

Therefore no execution legitimacy may be claimed from repository visibility alone.

---

## AUTHORITY NON-DELEGATION INSIDE CORPIFORM

CORPIFORM does not originate downstream authority of its own.

That means:

- authority may not be invented locally
- authority may not be broadened by undocumented convention
- authority may not be substituted by operator intent
- authority may not be silently escalated by body selection
- authority may not be converted from release metadata into execution legitimacy

CORPIFORM may consume explicit authority.
CORPIFORM may enforce authority constraints.
CORPIFORM may not become an authority root.

---

## AUTHORITY VALIDATION

Authority validation must occur before:

1. execution attempt
2. consequential state change
3. external side effect
4. acceptance of execution legitimacy

Validation must resolve toward non-execution when authority is:

- missing
- malformed
- unverifiable
- revoked
- expired
- out of scope
- mismatched to custody
- inconsistent with trust roots
- ambiguous in meaning

No permissive fallback is allowed.

---

## REVOCATION RELATION

Authority revocation is external to CORPIFORM origination but internal to CORPIFORM enforcement.

That means:

- valid revocation must be honored
- revoked authority must not be reused
- revocation blocks future execution legitimacy
- historical facts may remain recorded, but revoked authority may not justify new execution

If revocation status is ambiguous, CORPIFORM must fail closed.

---

## FAILURE MODES

The following conditions require immediate refusal, non-activation, freeze, or equivalent fail-closed outcome depending on context:

- missing authority
- malformed authority
- invalid signature
- unknown issuer
- trust-root mismatch
- custody mismatch
- scope mismatch
- body mismatch
- expired authority
- revoked authority
- replayed authority
- ambiguous authority provenance
- confusion between release declaration and authority legitimacy

There is no legitimacy-preserving fallback.

---

## OPERATOR LIMITATION

Human operators are not authority sources.

Operators may:

- inspect repository state
- inspect outputs and evidence
- run checks and tests
- freeze or terminate where doctrine permits

Operators may not:

- self-authorize execution
- override authority validation
- reinterpret release declaration as seal authority
- approve execution outside explicit authority legitimacy
- convert undocumented local behavior into canonical authority

---

## RELEASE BOUNDARY RELATION

The repository declaration recorded in:

- `.verifrax/tags/v0.1.4.txt`

is a **release-boundary surface only**.

It records canonical repository state, but it is **not** an authority seal, **not** a trust-root substitute, and does **not** activate execution.

Authority legitimacy must be established separately through explicit AUCTORISEAL-grounded surfaces.

---

## FINAL RULE

> **If authority is not explicit, externally grounded, and valid under published trust surfaces, it must not be treated as real.**

There are no implicit authority exceptions.

---

## DECLARATION

This file defines the canonical published authority posture of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION AND BE TREATED AS NON-LEGIBLE FOR AUTHORITY-GOVERNED ACTION.**
