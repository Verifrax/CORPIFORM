# TOOLS

This directory contains **operator-only control tools** for CORPIFORM.

Tools do not execute bodies.
Tools do not grant authority.
Tools do not bypass enforcement.

They exist to **stop**, **freeze**, or **inspect** the system.

---

## TOOL PRINCIPLES

- Tools are non-executing
- Tools are non-authoritative
- Tools are irreversible in effect
- Tools are auditable

If a tool acts, CORPIFORM does not.

---

## AVAILABLE TOOLS

Tools MAY include:

- system freeze
- system termination
- state inspection
- ledger export

Tools MUST NOT include:

- execution triggers
- authority creation
- authority override
- retry mechanisms
- policy mutation

---

## OPERATOR BOUNDARY

Operators may use tools to:

- halt execution
- preserve evidence
- inspect system state

Operators may NOT use tools to:

- resume execution
- bypass denials
- alter history

---

## FAILURE MODE

If tools are missing or altered:

- execution behavior MUST NOT change
- operational control is reduced
- safety remains intact

---

## DECLARATION

Tools exist to stop CORPIFORM, not to drive it.

Control is subtractive, never additive.
