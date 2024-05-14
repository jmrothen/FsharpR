#' check if .net sdk is installed
#'
#' @param verbose should additional progress detail be printed?
#'
#' @returns a list with two elements
#' \item{found}{a boolean indicating if the path was found}
#' \item{path}{the path or paths to the relavent folders}
#'
#' @export
find_dotnet <- function(verbose=T, assign=T){

  # Check the basic option, works for my pc, but who knows if its normal
  if('dotnet.exe' %in% list.files('C://program files//dotnet//')){

    # Verbose output option
    if(verbose){
      cat('Found an installation at the default location... \n')
      cat('C://program files//dotnet//')
    }

    # update output
    found <- T
    location <- "C://program files/dotnet/"

  }else{

    # a recursive search for files that include "dotnet"
    list.files(path="C://program files/",
               recursive = T,
               include.dirs = T,
               full.names = T,
               ignore.case = T,
               pattern='dotnet') -> folders

    # filter down the list to locations that include the dotnet.exe
    folders[grepl('dotnet/dotnet.exe$',folders)] -> exes

    # how many valid locations changes output

    # if more than one exe, we'll pass the following info
    if(length(exes)>=2){
      if(verbose){
        print('Found some installations of the dotnet SDK:')
        print(exes,sep = '\n')
      }
      found <- T
      location <- exes
    }else{

      # if no exe found, print the following
      if(is.na(exes)){
        if(verbose){
          print('Could not find any installations :(')
        }
        found <- F
        location <- NA
      }else{

        # if only the one option, print
        if(verbose){
          print('Found an installation:')
          print(exes,sep='\n')
        }
        found <- T
        location <- exes
      }
    }
  }

  # prepare output
  out <- list(installed=found, path=location)
  invisible(out)
}


#' find sdks
#'
#' @returns List of available SDKs
#'
#' @export
get_sdks <- function(){
  dotnet <- find_dotnet()
  for(i in dotnet$path){
    cat('\n Dotnet Installation: \n')
    sdks <- list.files(paste(i,'sdk',sep=''))
    print(paste('List of SDKs: ', stringr::str_flatten_comma(sdks)))
  }
  invisible(sdks)
}



##' install dotnet
##'
##'
#install_dotnet_sdk <- function(version='ask'){
#  suppressMessages(find_dotnet()) -> dotnet
#  if(dotnet$installed){
#    print('Looks like you already have it installed')
#    print('Cancelling the install!')
#  }else{
#
#  }
#}

#### powershell the below

# powershell
#
# # Define the desired .NET SDK version
# $desiredVersion = "5.0.401"
#
# # Download and install the .NET SDK
# Invoke-WebRequest -Uri "https://dotnetcli.azureedge.net/dotnet/Sdk/$desiredVersion/dotnet-sdk-$desiredVersion-win-x64.exe" -OutFile "dotnet-sdk-installer.exe"
# Start-Process -Wait -FilePath "dotnet-sdk-installer.exe" -ArgumentList "/install", "/quiet", "/norestart"
#
# # Clean up the installer
# Remove-Item "dotnet-sdk-installer.exe"



