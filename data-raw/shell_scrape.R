# idk how to go about this section yet,
# there are shell/bash scripts to install dotnet, but i'm not certain how to best use them yet

#' find dotnet sdk link
rvest::read_html('https://dotnet.microsoft.com/en-us/download/dotnet/7.0') -> html
html_elements(html,css = '.download-panel button') %>% html_text()

# bash script for linux/macos
# https://dot.net/v1/dotnet-install.sh
download.file('https://dot.net/v1/dotnet-install.sh',destfile='~/R-Packages/FsharpR/data-raw/dotnet-install.sh')

# powershell for windows
# https://dot.net/v1/dotnet-install.ps1
download.file('https://dot.net/v1/dotnet-install.ps1',destfile='~/R-Packages/FsharpR/data-raw/dotnet-install.ps1')


