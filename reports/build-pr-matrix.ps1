$ErrorActionPreference = 'Stop'
$repos = gh api 'user/repos?per_page=100&affiliation=owner' | ConvertFrom-Json | Where-Object { $_.visibility -eq 'public' -and $_.name -ne '0xTPZ' }
$rows = @()
foreach ($repo in $repos) {
  $prs = @(gh api "repos/0xTPZ/$($repo.name)/pulls?state=open&per_page=100" | ConvertFrom-Json)
  foreach ($pr in $prs) {
    $detail = gh api "repos/0xTPZ/$($repo.name)/pulls/$($pr.number)" | ConvertFrom-Json
    $class = if ($repo.name -eq 'fabuloom' -and $pr.number -eq 33) { 'LICENSING_REVIEW;NEEDS_TESTING' } elseif ($repo.name -eq 'voltrama-studio') { 'DEPENDENT;NEEDS_TESTING' } elseif ($pr.draft) { 'NEEDS_TESTING' } else { 'UNKNOWN' }
    $rows += [pscustomobject]@{repository=$repo.name;number=$pr.number;title=$pr.title;url=$pr.html_url;draft=$pr.draft;head=$pr.head.ref;base=$pr.base.ref;changed_files=$detail.changed_files;classification=$class}
  }
}
$rows | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 (Join-Path $PSScriptRoot 'GITHUB-PR-MATRIX-068.json')
$md = @('# GitHub PR Decision Matrix 068','','Generated directly from the GitHub API on 2026-11-02. Open PRs analyzed: {0}.' -f $rows.Count,'', '| Repo | PR | Draft | Title | Base <- head | Files | Classification |','|---|---:|:---:|---|---|---:|---|')
foreach ($row in $rows) {
  $repoName = $row.repository; $number = $row.number; $draft = $row.draft; $title = $row.title.Replace('|','/'); $base = $row.base; $head = $row.head; $files = $row.changed_files; $class = $row.classification; $url = $row.url
  $md += ('| {0} | [{1}]({2}) | {3} | {4} | ``{5}`` <- ``{6}`` | {7} | {8} |' -f $repoName,$number,$url,$draft,$title,$base,$head,$files,$class)
}
$md += @('','## Review policy','','- No PR was merged, closed, rebased, or force-pushed by this mission.','- Fabuloom #33 remains Draft and is flagged for licensing/testing review.','- Voltrama PRs are dependent staged work because their base branches form a chain.','- Classifications are triage labels, not approval to integrate.')
$md | Set-Content -Encoding UTF8 (Join-Path $PSScriptRoot 'GITHUB-PR-MATRIX-068.md')
