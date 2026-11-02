# GitHub PR Dependency Map 069

Revalidated against the GitHub API on 2026-11-02. The baseline had 60 open PRs; four documentation PRs were added during this mission, so the current public total is 64. No merge or branch mutation was performed.

## Fabuloom

The open PRs form several visible chains through their base branches. The cinematic/content sequence runs from PR #33's Alpha preparation into PR #34 and then the mission 025–035 branches; the character-art sequence runs through PRs #25–#32. These are not independent merge candidates merely because they are open. PR #33 remains the licensing-sensitive Alpha gate and is still Draft. PRs carrying Topazioverse cinematic or character work require owner review before any integration or redistribution decision.

Recommended order: review the current `main` and Alpha boundary first, then evaluate the neutral/source-only documentation and infrastructure changes, then review each dependent content chain from its earliest base. Do not merge a downstream branch while its base branch is unreviewed.

## Voltrama Studio

The nine open PRs are staged through bases including `main`, `m0-002/community-foundation`, `m0-004/community-showcase`, `m0-005/publication-contract`, `m1-001a/private-component-inventory` and `m1-001a/private-component-inventory`. The safe review sequence starts with PR #7 (foundation), then #10/#12 (community/publication contract), then #8 and #16/#17/#19 according to their base relationships. PR #6 is an architecture proposal against `main` and should be reviewed separately. All remain Draft and need tests/integration review.

## Topázio Microscope

PR #1 targets `main` from `v0.2`; PR #2 targets `v0.2` from `feature/repair-assistant`. Review #1 first, including its license and Windows validation, then assess #2 against the resulting public contract. The local documentation PR #3 is independent and documentation-only.

## Risk map

| Area | Risk | Action |
|---|---|---|
| Fabuloom | Protected art/licensing and long dependent chains | Keep #33 Draft; owner review before integration |
| Voltrama | Branch-base dependency chain | Review foundation-to-leaf, one stage at a time |
| Microscope | Missing local `cv2` in this audit environment and license/distribution boundary | Re-run tests in an isolated dependency environment before approving |
| Mobile/LocalCoder | Research claims can be overstated | Use explicit status documents and preserve conservative wording |
