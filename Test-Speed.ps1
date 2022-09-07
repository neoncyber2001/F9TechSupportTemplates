# Test-Speed.ps1
[CmdletBinding()]

PARAM ( 
    [string]$Format = "human-readable",
    [switch]$Progress = $false,
    [switch]$Header = $false,
    [int]$UpdateInterval = 500,
    [switch]$ForceDownload = $false,
    [switch]$Cleanup = $false,
    [switch]$SaveOutput = $false,
    [string]$OutputPath = [string]::Empty
)

# Consider adding some comment based help for the script here.


#----------------[ Declarations ]----------------

#--Constants
New-Variable -Name SourceUri -Value 'https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip' -Option ReadOnly -Scope "Script"
New-Variable -Name ArchiveFile -Value 'ookla-speedtest-1.2.0-win64.zip' -Option ReadOnly -Scope "Script"
New-Variable -Name TempPath -Value "$env:TEMP" -Option ReadOnly -Scope "Script"
New-Variable -Name ExeName -Value "speedtest.exe" -Option ReadOnly -Scope "Script"
$CleanupFiles = @("speedtest.exe", "speedtest.md", "$ArchiveFile")

# Set Error Action
$ErrorActionPreference = "Continue"

# Dot Source any required Function Libraries
#. "C:\Scripts\Functions.ps1"

# Set any initial values
#$Examplefile = "C:\scripts\example.txt"

#----------------[ Functions ]------------------
Function FindTool{
  Param()
  $archivePath = "$TempPath\\$ArchiveFile"
  $toolpath = "$TempPath\\$ExeName"
  $toolExists = Test-Path -Path "$toolpath"
  if( $toolExists -eq $true ){
    Write-Host "speedtest.exe found!" 
    if($ForceDownload){
        DoCleanup -Files $CleanupFiles
        Write-Host "Starting download..." -ForegroundColor White
        GetTool
    }
    Return
  }else{
    Write-Host "speedtest.exe not found... attempting download." -ForegroundColor Yellow
    GetTool
    Retrun
  }  
}

Function DoCleanup{
    Param(
        [string[]]$Files
    )
    Write-Host "Cleanup Requested... " -ForegroundColor White
    Write-Host "Deleting Speed Test Tool!" -ForegroundColor Red
    $Files | ForEach-Object {
        $tgtFile = "[$PSItem]"
        Write-Host "Deleting $tgtFile" -ForegroundColor Red
        $tgtPath = "$TempPath\\$TgtFile"
        if(Test-Path -Path "$tgtPath"){
            Remove-Item -Path "$tgtPath" -ErrorAction Stop
        }
    }
    Return
}

Function GetTool{
  Param()
    Invoke-WebRequest -Uri "$SourceUri" -OutFile "$TempPath\\$ArchiveFile" -ErrorAction Stop
    Write-Host "Download Successfull" -ForegroundColor White
    $archiveHash = Get-FileHash -Path "$TempPath\\$ArchiveFile" -Algorithm SHA256
    Write-Host "Archive SHA256 $archiveHash.Hash"
    Expand-Archive -Path "$TempPath\\$ArchiveFile" -DestinationPath "$TempPath" -OutVariable $ExtractedFiles -Force -ErrorAction Stop
    Write-Host "Archive Expanded" -ForegroundColor White
    $exeHash = Get-FileHash -Path "$TempPath\\$ExeName" -Algorithm SHA256
    Write-Host "speedtest.exe SHA256 $exeHash.Hash"
}

function RunTool{
    $args = @("--format=$Format", "--progress-update-interval=$UpdateInterval")
    if($Progress){
        $args += "--progress=yes"
    }
    if($Header){
        $args += "--output-header=yes"
    }
    if($OutputPath -eq [string]::Empty){
        $OutputPath = "$TempPath\\Speedtest.txt"
        
    } 

    if($SaveOutput){
    Start-Process -FilePath $TempPath\\$ExeName -ArgumentList $args -Wait -RedirectStandardOutput $OutputPath
    Write-Host "Output File Saved: $OutputPath" -ForegroundColor White
    } else {
        Start-Process -FilePath $TempPath\\$ExeName -ArgumentList $args -Wait
    }
}

#----------------[ Main Execution ]---------------

# Script Execution goes here
# and can call any of the functions above.   
FindTool
RunTool
if($Cleanup){
    DoCleanup -Files $CleanupFile
}

