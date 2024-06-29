$userInput = read-host "Enter your number greater than 5 to enter a endless loop"
$userInput = $count
while($count -gt 5){
Write-Host "i: $count"
$count++
if($count -eq 35){
write-host "the loop has reached 35. exititng the loop."
break
}
}


