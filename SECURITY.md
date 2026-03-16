# SECURITY

**SYSTEM:** CORPIFORM  
**SECURITY MODEL:** FAIL-CLOSED / AUTHORITY-GATED / HOSTILE ASSUMPTIONS

---

## CURRENT SECURITY POSTURE

CORPIFORM is currently published as a **non-final, pre-seal execution-control component**.

Current declared posture:

- **Version:** `v0.1.0`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.0.txt`

This means the repository is publicly inspectable and structurally legible, but it must not be treated as an active trusted execution system merely because it is published.

Until valid AUCTORISEAL authority activates execution, CORPIFORM security posture is primarily a **refusal posture**.

---

## SECURITY PHILOSOPHY

CORPIFORM assumes a hostile environment.

Security is enforced through:

- minimal execution surface
- explicit external authority
- deterministic refusal
- explicit state boundaries
- fail-closed verification gates

CORPIFORM does not attempt to be permissive.
CORPIFORM attempts to be **difficult to abuse**.

---

## THREAT ASSUMPTIONS

CORPIFORM assumes:

- external systems may be compromised
- operators may make mistakes
- credentials may leak
- networks may be hostile
- inputs may be malicious
- repository publication may be misread as operational legitimacy

Trust is never implicit.

---

## TRUST BOUNDARY

CORPIFORM trusts only explicitly bounded surfaces:

- its published repository control surfaces
- declared trusted roots under `id/TRUSTED_ROOTS/`
- cryptographically valid authority material accepted under those trust rules
- deterministic execution gates and refusal paths

Everything else is untrusted.

Repository publication alone is not trusted execution authority.

---

## CURRENT ACTIVE SECURITY CONSEQUENCE

Because CORPIFORM is currently **NON-FINAL / INACTIVE**:

- no local operator may treat the repository as self-authorizing
- no unsigned or self-asserted authority may activate execution
- no body may act outside valid external authority
- ambiguous or invalid authority material must produce refusal
- release-boundary metadata must not be confused with authority material

---

## ATTACK SURFACE

The only intended attack surfaces are:

- authority input
- revocation input
- execution command input
- declared external adapters
- runtime environment boundary

All other execution-expanding surfaces are forbidden.

---

## AUTHORITY ATTACKS

The following are critical violations:

- forged authority material
- replayed authority
- scope escalation attempts
- time-window manipulation
- trust-root substitution
- custodian impersonation
- confusion between release declaration and authority activation

Detection must result in refusal or non-activation.

---

## EXECUTION ATTACKS

The following are forbidden:

- command mutation
- partial execution
- retry loops
- race-condition exploitation
- adapter substitution
- environment tampering
- bypass of refusal gates
- bypass of revocation effect
- local activation without valid external authority

Violations must trigger failure, denial, freeze, or non-execution depending on boundary crossed.

---

## OPERATOR SECURITY

Operators are not authority sources.

Operators may:

- inspect state
- review outputs
- freeze the system
- terminate the system

Operators may not:

- self-authorize execution
- override refusal semantics
- bypass authority checks
- mutate trusted-root meaning at runtime
- treat repository publication as active legitimacy

---

## TRUSTED ROOT SECURITY

Trusted roots must remain explicit and inspectable.

Canonical trust-root surface:

- `id/TRUSTED_ROOTS/auctoriseal_roots.json`

That surface must align with published AUCTORISEAL authority roots.
Missing, altered, ambiguous, or drifted trust-root data must be treated as a fail-closed condition.

---

## KEY AND SECRET BOUNDARY

- no long-lived execution secret should be relied upon as a substitute for authority legitimacy
- trusted roots are explicitly declared
- key rotation support is a controlled maintenance surface, not an authorization shortcut
- compromised authority material requires freeze, refusal, revocation, or death depending on severity

---

## INCIDENT RESPONSE

On suspected compromise or legitimacy drift:

1. refuse further execution
2. freeze the system if execution state may be unsafe
3. preserve receipts, denials, and ledger-visible artifacts
4. verify trust-root and authority integrity
5. revoke affected authority through AUCTORISEAL where applicable
6. execute death boundary if system integrity cannot be restored safely

---

## DISCLOSURE POLICY

Do not report sensitive vulnerabilities publicly.

Use the reporting path defined in:

- `SECURITY.md`

Repository issues and public discussion must not be used for active exploit disclosure before mitigation.

---

## RELEASE BOUNDARY RELATION

The repository declaration recorded in:

- `.verifrax/tags/v0.1.0.txt`

is a **release-boundary surface only**.

It records canonical repository state, but it is **not** an authority seal, **not** a trust-root substitute, and does **not** activate execution.

---

## DECLARATION

This file defines the canonical published security posture of CORPIFORM.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION AND BE TREATED AS COMPROMISED OR NON-LEGIBLE.**
