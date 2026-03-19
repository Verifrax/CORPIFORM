# CORPIFORM Package Boundary

## Package identity

- Package name: `@verifrax/corpiform`
- Package layer: authority / execution substrate
- Package category: shell-based CLI / action-wrapper package
- Repository source: `github.com/Verifrax/CORPIFORM`
- Initial package version target: `0.1.3`

## Why this category

CORPIFORM currently exposes an execution-control surface through shell entrypoints and shell enforcement scripts, not a stable JavaScript or TypeScript library API.

The installable contract is therefore an executable/runtime contract, not a JS import contract.

## Public package contract

The package should expose only the minimum truthful runtime surface required to execute and verify the governed execution pipeline.

Initial package contract:

- executable shell entrypoints
- runtime execution scripts
- receipt and denial emission scripts
- authority validation and seal verification scripts
- revocation verification/apply scripts
- minimal README and LICENSE package surface

## Excluded from initial tarball

The first package tarball should exclude any surface that is not required for runtime execution contract.

Exclude initially:

- `.github/`
- `.verifrax/`
- `docs/`
- `tests/`
- `fixtures/`
- `evidence/`
- `.vscode/`
- governance files not required by package consumers
- CI-only and repo-only metadata

## Initial include candidates

Include candidates to validate in the next move:

- `execution/`
- `receipts/`
- `denials/`
- `revocation/`
- `seals/`
- `tools/`
- `README.md`
- `LICENSE`

## Boundary note

This package boundary defines the first publishable contract only.
It does not yet define final npm mechanics, tarball contents, or release commands.
