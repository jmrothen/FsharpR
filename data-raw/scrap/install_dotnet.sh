# Download and install the latest .NET SDK
$url = "https://dot.net/v1/dotnet-install.ps1"
$outfile = "$env:TEMP\dotnet-install.ps1"
Invoke-WebRequest -Uri $url -OutFile $outfile
. $outfile -Channel "LTS"
