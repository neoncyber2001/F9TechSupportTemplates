
# Upload-SSHKey.ps1
[CmdletBinding()]
PARAM(
    [Parameter(Mandatory=$false)]
    [System.IO.FileInfo]$Path = "$env:USERPROFILE\.ssh\id_rsa.pub",
    [Parameter(Mandatory=$true)]
    [string]$TargetHost = $(throw "-TargetHost Is Required.")
)
<#
.SYNOPSIS
    This script will a public ssh key (created with SSH-Keygen) to a remote ssh server's authorized_keys file.

.DESCRIPTION
    A very basic replacement for the SSH-CopyID command for windows.

.PARAMETER <Path>
    The location of the public key file to upload.

.PARAMETER <TargetHost>
    IPAddress of Host Name of the target server.

.EXAMPLE
    Upload the default SSH key (by default C:\Users\[UserName]\.ssh\id_rsa) to an SSH Server on the host located at 192.168.0.128
    PS \Upload-SshKey -TargetHost "192.168.0.128"

.EXAMPLE
    Upload the default SSH key to an SSH Server on host located at 192.168.0.128
    PS \Upload-SshKey -TargetHost "192.168.0.128"

.NOTES
    Author: Joe Herbert
    Licence: MIT Licence
    Copyright 2021 Joe Herbert

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#>
Begin{
}

Process{
    type $Path | ssh $TargetHost "cat >> .ssh/authorized_keys"
}

End {

}

