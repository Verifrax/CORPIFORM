# AUCTORISEAL INTEGRATION

This directory defines the **authority issuer integration** between
CORPIFORM and **AUCTORISEAL**.

AUCTORISEAL is the **sole source of execution authority**.
CORPIFORM does not issue, infer, or modify authority.

---

## ROLE

AUCTORISEAL is responsible for:

- issuing authority seals
- defining scope, time window, and custody
- signing authority cryptographically
- revoking authority when required

CORPIFORM only verifies and enforces.

---

## INTEGRATION BOUNDARY

This integration provides:

- authority seal format alignment
- trusted root declaration
- revocation compatibility
- semantic alignment of scope fields

This integration does NOT provide:

- execution logic
- policy overrides
- runtime behavior
- decision-making

---

## AUTHORITY FLOW

1. Authority is issued by AUCTORISEAL
2. Authority is delivered to CORPIFORM
3. CORPIFORM verifies issuer trust
4. CORPIFORM enforces authority exactly
5. CORPIFORM emits receipt or denial

Authority meaning is external.

---

## FAILURE HANDLING

If this integration is missing or invalid:

- CORPIFORM MUST refuse all execution
- authority cannot be verified
- system integrity is compromised

---

## DECLARATION

AUCTORISEAL defines **why** execution may occur.

CORPIFORM defines **whether** it will occur.

This boundary is absolute.
