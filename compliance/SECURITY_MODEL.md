# SECURITY MODEL

**SYSTEM:** CORPIFORM  
**MODEL:** FAIL-CLOSED / ZERO-TRUST / NON-RECOVERING

---

## CORE ASSUMPTION

CORPIFORM assumes compromise is always possible.

Security is not achieved by resilience or recovery,  
but by **limiting what can ever happen**.

---

## TRUST MODEL

CORPIFORM trusts **only**:

- its own verified source code
- its declared build hash
- its immutable identity
- authority seals issued by trusted roots

Everything else is untrusted by default.

---

## AUTHORITY SECURITY

- Authority is external
- Authority is explicit
- Authority is single-use
- Authority is revocable

CORPIFORM never infers, caches, or escalates authority.

---

## EXECUTION SECURITY

- Single execution per command
- No retries
- No branching
- No fallback paths
- No partial success

Execution is either complete or refused.

---

## ISOLATION

- Bodies are isolated
- Adapters are isolated
- Secrets are isolated
- Runtime is isolated

No shared mutable state exists.

---

## OPERATOR MODEL

Operators are untrusted.

Operators may:
- inspect
- freeze
- terminate

Operators may NOT:
- authorize
- override
- retry
- mutate execution paths

---

## ATTACK RESPONSE

On any detected violation:

- execution stops
- denial is emitted
- no recovery is attempted

Repeated or critical violations require freeze or death.

---

## NON-GOALS

CORPIFORM does not aim to:

- self-heal
- self-correct
- optimize availability
- maximize throughput

Correctness under authority is the only goal.

---

## DECLARATION

This security model is binding.

If this file is missing, altered, or ambiguous,  
**CORPIFORM MUST REFUSE ALL EXECUTION.**
