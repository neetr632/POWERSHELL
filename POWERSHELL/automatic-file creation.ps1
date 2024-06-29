
$basedirectory = "C:\Users\neham\OneDrive\Desktop\powershell"
$choice = Read-Host "MAKE A CHOICE:-'C OR D'"
if ($choice -eq 'C') {
    $count = Read-Host "NUMBER OF FILES YOU WANT TO CREATE? INPUT: a number"
    function filecreation {
        param(
            [int]$count
        )

        for ($i = 1; $i -le $count; $i++) {
            $filename = "Textname$i.exe"
            $filepath = join-path -Path $basedirectory -ChildPath $filename
            Set-Content -Path $filepath -Value "this is automated file creation process of $count files by powershell"
        }
    }
    filecreation -count $count
}
elseif ($choice -eq 'D') {
    $chooseAgain = Read-Host "DO U WANT TO DELETE ALL FILES OR JUST A SPECIFIC ONE? FOR a single file type 'files' FOR multiple files type 'dir'"
    if ($chooseAgain -eq 'files') {
        $file = Read-Host "write the name of the file you want to delete specifically:"
        $filepathToDelete = Join-Path -Path $basedirectory -ChildPath "$file" #file paths merge karhe taki sirf ek file delete hosake jiska path merge hua ho 
    
        if (Test-Path -Path $filepathToDelete -PathType Leaf) {
            Remove-Item -Path $filepathToDelete
            Write-Host "File $file has been deleted."
        }
        else {
            Write-Host "File $file not found"
        }
    }
    elseif ($chooseAgain -eq 'dir') {
        $dir = Read-Host "write the name of the directory you want to delete:"
        $directoryPathToDelete = Join-Path -Path $basedirectory -ChildPath $dir
        if (Test-Path -Path $directoryPathToDelete -PathType Container) {
            Remove-Item -Path $basedirectory -Filter "$dir"
            Write-Host "you have deleted all directory that are named $dir "
        }
        else {
            Write-Host "Directory $dir not found."
        }
    }
    else {
        Write-Host "Invalid choice. Please select 'FILES' or 'DIR'."
    }
  
}
else {
    Write-Host "invalid choice: TRY AGAIN"
}
