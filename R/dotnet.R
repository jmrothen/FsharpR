#' check if .net sdk is installed
#'
#' @param verbose should additional progress detail be printed?
#'
#' @returns a list with two elements
#' \item{found}{a boolean indicating if the path was found}
#' \item{path}{the path or paths to the relavent folders}
#'
#' @export
find_dotnet <- function(verbose=T){
  if('dotnet.exe' %in% list.files('C://program files//dotnet//')){
    #sdks <- list.files('C://program files/dotnet/sdk')
    #print(paste('Found some SDKs', stringr::str_flatten_comma(sdks)))

    if(verbose){
      print('Found an installation at the default location...')
      print('C://program files//dotnet//')
    }
    found <- T
    location <- "C://program files/dotnet/"
  }else{
    # print('i could not find a dotnet folder in the default loprintion')
    list.files(path="C://program files/",
               recursive = T,
               include.dirs = T,
               full.names = T,
               ignore.case = T,
               pattern='dotnet') -> folders
    folders[grepl('dotnet/dotnet.exe$',folders)] -> exes
    if(length(exes)>=2){
      if(verbose){
        print('Found some installations of the dotnet SDK:')
        print(exes,sep = '\n')
      }
      found <- T
      location <- exes
    }else{
      if(is.na(exes)){
        if(verbose){
          print('Could not find any installations :(')
        }
        found <- F
        location <- NA
      }else{
        if(verbose){
          print('Found an installation:')
          print(exes,sep='\n')
        }
        found <- T
        location <- exes
      }
    }
  }
  out <- list(installed=found, path=location)
  return(out)
}


#' find sdks
#'
#'
#'
get_sdks <- function(){
  dotnet <- find_dotnet()
  for(i in dotnet$path){
    print('Dotnet Installation:')
    sdks <- list.files(paste(i,'sdk',sep=''))
    print(paste('List of SDKs: ', stringr::str_flatten_comma(sdks)))
  }
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




