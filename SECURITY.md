# SECURITY

**SYSTEM:** CORPIFORM  
**SECURITY MODEL:** MINIMAL SURFACE / FAIL-CLOSED / HOSTILE ASSUMPTIONS

---

## SECURITY PHILOSOPHY

CORPIFORM assumes a hostile environment.

Security is enforced through:
- minimal capabilities
- explicit authority
- irreversible failure
- strict refusal

CORPIFORM does not attempt to be resilient.  
It attempts to be **unabusable**.

---

## THREAT ASSUMPTIONS

CORPIFORM assumes:

- external systems may be compromised
- operators may make mistakes
- credentials may leak
- networks may be hostile
- inputs may be malicious

Trust is never implicit.

---

## TRUST BOUNDARY

CORPIFORM trusts **only**:

- its own verified code
- cryptographically valid AUCTORISEAL seals
- explicitly declared trusted roots

Everything else is untrusted.

---

## ATTACK SURFACE

The only permitted attack surfaces are:

- authority seal input
- execution command input
- declared external adapters

All other surfaces are forbidden.

---

## AUTHORITY ATTACKS

The following are treated as critical violations:

- forged authority seals
- replayed seals
- scope escalation attempts
- time window manipulation
- custodian impersonation

Any detection results in immediate refusal.

---

## EXECUTION ATTACKS

The following are forbidden:

- command mutation
- partial execution
- retry loops
- race condition exploitation
- adapter substitution
- environment tampering

Violations trigger failure and denial emission.

---

## OPERATOR SECURITY

Operators are untrusted by default.

Operators may:
- inspect state
- freeze the system
- terminate the system

Operators may NOT:
- authorize execution
- override refusals
- retry executions
- modify authority inputs

---

## KEY MANAGEMENT

- No long-lived execution secrets are stored in-repo
- Trusted roots are explicitly declared
- Key rotation is supported via `tools/rotate_keys.sh`
- Compromised keys require immediate freeze or death

---

## INCIDENT RESPONSE

On suspected compromise:

1. Freeze CORPIFORM immediately
2. Preserve ledger and receipts
3. Revoke affected authority via AUCTORISEAL
4. Assess scope and blast radius
5. Execute death protocol if integrity is lost

---

## DISCLOSURE POLICY

Security vulnerabilities must be reported privately.

No public disclosure before mitigation.

---

## DECLARATION

This security model is binding.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION AND BE CONSIDERED COMPROMISED.**

---
