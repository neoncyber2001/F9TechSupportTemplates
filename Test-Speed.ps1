<#
.SYNOPSIS
Perform a speed test with tools provided by Ookla (speedtest.com)

.Description
This tool will run and perform a network speed test. Commandline tools provided by speedtest.com are required (Version 1.2.0) and will be downloaded to a temporary directory if they do not exist.

.PARAMETER Unattended
Supress user input requests and force JSON output to file. Output location may be directed with the -OutputPath parameter.
NOTE: The SpeedTest tool will prompt you to accept it's licence agreement upon first run. This can not be supressed.

.PARAMETER Format
Format the output of the command. available formats are...
human-readable
  human readable output
csv
  comma separated values
tsv
  tab separated values
json
  javascript object notation (compact)
jsonl
  javascript object notation (lines)
json-pretty
  javascript object notation (pretty)

.PARAMETER Header
Display column headers

.PARAMETER UpdateInterval
Adjust time between updates (in Milliseconds).
Range is 1 to 1000. Default is 500.

.PARAMETER  ForceDownload
Forces tools to be downloaded from speedtest.net even if they already exist in the temp directory.

.PARAMETER  Cleanup
Remove tools after the test is complete.

.PARAMETER  SaveOutput
Save the output of the test to a text file.

.PARAMETER  OutputPath
Specify the Output path.

#>
[CmdletBinding()]

PARAM ( 
    [switch]$Unattended = $false,
    [string]$Format = $("human-readable"),
    [switch]$Progress = $false,
    [switch]$Header = $false,
    [int]$UpdateInterval = 500,
    [switch]$ForceDownload = $false,
    [switch]$Cleanup = $false,
    [switch]$SaveOutput = $false,
    [string]$OutputPath = $([string]::Empty),
    [switch]$LeaveNoTrace = $false
)




#----------------[ Declarations ]----------------

#--Constants---
New-Variable -Name SourceUri -Value 'https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip' -Option ReadOnly -Scope "Script" -ErrorAction SilentlyContinue
New-Variable -Name ArchiveFile -Value 'ookla-speedtest-1.2.0-win64.zip' -Option ReadOnly -Scope "Script" -ErrorAction SilentlyContinue
New-Variable -Name TempPath -Value "$env:TEMP" -Option ReadOnly -Scope "Script" -ErrorAction SilentlyContinue
New-Variable -Name ExeName -Value "speedtest.exe" -Option ReadOnly -Scope "Script" -ErrorAction SilentlyContinue
New-Variable -Name CleanupFiles -Value @("speedtest.exe", "speedtest.md", "ookla-speedtest-1.2.0-win64.zip") -Scope "Script" -ErrorAction SilentlyContinue
$ms_shell = New-Object -ComObject wscript.shell

# Set Error Action
$ErrorActionPreference = "Continue"

#----------------[ Functions ]------------------

#checks the User Temp directory to see if the speed test tool has been downloaded.
Function FindTool{
  Param()
  $archivePath = "$TempPath\$ArchiveFile"
  $toolpath = "$TempPath\$ExeName"
  $toolExists = Test-Path -Path "$toolpath"
  if($toolExists){
    Write-Host "speedtest.exe found!"
    #If force download has been set, delete and download again.
    if($ForceDownload){
        DoCleanup -Files $CleanupFiles
        Write-Host "Starting download..." -ForegroundColor White
        GetTool
    }

  }else{
    Write-Host "speedtest.exe not found... attempting download." -ForegroundColor Yellow
    GetTool
  }  
}

#Deletes the tool files and the archive file from the user temp directory.
Function DoCleanup{
    Param(
        [string[]]$Files
    )
    Write-Host "Cleanup Requested... " -ForegroundColor White
    Write-Host "Deleting Speed Test Tool!" -ForegroundColor Red
    $Files | ForEach-Object {
        $tgtFile = "$PSItem"
        Write-Host "Deleting $tgtFile" -ForegroundColor Red
        $tgtPath = "$TempPath\$TgtFile"
        if(Test-Path -Path "$tgtPath"){
            Remove-Item -Path "$tgtPath" -ErrorAction Stop
        }
    }
}

Function GetTool{
  Param()
    Invoke-WebRequest -Uri "$SourceUri" -OutFile "$TempPath\$ArchiveFile" -ErrorAction Stop
    Write-Host "Download Successfull" -ForegroundColor White
    $archiveHash = Get-FileHash -Path "$TempPath\$ArchiveFile" -Algorithm SHA256
    Write-Host "Archive SHA256"
    $archiveHash | Format-Table
    Expand-Archive -Path "$TempPath\$ArchiveFile" -DestinationPath "$TempPath" -OutVariable $ExtractedFiles -Force -ErrorAction Stop
    Write-Host "Archive Expanded" -ForegroundColor White
    $exeHash = Get-FileHash -Path "$TempPath\$ExeName" -Algorithm SHA256
    Write-Host "speedtest.exe SHA256"
    $exeHash | Format-Table
}

function RunTool{
    Param()
    if($Unattended){
        $SaveOutput = $true;
        $Format = 'json-pretty'
    }
    $args = @("--format=$Format", "--progress-update-interval=$UpdateInterval")
    if($Progress){
        $args += "--progress=yes"
    }
    if($Header){
        $args += "--output-header=yes"
    }
    if($OutputPath -eq [string]::Empty){
        $OutputPath = "$TempPath\Speedtest.txt"
        
    } 


    if($SaveOutput){
        Start-Process -FilePath "$TempPath\$ExeName" -ArgumentList $args -RedirectStandardOutput $OutputPath -Wait
        Write-Host "Output File Saved: $OutputPath" -ForegroundColor White
    } else {
        Start-Process -FilePath "$TempPath\$ExeName" -ArgumentList $args -Wait
    }
}

#----------------[ Main Execution ]---------------

# Script Execution goes here
# and can call any of the functions above.   

if($Unattended -eq $false){
    Write-Host "Please be aware that Connection to a VPN will affect the results of the speed test. Be sure that your are not connected to vpn before running the speed test to verify your connection speed." -BackgroundColor Yellow -ForegroundColor Black
    Read-Host -Prompt "Press Enter to continue..." 
}

FindTool
RunTool
if($Cleanup){
    DoCleanup -Files $CleanupFiles
    if($LeaveNoTrace){
        Write-Host "DEEP CLEANING LEAVES ONLY" -BackgroundColor DarkRed -ForegroundColor Red
        Remove-Item -Path $env:APPDATA\Ookla -Recurse
    }
}

