#$cdx = (pwd);
#$dir = $(find ./   -iname '*.HttpApi.Host.csproj');
#
#$dir = $dir + $(find ./   -iname '*.BasketService.csproj');
#$gateway =   $(find ./   -iname '*Gateway.csproj');
#
#foreach($cd in $dir)
#{
#    Write-Host "Working Dir:$cd ";
#    Start-Process  pwsh -NoNewWindow -ArgumentList "-Command `"nohup && dotnet run --project '$cd' `""
#
#    Set-Location -Path $cdx;  
#}
#
#
#foreach($cd in $gateway){
#    Write-Host "Working Dir:$cd ";
#    Start-Process  pwsh -NoNewWindow -ArgumentList "-Command `"nohup  &&  dotnet run --project '$cd' `""
#    Set-Location -Path $cdx;
#}

$cdx = Get-Location;
$dirs = Get-ChildItem -Recurse -Filter '*.HttpApi.Host.csproj' | ForEach-Object { $_.DirectoryName };
$dirs += Get-ChildItem -Recurse -Filter '*.BasketService.csproj' | ForEach-Object { $_.DirectoryName };
$gateways = Get-ChildItem -Recurse -Filter '*Gateway.csproj' | ForEach-Object { $_.DirectoryName };

foreach ($cd in $dirs) {
    Write-Host "Working Dir: $cd";
    Start-Process pwsh -ArgumentList "-Command `"cd '$cd'; dotnet run`"" -NoNewWindow -Wait;
    Set-Location -Path $cdx;
}

foreach ($cd in $gateways) {
    Write-Host "Working Dir: $cd";
    Start-Process pwsh -ArgumentList "-NoProfile -NoLogo -Command `"cd '$cd'; dotnet run`"" -NoNewWindow -Wait;
    Set-Location -Path $cdx;
}
