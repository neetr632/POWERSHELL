$Script = @'
$time = "12/21/2023"
[datetime]$time = "12/21/2023"

"this is the correct time = $time"
'this is the correct time = $time'
"this is the correct time = `$time and $time"

$p = Get-Process lsass
"process id = $($p.Id)"
"process id = $(Read-Host -Prompt "what value u want?")"
'@