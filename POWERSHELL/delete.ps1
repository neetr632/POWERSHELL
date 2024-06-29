
$basedirectory = "C:\Users\neham\OneDrive\Desktop\powershell"
$choice = Read-Host "MAKE A CHOICE:-'C OR D'"
if ($choice -eq 'C') {
    $count = Read-Host "NUMBER OF FILES YOU WANT TO CREATE? INPUT: a number"
    function filecreation {
        param(
            [int]$count
        )

        for ($i = 1; $i -le $count; $i++) {
            $filename = "Textname$i.csv"
            $filepath = join-path -Path $basedirectory -ChildPath $filename
            Set-Content -Path $filepath -Value "this is automated file creation process of $count files by powershell"
        }
    }
    filecreation -count $count
}
elseif ($choice -eq 'D') {
    $chooseAgain = Read-Host "DO U WANT TO DELETE ALL FILES OR JUST A SPECIFIC ONE? FOR a single file type 'ONE' FOR multiple files type 'ALL'"
    if ($chooseAgain -eq 'ONE') {
        $file = Read-Host "write the name of the file you want to delete specifically:"
        $filepathToDelete = Join-Path -Path $basedirectory -ChildPath "$file" #file paths merge karhe taki sirf ek file delete hosake jiska path merge hua ho 
        Remove-Item -Path $filepathToDelete
    }
    elseif ($chooseAgain -eq 'ALL') {
        $file = Read-Host "write the name of the file you wnat to delete:"
        Remove-Item -Path $basedirectory -Filter "$file"
        Write-Host "you have deleted all files that are named $file "
    }
    else {
        Write-Host "no one cares"
    }
  
}
else {
    Write-Host "invalid choice: TRY AGAIN"
}
