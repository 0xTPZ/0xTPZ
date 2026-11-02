# Topazio Labs — Product Stabilization 071

**Overall classification:** `PASS_WITH_WARNINGS`

## Scope

The two products were stabilized in isolated workspaces. No production workspace, driver, firmware, `main` branch or existing functional PR was modified or merged. No release or tag was published.

## Gate A — Topázio Microscope

**Final gate:** `MICROSCOPE_SOFTWARE_READY_HARDWARE_PENDING`

### Environment

- Reference installation `C:\Users\User\Documents\TopazioLabs\Microscope` was inspected and left untouched.
- Isolated checkout: `E:\TopazioLabs-microscope-069`.
- Python 3.12.10 and dependencies installed only in `.venv070` from `requirements.txt`.
- The previously created 070 candidate was not overwritten.

### Device and physical capture

The current Windows device query returned no present Camera/Image device. DirectShow and Media Foundation diagnostics both reported zero opened devices and zero frames. The historical `USB 2.0 Camera` VID/PID reference was not treated as current evidence.

Therefore, physical resolution, observed FPS, PNG capture, AVI recording, reconnection and disconnect recovery remain pending. No driver or firmware operation was attempted.

### Software and interface validation

- The original pytest-style processing function was not visible to `unittest discover`; PR [#4](https://github.com/0xTPZ/topazio-microscope/pull/4) now contains only a unittest wrapper after a normal update from `main`.
- Result: **1 test passed**.
- The portable executable was launched in offscreen smoke mode for five seconds and also opened as a real Windows GUI window titled `Topázio Microscope — Inspeção eletrônica`.
- No camera-dependent success was claimed.

### Portable candidate

- Directory: `E:\TopazioLabs-microscope-portable-071\dist\TopazioMicroscope`
- Manifest: `E:\TopazioLabs-microscope-portable-071\MANIFEST-071.json`
- Manifest SHA-256: `5BFE423EE535712A812522B9511EEA6DB63A8C2F1DF0D8F693914A4FEDD816D9`
- Portable files: 252
- Executable SHA-256: `8BFF96717903787BA6CFB4BAF5067B47C66282059DCE45526E267296257585ED`

The candidate includes the executable, bundled runtime/assets, README, license and contribution notice. It excludes the venv, caches, captures, credentials and private workspaces.

Repair Assistant remains experimental and was not integrated.

## Gate B — Voltrama Studio

**Final gate:** `VOLTRAMA_STABLE_WITH_WARNINGS`

### Isolated integration

Branch `integration/voltrama-product-preview` combines the compatible public chain PR #7 → #10 → #12 → #16. The private-project/component-inventory branches and architecture proposal were intentionally excluded.

- Preview commit: `049b76f`
- Draft PR: [Voltrama #23](https://github.com/0xTPZ/voltrama-studio/pull/23)
- `main` was not changed.

### Architecture and behavior

The preview separates the Studio shell, Community catalog, public snapshots/contracts and component reference. It does not claim an electrical editor, simulator, authenticated private workspace or live KiCad/ngspice integration.

### Tests and browser evidence

`npm test` passed all existing checks: smoke, Community, navigation, public contract, public-site build and privacy/allowlist scan. The static site built 8 files. A local server was opened in a real browser; catalog, search, category filtering and three neutral demonstration cards were visible.

### Pages safety

The preview workflow was inspected but GitHub Pages was not activated and no external publication was performed by this mission.

## Security and regression

- No credentials or private data entered either candidate.
- No proprietary assets were added.
- No global package installation occurred.
- No public service was opened.
- The Microscope venv remains untracked and outside the repository history.
- Existing production and prior build directories were preserved.

## Remaining decisions

1. Perform physical UVC validation with an authorized microscope before calling Microscope hardware-stable.
2. Review [Microscope #4](https://github.com/0xTPZ/topazio-microscope/pull/4) and [Voltrama #23](https://github.com/0xTPZ/voltrama-studio/pull/23); both remain Draft/open.
3. Decide whether to distribute either internal candidate; no release was published.
