# TRUSTED ROOTS

This directory defines the **exclusive trust anchors** recognized by CORPIFORM.

Only entities explicitly listed here are permitted to issue artifacts
that CORPIFORM will accept as authoritative inputs.

---

## PURPOSE

Trusted roots establish the cryptographic and institutional boundary
between CORPIFORM and the outside world.

No trust is implicit.
No trust is inferred.
No trust is inherited.

---

## ACCEPTED ROOT TYPES

CORPIFORM recognizes trusted roots of the following types only:

- Authority issuers (e.g. AUCTORISEAL)
- Verification anchors explicitly referenced by authority seals

Each root must be:
- explicitly declared
- cryptographically identifiable
- immutable once accepted

---

## TRUST RULES

- Roots are matched strictly by fingerprint.
- Expired or revoked roots are invalid immediately.
- Unknown roots are rejected without inspection.
- Multiple roots do not imply fallback or redundancy.

---

## MODIFICATION POLICY

Changes to trusted roots require:

- explicit version increment
- resealing of authority lineage
- regeneration of BUILD_HASH

Runtime modification is forbidden.

---

## FAILURE MODE

If this directory is missing, empty, or ambiguous:

- CORPIFORM MUST refuse all execution
- CORPIFORM MUST be treated as untrusted

---

## DECLARATION

Trust begins and ends here.

Anything outside this directory is untrusted by definition.
