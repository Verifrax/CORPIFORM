# CORPIFORM

**CORPIFORM is a deterministic execution body.**

It does not decide.  
It does not reason.  
It does not optimize.  

It executes **exactly once** under **explicit authority**,  
or it refuses.

---

## WHAT CORPIFORM IS

CORPIFORM is a **mechanical executor** designed for environments where:

- authority must be explicit
- execution must be replay-proof
- responsibility must be traceable
- damage must be impossible before validation
- history must be immutable

It is built to make **indecision, ambiguity, and informal power impossible**.

---

## WHAT CORPIFORM IS NOT

CORPIFORM is **not**:

- an agent
- an AI
- a workflow engine
- a scheduler
- a policy engine
- a decision-maker
- a retry system
- a self-healing system

If something requires judgment, it belongs **outside** CORPIFORM.

---

## CORE INVARIANTS

CORPIFORM enforces the following invariants mechanically:

- **Authority-first** — nothing executes without a valid seal
- **Execute-once** — no retries, no replays
- **Exact scope** — no expansion, no inference
- **Hard time windows** — time is non-negotiable
- **Custody binding** — responsibility is explicit
- **Fail-closed** — ambiguity equals refusal
- **Irreversibility** — actions cannot be undone
- **Immutable ledger** — history cannot be rewritten

Violating any invariant halts execution.

---

## EXECUTION FLOW (HIGH LEVEL)

1. Authority seal is presented (AUCTORISEAL)
2. Issuer trust is verified
3. Scope is matched exactly
4. Time window is validated
5. Custody is verified
6. Execute-once lock is acquired
7. Body executes exactly once
8. Receipt or denial is emitted
9. Ledger records immutable fact

There are no alternative paths.

---

## BODIES

CORPIFORM executes **only what it physically contains**.

Each BODY represents one irreversible consequence domain:

- `mail` — email communication
- `payment` — value transfer
- `publish` — artifact disclosure
- `deploy` — infrastructure promotion

If a BODY does not exist, the action is impossible.

---

## AUTHORITY MODEL

CORPIFORM **never issues authority**.

Authority comes exclusively from **AUCTORISEAL** and is:

- explicit
- signed
- time-bound
- scoped
- revocable
- single-use

CORPIFORM only verifies and enforces.

---

## EVIDENCE & VERIFICATION

All outcomes are recorded as immutable artifacts:

- **receipts** — proof of execution
- **denials** — proof of refusal
- **revocations** — proof of authority invalidation

Third-party verification is performed externally via **VERIFRAX**.

---

## FAILURE PHILOSOPHY

CORPIFORM does not recover.

On violation:
- execution stops
- denial is emitted
- the system may be frozen or killed

Safety is prioritized over availability.

---

## RESPONSIBILITY BOUNDARY

- **Why** something was authorized → AUCTORISEAL
- **Whether** it executed → CORPIFORM
- **What happened** → Ledger
- **Verification** → VERIFRAX

Responsibility is never ambiguous.

---

## STATUS

CORPIFORM can be in only one state:

- `ALIVE` — execution allowed
- `FROZEN` — permanently halted
- `DEAD` — terminated forever

There is no resume.

---

## PHILOSOPHY

> Determinism over intelligence.  
> Enforcement over explanation.  
> Evidence over narrative.  
> Irreversibility over optimism.

---

## WARNING

If you are looking for:
- flexibility
- retries
- adaptive behavior
- convenience
- AI reasoning

You are in the wrong place.

---

## DECLARATION

CORPIFORM exists to make **unauthorized, ambiguous, or deniable action impossible**.

If this repository is altered, incomplete, or inconsistent,  
**CORPIFORM MUST NOT BE USED.**
