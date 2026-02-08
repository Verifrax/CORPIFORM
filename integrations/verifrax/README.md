# VERIFRAX INTEGRATION

This directory defines the **verification and evidence integration**
between CORPIFORM and **VERIFRAX**.

VERIFRAX is an **external verifier**.
It observes outcomes; it does not influence execution.

---

## ROLE

VERIFRAX is responsible for:

- verifying receipts and denials
- validating signatures and fingerprints
- reconstructing execution history from the ledger
- producing third-party evidence artifacts

CORPIFORM does not consume VERIFRAX output.

---

## INTEGRATION BOUNDARY

This integration provides:

- receipt/denial compatibility guarantees
- ledger export alignment
- verification tooling hooks

This integration does NOT provide:

- authority
- execution control
- policy modification
- runtime dependencies

---

## EVIDENCE FLOW

1. CORPIFORM emits receipt or denial
2. Ledger artifacts are exported
3. VERIFRAX verifies cryptographic integrity
4. VERIFRAX produces independent evidence

Verification is external and optional.

---

## FAILURE HANDLING

If this integration is missing or invalid:

- CORPIFORM behavior is unchanged
- execution safety is unaffected
- external verification is unavailable

---

## DECLARATION

VERIFRAX answers **“did this happen?”**

CORPIFORM answers **“should this happen?”**

The boundary is absolute.
