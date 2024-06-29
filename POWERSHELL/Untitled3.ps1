$numberOfRuns = 2

$script = {
    $urls = @(
        "https://www.facebook.com",
        "https://www.google.com",
        "https://www.bing.com",
        "https://www.yahoo.com",
        "https://www.openai.com"
    )
    ForEach ($url in $urls) {
        Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList $url
    }

    Write-Host "This is your script"
}

1..$numberOfRuns | ForEach-Object {
    Write-Host "Running script iteration $_"
    & $script
}
