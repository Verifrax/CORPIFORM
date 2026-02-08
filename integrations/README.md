# INTEGRATIONS

This directory contains **external system integrations** that interface
with CORPIFORM under strict authority and execution constraints.

Integrations do not execute independently.
They do not grant authority.
They do not modify CORPIFORM behavior.

---

## PURPOSE

Integrations exist to:

- map external products or services to CORPIFORM bodies
- define integration-specific constraints
- document interaction boundaries
- provide non-authoritative adapters or descriptors

They extend reach, not power.

---

## INTEGRATION PRINCIPLES

- Integrations are declarative
- Integrations are non-authoritative
- Integrations are replaceable
- Integrations are auditable

Removal of an integration reduces capability but does not alter invariants.

---

## CONTENT EXPECTATIONS

An integration MAY include:

- integration README
- product descriptors
- adapter bindings
- usage constraints
- compatibility notes

An integration MUST NOT include:

- authority issuance
- secret material
- execution logic outside declared bodies
- policy overrides

---

## EXECUTION RULE

All execution still flows through:

- authority validation
- execution gate
- body enforcement
- receipt or denial emission

Integrations cannot bypass this flow.

---

## FAILURE MODE

If an integration is missing, altered, or ambiguous:

- that integration becomes non-operable
- CORPIFORM continues safely without it

---

## DECLARATION

Integrations expand interfaces, not trust.

Authority and execution remain unchanged.
