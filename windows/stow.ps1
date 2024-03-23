param(
    [string]$TargetPath,
    [string]$LinkPath
)


# First check if $LinkPath exist or not
if (-not $TargetPath) {
    Write-Host "Error: TargetPath is required."
    exit
}

# check if $LinkPath exist or not
if (-not $LinkPath) {
    Write-Host "Error: LinkPath is required."
    exit
}

$Target = Resolve-Path $TargetPath

# Check if the Targetd file path exists
if (-not (Test-Path -Path $Target -PathType Leaf)) {
    Write-Host "Error: Targeted file '$Target' does not exist."
    exit
}

# Get the filename from the $Target
$FileName = Split-Path -Path $Target -Leaf
echo $FileName

$LinkPathLeaf = Split-Path -Path $LinkPath -Leaf
echo $LinkPathLeaf

if (-not ($LinkPathLeaf -eq $FileName)){
  # $LinkPath doesn't contain the filename
  # Create symbolic link
  New-Item -ItemType SymbolicLink -Path $LinkPath\$FileName -Target $Target
}
else{
  # $LinkPath contains the filename
  # Create symbolic link
  New-Item -ItemType SymbolicLink -Path $LinkPath -Target $Target
}

