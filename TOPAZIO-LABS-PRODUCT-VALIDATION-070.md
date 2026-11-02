# Topazio Labs — Product Validation 070

**Classification:** `PASS_WITH_WARNINGS`

## Scope and safety

This mission validated isolated development copies of Voltrama Studio and Topázio Microscope. No production workspace was modified, no existing product PR was merged or closed, no release/tag was published, and no global dependency was installed.

## Gate A — Voltrama Studio

**Decision:** `VOLTRAMA_PREVIEW_READY`

### Integrated chain

An isolated branch `integration/voltrama-product-preview` was created from `main` and combined the compatible public sequence:

`PR #7 (M0-002 foundation) → PR #10 (Community site) → PR #12 (public documentation contract/CI) → PR #16 (public components reference)`

The private-project/component-inventory chain (#8, #17, #19) and architecture proposal #6 were intentionally not included.

- Branch commit: `049b76f`
- Draft integration PR: [Voltrama #23](https://github.com/0xTPZ/voltrama-studio/pull/23)
- No merge into `main`

### Available functionality

- Studio/Community navigation and hash routes.
- Demonstrative public project catalog with search and category filtering.
- Shared project/publication contracts and provenance checks.
- Public site build and allowlist/privacy scan.
- Components reference library.

Electrical editing, electrical simulation, authenticated private projects and real KiCad/ngspice integration remain unimplemented or experimental. No such capability is claimed.

### Validation

`npm test` passed:

- smoke: OK
- community: OK
- navigation: OK
- public-contract: OK
- public-site build: 8 files
- public-site privacy/allowlist scan: OK

The local server started at `http://localhost:4173`, and the real browser inspection showed the catalog, search field, category filter and three neutral demonstration cards.

## Gate B — Topázio Microscope

**Decision:** `MICROSCOPE_PORTABLE_READY` for no-camera software smoke, with hardware warnings.

### Environment and tests

- Isolated clone: `E:\TopazioLabs-microscope-069`
- Isolated venv: `.venv070`
- Python: 3.12.10
- Installed from repository `requirements.txt`: NumPy, OpenCV, PySide6 and PyInstaller
- Test correction PR: [Microscope #4](https://github.com/0xTPZ/topazio-microscope/pull/4)

The original test was pytest-style and therefore invisible to `unittest discover`. A small unittest wrapper was added without changing production code. The corrected suite ran **1 test, 1 passed**.

### Hardware boundary

DirectShow and Media Foundation diagnostics ran in the isolated environment. No UVC device was available: all probed indices returned `opened=false` and zero frames. Consequently, camera capture, device selection, PNG capture, AVI recording and disconnect recovery are not claimed as physically validated in this mission.

### Portable build

- Build root: `E:\TopazioLabs-microscope-portable-070`
- Application: `E:\TopazioLabs-microscope-portable-070\dist\TopazioMicroscope\TopazioMicroscope.exe`
- Manifest: `E:\TopazioLabs-microscope-portable-070\MANIFEST-070.json`
- Files in portable directory: 252
- Executable SHA-256: `6F21A0500BA04A0EF714203611A40E4C080B15157DED5784EF5F643237EF552E`

The executable was launched from the portable directory with Qt offscreen mode and remained alive for five seconds before being stopped by the validation harness. This confirms startup packaging without a camera; it is not a GUI or hardware acceptance test.

The Repair Assistant remains experimental and was not integrated into `main`.

## Regression and security

- Voltrama `main` was not modified.
- Microscope `main` was not modified.
- Existing builds and production paths were not overwritten.
- No credentials, private files, models or unauthorized assets were included in the portable directory.
- No public service or network listener was opened by the validation.

## Remaining owner decisions

1. Review and merge, if desired, Voltrama preview PR #23.
2. Review Microscope documentation PR #3 and test-discovery PR #4.
3. Perform physical UVC validation on an authorized device before claiming full camera support.
4. Decide whether and when to publish a portable artifact; this mission did not publish a release.
