# TESTS

This directory contains **deterministic enforcement tests** for CORPIFORM.

Tests verify **invariants**, not behavior convenience.
Every test asserts that something **must or must not happen**.

---

## TEST PRINCIPLES

- Tests are deterministic
- Tests are isolated
- Tests are non-destructive
- Tests are authority-free
- Tests are replayable

No test performs real execution.

---

## TEST SCOPE

Tests validate:

- authority enforcement
- refusal correctness
- execute-once semantics
- scope enforcement
- time window enforcement
- revocation handling
- ledger integrity
- death and freeze behavior

---

## FAILURE PHILOSOPHY

A failing test means:

- an invariant was violated
- the system is unsafe
- execution must not be trusted

There is no “acceptable failure”.

---

## TEST EXECUTION RULES

- Tests must never require secrets
- Tests must never reach external systems
- Tests must never emit real receipts
- Tests must never mutate the ledger irreversibly

Mocks and fixtures only.

---

## DECLARATION

Tests define what CORPIFORM will not compromise.

If tests do not pass,  
**CORPIFORM MUST NOT BE DEPLOYED.**
