
# FsharpR

<!-- badges: start -->
<!-- badges: end -->

The goal of this project is to provide the necessary functionality to write and run F# code in Rstudio!

## Installation

If you'd like to install the package in its current state...

```{r}
devtools::install_github('jmrothen/FsharpR')
```

Although it might be best to wait a few months for me to improve this package a bit more.

## Example

The main functionality of the package are the addins included. These can be configured to a keyboard shortcut, and can be used to send selected text, or an entire text to a terminal where F Sharp Interactive is available.

## Development Plans and Ideas

- function to install the .net SDK with an R function
-   ~install_dotnet(version_number, etc)
-   an alternative option is to just have a function that opens microsoft website for downloading the sdk
- microsoft provides some bash/shell scripts for the installation of the .net sdks via terminal
-   haven't figured out how to run these quite yet... and not sure if it's wise to include some bash/sh that I'm not too familiar with
- I'd love to figure out a way to add F# syntax highlighting
- I'd also love to have rstudio recognize .fs or .fsi files in the file_viewer (and display a unique file icon for each)

