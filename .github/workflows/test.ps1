# $test = "test.bicep"
# $test = "test.bicep"
$test = "test.json"

$extension = [System.IO.Path]::GetExtension($test)
$parameterFilePrefix = if ($extension -eq ".json") {
    $extension = ".parameters.json"
    $test.TrimEnd(".json")
} elseif ($extension -eq ".bicep") {
    $extension = ".bicepparam"
    $test.TrimEnd(".bicep")
} else {
    return $null
}

if ($extension -eq ".parameters.json") {
    $workspaceParameterFile = $parameterFilePrefix + ".parameters-$WorkspaceId" + $extension
    if (Test-Path $workspaceParameterFile) {
    Write-Output "Param file: $workspaceParameterFile"
    return $workspaceParameterFile
    }
}

$defaultParameterFile = $parameterFilePrefix + $extension
Write-Output "Param file: $defaultParameterFile"


Write-Output "Parameter file prefix: $parameterFilePrefix and extension: $extension"