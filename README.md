# CORPIFORM

![Version](https://img.shields.io/badge/version-v0.1.3-blue)
![State](https://img.shields.io/badge/state-NON--FINAL-orange)
![Release](https://img.shields.io/badge/release-PRE--SEAL-lightgrey)
![Authority](https://img.shields.io/badge/authority-NOT--SEALED-red)
![License](https://img.shields.io/badge/license-Apache%202.0-green)
![Determinism](https://img.shields.io/badge/determinism-required-black)
![Execution](https://img.shields.io/badge/execution-governed-purple)

---

## CORPIFORM

Deterministic execution-control component for authority-gated institutional actions in the VERIFRAX stack.

CORPIFORM is not an authority issuer and not a verification protocol.
It is the execution boundary that decides whether a permitted action may occur, must refuse, or must terminate cleanly under governed conditions.

---

## Current posture

* **Version:** `v0.1.3`
* **State:** `NON-FINAL`
* **Release type:** `PRE-SEAL`
* **Authority:** `NOT SEALED`
* **Compatibility:** `NONE GUARANTEED`
* **Repository release boundary:** `.verifrax/tags/v0.1.3.txt`

This state means:

* the system is structurally complete enough for inspection
* execution semantics are defined and testable
* authority activation has not yet occurred
* no external dependency should assume stability or compatibility

---

## System role

CORPIFORM is the execution layer in a three-part stack:

* **AUCTORISEAL** → authority issuance
* **CORPIFORM** → execution enforcement
* **VERIFRAX** → verification and evidence

CORPIFORM exists to convert *valid authority* into *bounded consequence*.

---

## What CORPIFORM is

CORPIFORM is a controlled execution component with explicit surfaces for:

* authority intake and validation
* execution gating
* single-execution enforcement (replay resistance)
* refusal emission
* receipt emission
* revocation handling
* ledger-visible consequence recording
* body-scoped operational actions

It enforces that execution occurs only under:

* valid authority
* valid scope
* valid time window
* valid custody
* non-revoked state
* non-replayed execution

---

## What CORPIFORM is not

CORPIFORM is not:

* a general-purpose agent
* an orchestration engine
* an authority source
* a verification protocol
* a policy authoring system

It does not decide *what should happen*.
It decides only *whether something is allowed to happen*.

---

## Canonical repository surfaces

### Governing boundary

* `STATUS.md`
* `SCOPE.md`
* `CONTRACT.md`
* `AUTHORITY.md`
* `FAILURE.md`
* `DEATH.md`
* `GOVERNANCE.md`
* `SECURITY.md`
* `VERSION.md`

These files define invariant constraints and failure semantics.

---

### Execution boundary

* `execution/`
* `bodies/`
* `seals/`
* `revocation/`
* `receipts/`
* `denials/`
* `ledger/`

These surfaces implement the execution decision and output emission.

---

### Verification and integration boundary

* `interfaces/`
* `integrations/auctoriseal/`
* `integrations/verifrax/`
* `id/TRUSTED_ROOTS/auctoriseal_roots.json`

These define how CORPIFORM interacts with authority sources and verification systems.

---

### Runtime and adversarial boundary

* `fixtures/`
* `tests/`
* `runtime/`
* `tools/`
* `observability/`

These surfaces expose execution behavior under normal and adversarial conditions.

---

### Evidence boundary

* `evidence/README.md`
* `.verifrax/tags/v0.1.3.txt`

These surfaces define what is publicly recorded and inspectable.

---

## Execution model

CORPIFORM separates execution into explicit **bodies**:

* `deploy`
* `mail`
* `payment`
* `publish`

Execution occurs only if all conditions pass:

1. authority is present and valid
2. scope matches requested action
3. time window is valid
4. custody is valid
5. revocation state allows execution
6. execution has not already occurred (execute-once)

If any condition fails:

→ execution MUST NOT occur
→ a denial artifact MUST be emitted

---

## Deterministic refusal semantics

CORPIFORM enforces explicit refusal instead of silent failure.

Refusal conditions include:

* missing authority
* invalid authority
* expired authority
* revoked authority
* scope mismatch
* replay attempt
* ambiguity in execution request

Each refusal produces:

* a structured denial artifact
* a signed record (when configured)
* a ledger-visible outcome

---

## Outputs

CORPIFORM produces two canonical result classes:

### Receipts

* emitted when execution is permitted
* bind:

  * `command_id`
  * `authority_seal_id`
  * execution context
  * timestamp
  * outcome

### Denials

* emitted when execution is refused
* bind:

  * refusal reason
  * evaluated authority state
  * execution context

Both outputs are designed to be:

* deterministic
* canonicalizable
* hashable
* signable
* externally verifiable

---

## Authority dependency

CORPIFORM depends on externally grounded authority.

Trust roots are defined in:

* `id/TRUSTED_ROOTS/auctoriseal_roots.json`

Authority lifecycle is controlled by AUCTORISEAL.

CORPIFORM does not mint authority and cannot override it.

---

## Replay resistance

CORPIFORM enforces execute-once semantics:

* each `command_id` may be executed at most once
* subsequent attempts MUST be refused
* prior execution MUST be detectable via receipt

This property is critical for:

* financial actions
* publication integrity
* irreversible operations

---

## Evidence and release boundary

Canonical evidence root:

* `evidence/README.md`

Release declaration:

* `.verifrax/tags/v0.1.3.txt`

This boundary records:

* repository state
* release timestamp
* non-final posture

It does not:

* activate authority
* guarantee execution
* imply production readiness

---

## Security

Security issues must not be disclosed publicly.

Follow:

* `SECURITY.md`

---

## License

Apache License 2.0

See `LICENSE`.

---

## Design constraint

CORPIFORM must always satisfy:

> No authority → no execution

and

> No ambiguity → no execution

This constraint dominates all implementation details.
