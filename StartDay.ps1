$FileUrl = "https://overload.media:8888/mi/F9Major.ahk"
$TempFile= "./F9AHK/miDownload.ahk"
$FileLocation = "./F9AHK/F9Major.ahk"
$FileName = "F9Major.ahk"
$ahkScr = "ServiceDeskAlternate.ahk"


$fileHash = Get-FileHash -Path $FileLocation
Invoke-WebRequest -Uri $FileUrl -OutFile $TempFile
$tempHash = Get-FileHash -Path $TempFile
Write-Output $fileHash
Write-Output $tempHash
if ( $fileHash.Hash -ne $tempHash.Hash ){
    Remove-Item  "$FileLocation"
    Rename-Item -Path "$TempFile" -NewName "$FileName"
}
Invoke-Item $ahkScr


