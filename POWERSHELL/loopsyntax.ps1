
$i=1
Do {
    $i=$i+1
    Write-output "powershell is great! and it is running"
} while($i -le 5)

$services = Get-Service
1..1 | ForEach-Object -Process{start calc}

for($i=0 ; $i -lt 5; $i++){
Write-Output "hello powershell"
}

$temp = 23
while($temp -le 30 ){
Write-Output "scripting is great! $temp"
$temp++
}