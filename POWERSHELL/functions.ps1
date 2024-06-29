function add-numbers {
    param (
        [int] $Number1,
        [int] $Number2
    )
    $Result = $Number1+$Number2
    return $Result
}
$sum = add-numbers -Number1 23 -Number2 24
Write-Host "the summ is: $sum"