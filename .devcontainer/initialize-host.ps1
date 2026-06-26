param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspacePath
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$composeScript = Join-Path $scriptDir 'write-workspace-compose.sh'

$gitBashCandidates = @(
    (Join-Path $env:ProgramFiles 'Git\bin\bash.exe'),
    (Join-Path ${env:ProgramFiles(x86)} 'Git\bin\bash.exe')
)

$gitBash = $gitBashCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $gitBash) {
    Write-Error 'Git Bash not found. Install Git for Windows so devcontainer setup can run bash scripts.'
    exit 1
}

& $gitBash $composeScript $WorkspacePath
exit $LASTEXITCODE
