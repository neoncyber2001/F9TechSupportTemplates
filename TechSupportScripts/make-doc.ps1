param (
    [string] $path = $(throw "-path required")
)
$outstring = "<document>"
#$instring = Get-Content -Path $path
$mastring = "<([\w\d]*)>(.*)<\/\1>|^:{2}([\S]*):{2}|^(\.[\S]*)"
$outlist = [System.Collections.ArrayList]::new()
$outnum = 0
Select-String -Pattern $mastring -Path $path | Select-Object -Property Matches | ForEach-Object -Process {
    $ma = $_.Matches.Captures
    Write-Output $ma
#    if($_.Success -eq "True"){
#        Write-Output $ma.
#        $outlist.add($ma)
#   }
    Select-Object -Property Value -InputObject $ma
}