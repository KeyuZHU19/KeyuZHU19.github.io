param()
$ErrorActionPreference = 'Stop'
$siteRoot = Split-Path -Parent $PSScriptRoot
$buildDirectory = Join-Path $siteRoot '.blog-build'
$themeRevision = 'd3768854d00ad003b0a8dbdba254ce9224377a01'
$hugoVersion = '0.168.0'
$hugoExecutable = Join-Path $buildDirectory 'hugo/hugo.exe'
$themeDestination = Join-Path $buildDirectory 'theme/hugo-PaperMod-master'

New-Item -ItemType Directory -Force $buildDirectory | Out-Null
if (-not (Test-Path $hugoExecutable)) {
    $archive = Join-Path $buildDirectory 'hugo.zip'
    Invoke-WebRequest "https://github.com/gohugoio/hugo/releases/download/v$hugoVersion/hugo_${hugoVersion}_windows-amd64.zip" -OutFile $archive
    Expand-Archive $archive (Join-Path $buildDirectory 'hugo') -Force
}
if (-not (Test-Path $themeDestination)) {
    $archive = Join-Path $buildDirectory 'PaperMod.zip'
    $expanded = Join-Path $buildDirectory 'theme-download'
    Invoke-WebRequest "https://codeload.github.com/adityatelange/hugo-PaperMod/zip/$themeRevision" -OutFile $archive
    Expand-Archive $archive $expanded -Force
    New-Item -ItemType Directory -Force $themeDestination | Out-Null
    Copy-Item -Path (Join-Path $expanded "hugo-PaperMod-$themeRevision/*") -Destination $themeDestination -Recurse -Force
}

& $hugoExecutable --source $PSScriptRoot --destination (Join-Path $siteRoot 'blog') --minify
if ($LASTEXITCODE -ne 0) { throw 'Blog build failed.' }
Copy-Item (Join-Path $themeDestination 'LICENSE') (Join-Path $siteRoot 'blog/PAPERMod-LICENSE.txt') -Force
