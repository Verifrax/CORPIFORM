# CORPIFORM

Deterministic execution-control component for authority-gated institutional actions in the VERIFRAX stack.

CORPIFORM is not an authority issuer and not a verification protocol.
It is the execution boundary that decides whether a permitted action may occur, must refuse, or must terminate cleanly under governed conditions.

---

## Current posture

- **Version:** `v0.1.3`
- **State:** `NON-FINAL`
- **Release type:** `PRE-SEAL`
- **Authority:** `NOT SEALED`
- **Compatibility:** `NONE GUARANTEED`
- **Repository release boundary:** `.verifrax/tags/v0.1.3.txt`

That means CORPIFORM is structurally legible and publicly inspectable, but it must still be treated as non-final until sealed authority activates it.

---

## What CORPIFORM is

CORPIFORM is a controlled execution component with explicit surfaces for:

- authority intake
- execution gating
- single-execution enforcement
- refusal emission
- receipt emission
- revocation handling
- ledger-visible consequence recording
- body-scoped operational actions

It exists to ensure that execution consequence is bounded by explicit authority and explicit refusal semantics rather than ad hoc operator discretion.

---

## What CORPIFORM is not

CORPIFORM is not:

- a general-purpose agent
- an open-ended orchestration engine
- an authority source
- a substitute for AUCTORISEAL
- a substitute for VERIFRAX
- a guarantee of active execution in its current non-final state

If authority is missing, invalid, revoked, ambiguous, expired, or out of scope, CORPIFORM must refuse.

---

## Canonical repository surfaces

Start with these files and directories.

### Governing boundary

- `STATUS.md`
- `SCOPE.md`
- `CONTRACT.md`
- `AUTHORITY.md`
- `FAILURE.md`
- `DEATH.md`
- `GOVERNANCE.md`
- `SECURITY.md`
- `VERSION.md`

### Execution boundary

- `execution/`
- `bodies/`
- `seals/`
- `revocation/`
- `receipts/`
- `denials/`
- `ledger/`

### Verification and integration boundary

- `interfaces/`
- `integrations/auctoriseal/`
- `integrations/verifrax/`
- `id/TRUSTED_ROOTS/auctoriseal_roots.json`

### Adversarial and runtime boundary

- `fixtures/`
- `tests/`
- `runtime/`
- `tools/`
- `observability/`

### Evidence boundary

- `evidence/README.md`
- `.verifrax/tags/v0.1.3.txt`

---

## Execution model

CORPIFORM separates action classes into explicit bodies:

- `deploy`
- `mail`
- `payment`
- `publish`

Execution is intended to occur only when:

1. valid external authority is presented
2. the requested action is inside the allowed body and scope
3. time-window and custody checks pass
4. replay protections pass
5. revocation state does not block execution

Otherwise the system must emit a governed refusal artifact instead of performing consequence.

---

## Authority dependency

CORPIFORM depends on externally grounded authority material.

Published trust roots are recorded in:

- `id/TRUSTED_ROOTS/auctoriseal_roots.json`

Authority acquisition and integration surfaces are recorded in:

- `integrations/auctoriseal/`

State transitions and active authority posture are governed by AUCTORISEAL, not by local operator preference.

---

## Outputs

CORPIFORM produces two primary governed result classes:

- **receipts** for permitted execution
- **denials** for refused execution

Those outputs are expected to be signable, verifiable, and ledger-visible.

---

## Evidence and release boundary

The canonical evidence navigation root is:

- `evidence/README.md`

The explicit repository release declaration for the current version is:

- `.verifrax/tags/v0.1.3.txt`

That release boundary records:

- canonical repository head
- recorded timestamp
- non-final pre-seal posture
- explicit compatibility boundary

It is a release declaration only.
It is not an authority seal and does not activate execution.

---

## Security

Do not report sensitive vulnerabilities publicly.

Use the security reporting path defined in:

- `SECURITY.md`

---

## License

Apache 2.0. See `LICENSE`.
