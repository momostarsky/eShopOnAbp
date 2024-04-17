Get-Process | Where-Object { $_.ProcessName -eq "dotnet"  } | ForEach-Object {
    Write-Host "Killing Process: $($_.ProcessName)";
    Write-Host "Killing Process: $($_.StartInfo.FileName)";
}