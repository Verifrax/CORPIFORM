# SECRETS POLICY

This document defines **how secrets may exist** in CORPIFORM.

Secrets are tolerated only as **runtime necessities**.  
They are never assets.  
They are never state.  

---

## ALLOWED SECRETS

The following secret classes are permitted **only at runtime**:

- signing private keys (receipt / denial)
- adapter credentials (API tokens, SSH keys)
- transport credentials (SMTP, registry, payment)

All secrets must be:
- injected at runtime
- short-lived
- externally managed

---

## FORBIDDEN PRACTICES

CORPIFORM MUST NEVER:

- store secrets in-repo
- commit secrets to version control
- log secrets
- emit secrets in receipts or denials
- cache secrets between executions
- derive secrets from other secrets

Any violation invalidates the system.

---

## SECRET LIFETIME

- Secrets exist only for the duration of execution
- Secrets are destroyed immediately after use
- No secret survives process termination

Persistence is forbidden.

---

## ACCESS CONTROL

- Secrets are readable only by the executing process
- No BODY may share secrets with another BODY
- No adapter may export secrets

---

## FAILURE HANDLING

If a required secret is missing or invalid:

- execution MUST NOT proceed
- authority MUST NOT be consumed
- denial MUST be emitted

---

## DECLARATION

Secrets are liabilities, not capabilities.

CORPIFORM survives without secrets.
