param(
    [string]$Target,
    [string]$LinkPath
)

# Check if the original file path exists
if (-not (Test-Path -Path $Target -PathType Leaf)) {
    Write-Host "Error: Targeted file path '$Target' does not exist."
    exit
}

# Create symbolic link
New-Item -ItemType SymbolicLink -Path $LinkPath -Target $Target

Write-Host "Symbolic link created successfully at '$LinkPath' pointing to '$Target'."
