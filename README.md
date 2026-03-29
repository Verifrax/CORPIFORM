# CORPIFORM

![License](https://img.shields.io/badge/license-Apache--2.0-blue)
![Role](https://img.shields.io/badge/role-runtime%20receipt%20surface-111111)
![npm](https://img.shields.io/npm/v/@verifrax/corpiform)
![CI](https://github.com/Verifrax/CORPIFORM/actions/workflows/ci.yml/badge.svg?branch=main)
![Identity](https://github.com/Verifrax/CORPIFORM/actions/workflows/identity.yml/badge.svg?branch=main)
![Determinism](https://github.com/Verifrax/CORPIFORM/actions/workflows/determinism-check.yml/badge.svg?branch=main)
![Deploy](https://github.com/Verifrax/CORPIFORM/actions/workflows/pages.yml/badge.svg?branch=main)
![Host](https://img.shields.io/badge/host-corpiform.verifrax.net-1f6feb)

Authority-governed execution and receipt surface for the governed Verifrax system.

Current release identity:

* Version: **v0.1.4**
* State: **PRE-FINAL EXECUTION SURFACE**
* Release type: **PUBLIC PRE-SEAL**
* Authority model: **EXTERNAL (AUCTORISEAL-GOVERNED)**
* Determinism: **REQUIRED**
* Replay: **FORBIDDEN (ENFORCED BY RECEIPT)**
* Compatibility: **GUARANTEED WITHIN RECORDED EXECUTION BOUNDARY (artifact-0004)**

## Status

* Layer: Execution
* Repository class: governed runtime surface
* Public host ownership: `corpiform.verifrax.net`
* npm package: `@verifrax/corpiform`
* Current repository posture: public pre-seal execution surface
* License: Apache License Version 2.0

## One-sentence role

CORPIFORM consumes recorded authority, admits or refuses bounded execution, and emits deterministic receipts that VERIFRAX and public verifier surfaces can inspect without treating execution itself as truth.

## What this repository is

CORPIFORM is the execution layer of the Verifrax stack.

It exists to provide:

* authority-gated execution admission
* deterministic refusal behavior
* execute-once and replay-resistant runtime control
* receipt emission for governed execution
* explicit runtime boundary between authority, execution, and verification
* inspectable execution semantics for the recorded artifact chain

This repository is where authority becomes bounded consequence.

## What this repository is not

This repository is not:

* the authored protocol repository
* the authority issuance repository
* the derived specification publication surface
* the public proof publication surface
* the public verifier UI
* the intake surface
* the commercial landing surface
* a substitute for VERIFRAX evidence judgment
* a source of authority minting

CORPIFORM does not:

* issue authority objects
* decide normative truth on its own
* replace VERIFRAX verification
* replace public verifier inspection
* act as marketing or docs fallback

Execution here is permitted consequence, not upstream truth.

## Stack position

The governed path reads in this order:

1. `.github` — governed repository boundary and governance linkage
2. `AUCTORISEAL` — authority issuance and authority publication
3. `CORPIFORM` — governed execution and receipt emission
4. `VERIFRAX` — evidence root, artifact chain, and verification boundary
5. `VERIFRAX-verify` — public verification surface

CORPIFORM sits after authority issuance and before evidence judgment.

## Authority dependency

CORPIFORM requires externally grounded authority.

The required authority direction across the governed system is:

* VERIFRAX authors normative source material.
* VERIFRAX-SPEC publishes derived specification artifacts from VERIFRAX.
* Derived artifacts are not upstream authority.
* Governance authority is external and bound through AUCTORISEAL plus the governed repo set in `.github`.

CORPIFORM must therefore remain authority-dependent.

It may consume authority.
It may not mint authority.
It may not override authority.

## Public host ownership

This repository owns the runtime reference surface for:

* `https://corpiform.verifrax.net/`

That host must remain execution-reference only.

It must not become:

* `api.verifrax.net`
* proof publication
* verifier UI
* intake flow
* docs mirror
* commercial landing

If a second live execution host exists, this README must say so explicitly. Otherwise CORPIFORM remains runtime/reference only while `api.verifrax.net` remains the sole execution surface.

## Package surface

Package identity for this repository is:

* npm package: `@verifrax/corpiform`
* repository: `Verifrax/CORPIFORM`

Any version, tag, README status line, release note, and evidence reference must agree exactly.

This README must not imply broader compatibility than the recorded execution boundary proves.

## Execution model

CORPIFORM exists to turn a valid authority state into either:

* permitted execution with receipt emission
* explicit refusal with deterministic refusal output

Execution is allowed only when required runtime conditions hold, including at minimum:

* authority presence
* authority validity
* scope match
* admissible runtime boundary
* non-revoked state
* non-replayed execution state

If those conditions fail, execution must not occur.

A refusal is not a soft warning. It is the runtime result.

## Receipts and refusals

The load-bearing runtime outputs are:

### Receipts

Receipts bind the admitted execution to a bounded record that downstream evidence and verifier surfaces can inspect.

A receipt must remain deterministic enough to support:

* recorded artifact linkage
* digest reproduction
* cross-implementation verification where declared
* evidence registration in VERIFRAX

### Refusals

Refusals are canonical runtime outcomes when admission conditions fail.

This repository must treat refusal as first-class, not as an implementation afterthought.

## Artifact boundary

CORPIFORM is already part of the recorded chain through artifact-0004 and is load-bearing for artifact-0005.

### Artifact-0004 relationship

The currently recorded compatibility boundary is the artifact-0004 execution boundary.

That means this README may describe artifact-0004 as the recorded bounded execution boundary.

It must not describe artifact-0004 as equivalent to full public canonical seal.

### Artifact-0005 relationship

CORPIFORM is required for artifact-0005 because artifact-0005 depends on:

* execution under public canonical authority
* recorded CORPIFORM receipt output
* reproducible receipt linkage into VERIFRAX evidence
* matching downstream verification interpretation

This repository must therefore mention artifact-0005 as an active dependency boundary.

It must not describe artifact-0005 as sealed or complete unless the VERIFRAX evidence root proves that state.

## Verifier relationship

CORPIFORM produces runtime material that downstream verifier surfaces interpret.

That means this repository must remain legible to both:

* `VERIFRAX` as the evidence and verification boundary
* `VERIFRAX-verify` as the public verification surface

If receipt semantics drift without evidence repair, the execution layer becomes unreadable downstream.

## Inputs and outputs

### Inputs

This repository consumes:

* authority references produced by AUCTORISEAL
* governed boundary truth from `.github`
* runtime input sets for bounded execution
* command and scope material required by the selected execution body

### Outputs

This repository produces:

* permitted execution results
* receipt artifacts
* refusal artifacts
* deterministic runtime state transitions within its declared boundary

It does not produce:

* authority objects
* authored protocol source material
* derived specification publication
* proof landing content
* public verifier UI

## Current reading rule

Read this repository for runtime semantics, receipt semantics, and execution admission/refusal boundaries.

Read these neighboring repositories for the rest of the chain:

* [`.github`](https://github.com/Verifrax/.github) — governance root
* [`AUCTORISEAL`](https://github.com/Verifrax/AUCTORISEAL) — authority issuance and publication
* [`VERIFRAX`](https://github.com/Verifrax/VERIFRAX) — evidence root and artifact chain
* [`VERIFRAX-verify`](https://github.com/Verifrax/VERIFRAX-verify) — public verification surface
* [`VERIFRAX-SPEC`](https://github.com/Verifrax/VERIFRAX-SPEC) — derived specification publication
* [`VERIFRAX-DOCS`](https://github.com/Verifrax/VERIFRAX-DOCS) — documentation/reference surface

## CI and determinism expectations

Any CI described here must be real and load-bearing.

At minimum, CORPIFORM should enforce real checks for:

* identity alignment
* version and tag alignment
* deterministic receipt behavior on fixed input
* receipt schema stability
* authority-reference consistency
* runtime boundary drift detection

This README must not use badge theater to imply execution guarantees that the runtime and evidence do not actually prove.


## Verifrax system path labels

The governed Verifrax path that this README must stay compatible with is:

1. `.github` — organization governance and governed repository boundary
2. `AUCTORISEAL` — authority issuance and public authority reference
3. `CORPIFORM` — governed execution and receipt emission
4. `VERIFRAX` — authored protocol, evidence root, and artifact-chain registration boundary
5. `VERIFRAX-SPEC` — derived specification publication surface
6. `VERIFRAX-PROFILES` — deterministic profile-constraint surface
7. `VERIFRAX-SAMPLES` — pinned sample and reproducibility surface
8. `VERIFRAX-verify` — public verification repository and UI boundary
9. `VERIFRAX-DOCS` — explanatory documentation surface
10. `cicullis` — enforcement boundary
11. `proof` — proof publication surface
12. `SIGILLARIUM` — seal and archive reference surface
13. `apply` — intake surface

The live host-label map that must remain explicit and non-contradictory is:

* `https://api.verifrax.net/` — execution surface
* `https://proof.verifrax.net/` — proof publication surface
* `https://auctoriseal.verifrax.net/` — authority issuance and authority reference surface
* `https://corpiform.verifrax.net/` — runtime and receipt reference surface
* `https://cicullis.verifrax.net/` — enforcement reference surface
* `https://verify.verifrax.net/` — public verification surface
* `https://sigillarium.verifrax.net/` — seal and archive reference surface
* `https://apply.verifrax.net/` — intake surface
* `https://docs.verifrax.net/` — documentation surface

This README must remain compatible with `artifact-0005` as the load-bearing authority → execution → verification → evidence boundary without claiming that this repository alone authors, proves, seals, or registers `artifact-0005` unless that role is actually true for this repository.


## Security

Do not publish authority secrets, private runtime credentials, hidden execution inputs, unpublished emergency controls, or compromise details that would weaken the governed execution boundary.

Runtime compromise is not a documentation-only problem. It is an execution-integrity event.

## Contributing

A contribution is wrong if it:

* blurs execution with authority issuance
* blurs execution with truth verification
* overclaims compatibility beyond the recorded boundary
* hides receipt semantics behind prose only
* weakens refusal semantics
* weakens replay resistance
* introduces future-state claims as current truth

## License

Apache License Version 2.0. See `LICENSE`.
