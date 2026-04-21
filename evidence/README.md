# CORPIFORM Evidence Index

This directory is the public evidence surface for CORPIFORM.

It exists so that any reviewer, claimant, challenger, auditor, or adversarial reader can identify the canonical control surfaces of CORPIFORM, inspect the execution boundary it claims to enforce, and locate the artifacts that matter for authority intake, refusal logic, receipt production, revocation handling, and ledgered execution.

This index is not a substitute for the repository itself. It is the canonical navigation root for the parts of the repository that define whether CORPIFORM is a real execution component rather than only a conceptual layout.

---

## Current boundary

CORPIFORM is currently structured as a deterministic execution-control system with explicit boundaries for:

1. authority intake
2. execution gating
3. refusal emission
4. receipt emission
5. revocation application
6. ledger recording
7. adversarial fixture coverage
8. verification-facing integrations

That means the current public boundary is not yet a historical evidence bundle chain like VERIFRAX, and it is not an authority issuer like AUCTORISEAL.

It is an execution component whose legitimacy depends on whether the repository makes all critical control surfaces inspectable from one public root.

This index establishes that navigation root.

---

## How to read this repository as evidence

Read this tree in the following order.

### 1. System boundary and governing contract

Start here if you need to understand what CORPIFORM claims to be, what it is allowed to do, and where its hard limits are.

Primary files:

- `README.md`
- `STATUS.md`
- `SCOPE.md`
- `CONTRACT.md`
- `AUTHORITY.md`
- `FAILURE.md`
- `DEATH.md`
- `GOVERNANCE.md`
- `SECURITY.md`

Use these when checking:

- whether CORPIFORM claims bounded or unbounded execution power
- whether execution authority is separated from raw instruction following
- whether failure, refusal, and shutdown are defined as first-class outcomes
- whether governance and security are explicit rather than implied

### 2. Canonical body surfaces

Read the body surfaces next if you want to inspect what kinds of actions CORPIFORM recognizes and how those actions are partitioned.

Primary directory:

- `bodies/`

Current body families:

- `bodies/deploy/`
- `bodies/mail/`
- `bodies/payment/`
- `bodies/publish/`

Use these when checking:

- whether allowed execution classes are explicit
- whether each body has policy and refusal boundaries
- whether adapters are separated from body intent
- whether promotion, transfer, send, release, rollback, reverse, retract, and refusal are modeled as distinct control paths

### 3. Execution control surface

Read the execution layer if you want to inspect how the system decides whether an action may happen once, must refuse, or must die cleanly.

Primary directory:

- `execution/`

Key files:

- `execution/README.md`
- `execution/execute_once.sh`
- `execution/gate.sh`
- `execution/validate_authority.sh`
- `execution/refuse_without_seal.sh`
- `execution/refuse_on_ambiguity.sh`
- `execution/refuse_on_retry.sh`
- `execution/emit_receipt.sh`
- `execution/emit_denial.sh`

State-control files:

- `execution/state_lock/README.md`
- `execution/state_lock/acquire_lock.sh`
- `execution/state_lock/release_lock.sh`
- `execution/state_lock/lockfile.format`

Use these when checking:

- whether CORPIFORM has a real single-execution boundary
- whether ambiguity leads to refusal instead of silent interpretation
- whether retry protection is explicit
- whether state locking exists as a first-class execution constraint

### 4. Seal and authority verification boundary

Read these surfaces if you want to inspect whether execution depends on externally validated authority rather than self-assertion.

Primary directories:

- `seals/`
- `interfaces/`
- `id/`
- `integrations/auctoriseal/`

Key files:

- `seals/require_auctoriseal.sh`
- `seals/verify_seal.sh`
- `seals/verify_scope.sh`
- `seals/verify_time_window.sh`
- `seals/verify_custody.sh`
- `seals/verify_revocation.sh`
- `seals/reject_invalid.sh`
- `interfaces/authority.input.schema.json`
- `interfaces/revocation.input.schema.json`
- `id/TRUSTED_ROOTS/auctoriseal_roots.json`
- `id/SYSTEM_IDENTITY.md`
- `integrations/auctoriseal/fetch_seal.sh`
- `integrations/auctoriseal/request_authority.sh`

Use these when checking:

- whether CORPIFORM accepts only externally grounded authority
- whether scope and time window are independently enforced
- whether trust roots are explicit
- whether authority intake is schema-bounded rather than free-form

### 5. Output artifacts

Read these surfaces if you want to inspect what CORPIFORM produces when it acts or refuses.

Primary directories:

- `receipts/`
- `denials/`

Key files:

- `receipts/README.md`
- `receipts/format.json`
- `receipts/emit.sh`
- `receipts/sign.sh`
- `receipts/verify.sh`
- `denials/README.md`
- `denials/format.json`
- `denials/emit.sh`
- `denials/sign.sh`
- `denials/verify.sh`

Use these when checking:

- whether successful execution emits a structured receipt
- whether refusal emits a structured denial
- whether both outputs are signable and verifiable
- whether refusal is treated as a governed artifact rather than an ad hoc error

### 6. Ledger and revocation surface

Read these directories if you want to inspect how CORPIFORM records execution history and applies revocation consequences.

Primary directories:

- `ledger/`
- `revocation/`

Key files:

- `ledger/INDEX.json`
- `ledger/README.md`
- `ledger/checkpoints/README.md`
- `ledger/receipts/README.md`
- `ledger/denials/README.md`
- `ledger/revocations/README.md`
- `revocation/README.md`
- `revocation/format.json`
- `revocation/apply.sh`
- `revocation/verify.sh`

Use these when checking:

- whether outputs are expected to become ledger-visible artifacts
- whether revocation is operational rather than merely documentary
- whether checkpoints and record classes are explicitly partitioned

### 7. Adversarial fixtures and test boundary

Read these if you want to inspect whether the repository models hostile or failure cases directly.

Primary directories:

- `fixtures/`
- `tests/`

Fixture classes currently present:

- `fixtures/valid_authority/`
- `fixtures/invalid_authority/`
- `fixtures/expired_authority/`
- `fixtures/replay_attempt/`
- `fixtures/revoked_authority/`
- `fixtures/scope_violation/`
- `fixtures/time_violation/`
- `fixtures/keys/`

Test files currently present:

- `tests/must_emit_receipt.test`
- `tests/must_emit_denial.test`
- `tests/must_execute_once.test`
- `tests/must_not_retry.test`
- `tests/must_enforce_scope.test`
- `tests/must_enforce_time_window.test`
- `tests/must_honor_revocation.test`
- `tests/must_refuse_on_ambiguity.test`
- `tests/must_refuse_without_authority.test`
- `tests/must_record_ledger.test`
- `tests/must_die_cleanly.test`

Use these when checking:

- whether refusal and failure states are exercised deliberately
- whether replay, revocation, malformed authority, and scope escape are modeled
- whether the repository tests the control claims it makes

### 8. Runtime and operational boundary

Read these surfaces if you want to inspect how CORPIFORM expects to run in deployment environments.

Primary directories:

- `runtime/`
- `tools/`
- `observability/`

Key files:

- `runtime/README.md`
- `runtime/runner/run.sh`
- `runtime/runner/verify_environment.sh`
- `runtime/container/Dockerfile`
- `runtime/container/entrypoint.sh`
- `runtime/env/env.example`
- `runtime/env/secrets.policy.md`
- `tools/doctor.sh`
- `tools/inspect.sh`
- `tools/freeze.sh`
- `tools/kill.sh`
- `tools/rotate_keys.sh`
- `observability/README.md`

Use these when checking:

- whether runtime assumptions are explicit
- whether environment verification exists
- whether operational freeze, inspection, termination, and key rotation are modeled
- whether observability is part of the execution boundary

### 9. Verification-facing ecosystem links

Read these if you want to inspect how CORPIFORM connects outward to the wider stack.

Primary directories:

- `integrations/verifrax/`
- `integrations/cicullis/`

Key files:

- `integrations/verifrax/README.md`
- `integrations/verifrax/verify_receipt.sh`
- `integrations/verifrax/verify_denial.sh`
- `integrations/cicullis/README.md`
- `integrations/cicullis/ci_profile.yml`

Use these when checking:

- whether CORPIFORM outputs are intended to be verification-addressable
- whether CI and verifier alignment are explicit
- whether the repository is isolated or stack-aware

---

## Evidence map

### Governing boundary

Purpose:

- defines what CORPIFORM is, what it may do, and when it must refuse or terminate

Key files:

- `README.md`
- `STATUS.md`
- `SCOPE.md`
- `CONTRACT.md`
- `AUTHORITY.md`
- `FAILURE.md`
- `DEATH.md`
- `GOVERNANCE.md`
- `SECURITY.md`

### Body registry

Purpose:

- defines the recognized action families and their internal refusal and execution partitions

Key directory:

- `bodies/`

### Execution control

Purpose:

- defines deterministic execution gating, single-run behavior, and refusal on unsafe conditions

Key directory:

- `execution/`

### Authority and seal intake

Purpose:

- defines how external authority is required, verified, scoped, and time-bounded

Key directories:

- `seals/`
- `interfaces/`
- `id/`
- `integrations/auctoriseal/`

### Outputs

Purpose:

- defines canonical success and refusal artifacts

Key directories:

- `receipts/`
- `denials/`

### Ledger and revocation

Purpose:

- defines how outputs and reversals become recorded operational surfaces

Key directories:

- `ledger/`
- `revocation/`

### Adversarial fixtures

Purpose:

- makes hostile, invalid, expired, replayed, revoked, and out-of-scope cases inspectable

Key directory:

- `fixtures/`

### Test surface

Purpose:

- states the behavior the system claims it can enforce

Key directory:

- `tests/`

### Runtime and observability

Purpose:

- defines execution environment expectations, operational controls, and inspectability

Key directories:

- `runtime/`
- `tools/`
- `observability/`

---

## Adversarial reading rule

This repository is not alive merely because it has many files.

It becomes legible only when a hostile reader can answer all of the following without guessing:

- what CORPIFORM is allowed to execute
- what authority material it requires before acting
- what it must refuse
- what artifact it emits on success
- what artifact it emits on refusal
- where execution history is supposed to be recorded
- how revocation affects later execution
- how replay and ambiguity are blocked
- how an external verifier would inspect outputs
- where the hard system boundary is documented

If the repository cannot answer those questions from public surfaces, it is still structurally incomplete no matter how many files it contains.

This index exists to remove that ambiguity.

---

## Canonical evidence surfaces

The current canonical public evidence surfaces are:

- repository doctrine and control boundary under the repository root
- execution control surface under `execution/`
- authority and seal verification surface under `seals/`, `interfaces/`, `id/`, and `integrations/auctoriseal/`
- output artifact surface under `receipts/` and `denials/`
- ledger and revocation surface under `ledger/` and `revocation/`
- adversarial fixture and test surface under `fixtures/` and `tests/`
- runtime and observability surface under `runtime/`, `tools/`, and `observability/`
- release boundary surface under `.verifrax/tags/v0.1.7.txt`

## Entry points

If you are entering this repository for the first time, start here:

- system boundary: `README.md`
- execution status and declared posture: `STATUS.md`
- contract boundary: `CONTRACT.md`
- authority requirement: `AUTHORITY.md`
- execution control: `execution/README.md`
- body registry: `bodies/README.md`
- ledger surface: `ledger/README.md`
- fixture boundary: `fixtures/README.md`
- verification-facing integrations: `integrations/verifrax/README.md`

---

## Release boundary

CORPIFORM records its declared repository release boundary in:

- `.verifrax/tags/v0.1.7.txt`

This surface binds the declared version to:
- repository identity
- canonical repository head
- recorded timestamp
- non-final pre-seal state
- explicit compatibility boundary

It is a release declaration surface only.
It is not an authority seal and does not change execution semantics.

## Scope boundary

This index covers the canonical public control surface currently published under the CORPIFORM repository root.

It does not claim that full execution evidence bundles already exist.

It claims that the repository now has one public navigation root for:

- legitimacy intake
- deterministic execution control
- refusal logic
- output artifacts
- ledger and revocation recording
- adversarial fixtures
- verification-facing integrations

That is the minimum condition for CORPIFORM to become a legible execution component in the VERIFRAX stack.

## Release declaration surface

The active repository release declaration is:

- `.verifrax/tags/v0.1.7.txt`

This declaration currently records:

- version `v0.1.7`
- repository identity `CORPIFORM`
- recorded repository head
- recorded timestamp
- non-final pre-seal posture
- explicit non-compatibility boundary

It is a release declaration only. It is not an authority seal and does not authorize execution by itself.

