$basedirectory = "C:\Users\neham\OneDrive\Desktop\powershell"
$choice = Read-Host "MAKE A CHOICE: 'C' OR 'D'"
if ($choice -eq 'C') {
    $count = Read-Host "NUMBER OF FILES YOU WANT TO CREATE? INPUT: a number"
    function filecreation {
        param (
            [int]$count
        )

        for ($i = 1; $i -le $count; $i++) {
            $filename = "Textname$i.exe"
            $filepath = Join-Path -Path $basedirectory -ChildPath $filename
            Set-Content -Path $filepath -Value "This is the automated file creation process of $count files by PowerShell"
        }
    }
    filecreation -count $count
}
elseif ($choice -eq 'D') {
    $chooseAgain = Read-Host "DO YOU WANT TO DELETE 'FILES' OR 'DIRECTORIES'?"
    if ($chooseAgain -eq 'FILES') {
        $file = Read-Host "Write the name of the file you want to delete specifically:"
        $filePathToDelete = Join-Path -Path $basedirectory -ChildPath $file

        if (Test-Path -Path $filePathToDelete -PathType Leaf) {
            Remove-Item -Path $filePathToDelete
            Write-Host "File '$file' has been deleted."
        } else {
            Write-Host "File '$file' not found."
        }
    }
    elseif ($chooseAgain -eq 'DIRECTORIES') {
        $directory = Read-Host "Write the name of the directory you want to delete specifically:"
        $directoryPathToDelete = Join-Path -Path $basedirectory -ChildPath $directory

        if (Test-Path -Path $directoryPathToDelete -PathType Container) {
            Remove-Item -Path $directoryPathToDelete -Force -Recurse
            Write-Host "Directory '$directory' and its contents have been deleted."
        } else {
            Write-Host "Directory '$directory' not found."
        }
    }
    else {
        Write-Host "Invalid choice. Please select 'FILES' or 'DIRECTORIES'."
    }
}
else {
    Write-Host "Invalid choice: TRY AGAIN"
}
