# Voltrama Studio — Final Integration Gate 073

**Decision:** `READY_WITH_WARNINGS`

## Initial state

- PR: [#23](https://github.com/0xTPZ/voltrama-studio/pull/23), Draft/open
- Historical branch head: `bc97dd7`
- Confirmed final head: `4b287a68dfd2b223c51373059733ddbebc8078c4`
- Mergeability: `MERGEABLE`, `CLEAN`
- Confirmed defect: `.github/workflows/pull-request.yml` ran `npm test` before installing dependencies, causing `argon2` module failure in CI.

## Correction

Added `npm ci` using the committed `package-lock.json` before `npm test` in `.github/workflows/pull-request.yml`.

- Commit: `4b287a6`
- Same PR #23 branch updated without force push
- No merge, release, tag, Pages activation or visibility change

## Local clean-install validation

In the isolated `E:\Voltrama\integration-072` checkout:

- `npm ci`: passed; 12 packages installed, 0 vulnerabilities reported.
- `npm test`: passed.
- `npm run build:site`: passed; 8 files built.
- `npm run test:site`: passed.
- `git diff --check`: passed.

The suite covered smoke/navigation, Community, SQLite migrations/idempotence, authentication, logout, CSRF/origin rejection, ACL isolation, invalid input, revision persistence/restoration, restart persistence, bootstrap safety, public contracts, build allowlist and privacy scanning.

## GitHub Actions evidence

Both mandatory workflows passed for the final SHA:

- [pull-request-validation run 41382653144](https://github.com/0xTPZ/voltrama-studio/actions/runs/41382653144) — success
- [test run 41382653154](https://github.com/0xTPZ/voltrama-studio/actions/runs/41382653154) — success

The earlier failed validation run was `41381612400`; it failed because `argon2` was not installed. It is superseded by the successful corrected run and remains part of the audit trail.

## Authentication and privacy

HTTP tests with temporary users verified registration, duplicate protection, wrong-password rejection, valid login, logout, invalidated session behavior, invalid Origin, missing/invalid CSRF, unauthenticated project denial, cross-user project denial, revision conflicts and restart persistence.

The public build uses its allowlist and does not read the private SQLite database. Demonstration projects remain marked as public snapshots; the publication action does not publish private projects. No credentials, private databases or internal repository content were added to the PR.

The service is local-only and must remain on `127.0.0.1`. Sessions are in memory and TLS/distributed authentication are intentionally outside this local gate; this is not a production security certification.

## Browser validation

Real browser validation on the local server demonstrated:

- Community landing, catalog cards, search/filter surface and navigation.
- Account registration and authenticated Studio session.
- Private project creation and display only inside the authenticated workspace.
- Navigation to the component/engineering library and back to Community.
- Mobile/desktop layout surfaces were opened through the same application routes.

The interface does not currently expose complete revision-history and restore controls. Those scenarios are covered by the HTTP/integration suite, but the browser gate for steps 6–8 is `UI_NOT_IMPLEMENTED`; no fictitious UI was added.

## Workflow review

- `pull-request.yml`: now installs with `npm ci` before tests; contents read only.
- `test.yml`: already used `npm ci` and passed.
- `pages.yml`: inspected; it is branch-scoped to the historical Community branch and was not activated or changed by this mission.
- No secrets or deployment settings were changed.

## PR state and limitations

PR #23 is open, Draft, mergeable and clean at `4b287a6`. The integrated product is technically stable for local development and owner review, but the UI does not yet provide revision history/restoration and the service is not suitable for public deployment without a separate security/TLS/session review.

## Final classification

`READY_WITH_WARNINGS` — build, automated tests, CI, local security boundaries and core integration passed. Owner review is still required for the browser UI gap and for any future merge decision. No merge was performed.
