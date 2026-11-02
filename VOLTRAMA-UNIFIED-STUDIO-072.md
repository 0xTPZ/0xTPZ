# Voltrama Unified Studio 072

**Final classification:** `VOLTRAMA_UNIFIED_WITH_WARNINGS`

## Integrated reference

- Isolated worktree: `E:\Voltrama\integration-072`
- Branch: `integration/voltrama-studio-unified`
- Final commit: `bc97dd7064aa1aa5db4cf264cb5c29760032ec0f`
- Existing Draft PR updated without merge: [Voltrama #23](https://github.com/0xTPZ/voltrama-studio/pull/23)
- `main` unchanged; no release, tag or GitHub Pages activation

## Architecture

The reference combines three explicit areas:

- **Studio:** local Argon2id account registration/login, loopback session, CSRF/origin checks, private projects, SQLite persistence, immutable revisions and restoration.
- **Community:** allowlisted demonstrative catalog, search/filter/detail flows, public contracts and static-site/privacy checks. It does not read the private project database or publish user projects.
- **Engineering:** component contracts and documented KiCad/ngspice/designElectronics adapters; no electrical editor or simulator is claimed.

The private inventory and public component catalog remain separate. Project and revision queries enforce `owner_id` server-side; changing an identifier does not cross the authorization boundary.

## Integrated source sequence

The branch incorporated the compatible public PR sequence with normal merge commits:

`#7 foundation → #8 private projects/revisions → #17 private component inventory → #19 inventory UI/profile → #10 Community site → #12 public documentation contract → #16 public components reference`.

The architecture proposal #6 was not merged. The integration used only files present in the public repository PRs; no internal private repository content was copied.

## Test results

`npm install` was run in the isolated checkout and reported zero vulnerabilities. `npm test` passed:

- smoke and navigation;
- Community catalog/search/filter contracts;
- SQLite migrations and idempotence;
- HTTP authentication, logout, ACL isolation, invalid input, CSRF protection and restart persistence;
- bootstrap idempotence and secret-free behavior;
- public contract validation;
- static site build (8 files);
- public-site allowlist/privacy scan.

The real browser flow created a demonstration account, authenticated, created a private project, returned to the integrated workspace, opened the component/engineering library and navigated back to Community. The private project was visible only in the authenticated Studio view. HTTP tests additionally verified revisions, restoration, cross-user denial and persistence after server restart.

## Internal package

- Directory: `E:\Voltrama\releases-internal\voltrama-unified-072`
- ZIP: `E:\Voltrama\releases-internal\voltrama-unified-072.zip`
- Files in source package: 111
- Manifest SHA-256: `B35692E6E8E3CB14D1BE0145EA52E712F9D49648509AD66A0863EC54AE13FAAE`
- ZIP SHA-256: `BD2AC5EA2AE9DF18103ADD7E366E5700FEDEEFFC3DECF2FD878FE2FE0366DC2A`

The package contains source, tests, scripts, docs, static site files, license and lockfile. It excludes `node_modules`, databases, sessions, credentials, production configuration and private workspaces. Start with `npm install` followed by `npm test`, then `npm run dev`; the server is loopback-only by default.

## Security limits

The tests verify basic local isolation and fail-closed behavior, not a production security certification. Sessions are in-process, TLS is not configured, and the application is not intended to be exposed beyond loopback. Community publication remains demonstrative and allowlisted.

## Owner decisions

1. Review the updated Draft PR #23 before any merge decision.
2. Decide whether the private-project chain is appropriate for the public repository's next development stage.
3. Perform a separate security review before any non-loopback deployment.
