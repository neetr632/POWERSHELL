
$rootDirectory = "D:\"
function List-FilesRecursively {
    param (
        [string]$directory
    )
    $files = Get-ChildItem -Path $directory -File
    foreach ($file in $files) {
        Write-Host "File: $($file.FullName)"
    }
    $subdirectories = Get-ChildItem -Path $directory -Directory
    foreach ($subdir in $subdirectories) {
        List-FilesRecursively -directory $subdir.FullName
    }
}
List-FilesRecursively -directory $rootDirectory
