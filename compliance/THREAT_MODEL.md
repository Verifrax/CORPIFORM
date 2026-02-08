# THREAT MODEL

**SYSTEM:** CORPIFORM  
**MODEL:** ASSUME HOSTILITY / LIMIT CONSEQUENCE

---

## OBJECTIVE

The threat model defines **what CORPIFORM defends against** by design,
and what it explicitly does **not** attempt to solve.

Security is achieved by constraining capability, not by prediction.

---

## TRUST ASSUMPTIONS

CORPIFORM assumes:

- networks are hostile
- inputs are adversarial
- operators are fallible
- dependencies may be compromised
- execution environment may be observed

No implicit trust exists.

---

## IN-SCOPE THREATS

CORPIFORM is designed to defend against:

- unauthorized execution
- authority forgery
- authority replay
- scope escalation
- time window abuse
- custodian impersonation
- execution retries
- partial execution
- silent failure
- ledger tampering
- post-hoc mutation
- rollback attempts

These threats are **mechanically blocked**.

---

## OUT-OF-SCOPE THREATS

CORPIFORM does **not** attempt to defend against:

- denial-of-service
- infrastructure availability loss
- upstream dependency outage
- physical host compromise
- side-channel observation
- social engineering outside the system

These are accepted risks.

---

## ADAPTER THREATS

Adapters are treated as untrusted.

- adapter failure results in refusal
- adapter success is not retried
- adapter output is not trusted beyond success/failure

Adapters must not expand blast radius.

---

## CRYPTOGRAPHIC THREATS

- Compromised keys require immediate revocation
- Weak cryptography invalidates execution
- Signature verification failure results in refusal

Cryptographic correctness is mandatory.

---

## OPERATOR THREATS

Operators are not trusted actors.

- Operator error is assumed
- Operator malice is tolerated via restriction
- Operator cannot override execution paths

---

## FAILURE RESPONSE

On threat detection:

- execution halts
- denial is emitted
- no recovery is attempted

Containment over continuity.

---

## DECLARATION

This threat model is binding.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**
