# CORPIFORM

[![npm version](https://img.shields.io/npm/v/@verifrax/corpiform.svg)](https://www.npmjs.com/package/@verifrax/corpiform)
[![npm downloads](https://img.shields.io/npm/dm/@verifrax/corpiform.svg)](https://www.npmjs.com/package/@verifrax/corpiform)
[![npm bundle size](https://img.shields.io/bundlephobia/minzip/@verifrax/corpiform)](https://bundlephobia.com/package/@verifrax/corpiform)
[![license](https://img.shields.io/github/license/Verifrax/CORPIFORM.svg)](https://github.com/Verifrax/CORPIFORM/blob/main/LICENSE)
[![build](https://img.shields.io/github/actions/workflow/status/Verifrax/CORPIFORM/ci.yml?branch=main)](https://github.com/Verifrax/CORPIFORM/actions)
[![commit](https://img.shields.io/github/last-commit/Verifrax/CORPIFORM)](https://github.com/Verifrax/CORPIFORM/commits/main)
[![determinism](https://img.shields.io/badge/determinism-required-black)](#design-constraints)
[![execution](https://img.shields.io/badge/execution-authority--governed-blue)](#execution-model)
[![replay](https://img.shields.io/badge/replay-forbidden-red)](#replay-resistance)
[![verification](https://img.shields.io/badge/verification-verifrax-green)](https://github.com/Verifrax/VERIFRAX)

---

## Canonical definition

CORPIFORM is an authority-governed deterministic execution runtime that consumes AUCTORISEAL authority and emits signed, replay-resistant receipts.

---

## Position in the Verifrax stack

* **Authority** → [AUCTORISEAL](https://github.com/Verifrax/AUCTORISEAL)
* **Execution** → CORPIFORM
* **Verification** → [VERIFRAX](https://github.com/Verifrax/VERIFRAX)

CORPIFORM does not issue authority.
CORPIFORM does not verify truth.
CORPIFORM enforces execution under authority.

---

## Current posture

* Version: **v0.1.4**
* State: **PRE-FINAL EXECUTION SURFACE**
* Release type: **PUBLIC PRE-SEAL**
* Authority model: **EXTERNAL (AUCTORISEAL-GOVERNED)**
* Determinism: **REQUIRED**
* Replay: **FORBIDDEN (ENFORCED BY RECEIPT)**
* Compatibility: **GUARANTEED WITHIN RECORDED EXECUTION BOUNDARY (artifact-0004)**

---

## Verified execution boundary

Bound to:

* VERIFRAX: **artifact-0004**
* CORPIFORM commit: **f257493**
* Receipt: **EE07B689-F1BF-4518-B49C-C973CB178029**

This is the only asserted compatibility boundary.

---

## Package surface

* npm: [https://www.npmjs.com/package/@verifrax/corpiform](https://www.npmjs.com/package/@verifrax/corpiform)
* dist-tag: **latest**

CLI:

```bash
npx @verifrax/corpiform
```

---

## Execution model

Execution is permitted only if all conditions hold:

1. authority present and valid
2. scope matches
3. time window valid
4. custody valid
5. not revoked
6. not previously executed (execute-once)

Failure of any condition ⇒ **refusal**.

Success ⇒ **execution + signed receipt**.

---

## Receipt model

Receipt binds:

* `command_id`
* `authority_seal_id`
* execution context
* timestamp
* outcome

Properties:

* canonicalizable
* hashable
* signable
* externally verifiable

Guarantees:

* replay detection
* traceability
* authority binding

---

## Denial model

All refusals are:

* deterministic
* attributable
* materialized as denial artifacts

No silent failure.

---

## Replay resistance

* each `command_id` executes at most once
* subsequent attempts are refused
* prior execution is provable via receipt

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

### Execution boundary

* `execution/`
* `bodies/`
* `seals/`
* `revocation/`
* `receipts/`
* `denials/`
* `ledger/`

### Integration boundary

* `interfaces/`
* `integrations/auctoriseal/`
* `integrations/verifrax/`
* `id/TRUSTED_ROOTS/auctoriseal_roots.json`

### Runtime / adversarial

* `runtime/`
* `tests/`
* `fixtures/`
* `tools/`
* `observability/`

### Evidence boundary

* `evidence/README.md`

---

## Design constraints

* no authority → no execution
* no ambiguity → no execution
* no replay → enforced
* no unsigned consequence → rejected
* no hidden mutation → rejected

---

## Invariants

* deterministic execution
* external authority
* canonical receipts
* replay detectability
* boundary-scoped finality

---

## What CORPIFORM is not

* not an identity system
* not an authority issuer
* not a workflow engine
* not a best-effort executor

It is a constrained execution runtime.

---

## Security

* authority validation mandatory
* receipt signing mandatory
* denial paths explicit

See `SECURITY.md`.

---

## License

Apache License 2.0

See `LICENSE`.

---

## Links

* Protocol: [https://github.com/Verifrax/VERIFRAX](https://github.com/Verifrax/VERIFRAX)
* Authority: [https://github.com/Verifrax/AUCTORISEAL](https://github.com/Verifrax/AUCTORISEAL)
* Execution: [https://github.com/Verifrax/CORPIFORM](https://github.com/Verifrax/CORPIFORM)
