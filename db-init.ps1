$cdx = (pwd)

$dir = $(find ./  -type d  -iname '*.EntityFrameworkCore')

foreach($cd in $dir){
    Write-Output  "Working Dir:$cd "
    if(Test-Path -Path $cd -PathType Container){
        if( $cd.EndsWith("CmskitService.EntityFrameworkCore")) {
            Write-Host  "Not nedd Update"
        } else {
            Write-Host  "Can Update"
            Set-Location -Path $cd
            dotnet ef database update
        }
        
     
        Set-Location -Path $cdx
    } else {
        Write-Host  "Dir Not Exists"
    }
}
Write-Output "Over"
Set-Location -Path  $cdx
