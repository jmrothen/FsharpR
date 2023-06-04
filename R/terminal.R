#' find fsi terminal
#'
#'
find_fsi <- function(){
  out <- NA
  if(length(rstudioapi::terminalList())<1){
    out <- 'no terminals'
  }else{
    for(i in rstudioapi::terminalList()){
      if(!rstudioapi::terminalRunning(i)){
        next
      }
      tempbuff <- rstudioapi::terminalBuffer(i)
      if(sum(grepl('F# Interactive',tempbuff))>=1){
        out <- i
        break
      }
    }
    if(is.na(out)){
      'no fsi terminal'
    }
  }
  return(out)
}

#' Initializes a simple fsi terminal
#'
#' @export
fsi_init <- function(){
  find_fsi() -> terminal_info
  if(terminal_info %in% rstudioapi::terminalList()){
    terminal <- terminal_info
    print('found a possible FSI terminal already open!')
    rstudioapi::terminalActivate(terminal)
  }else{
    print('creating an FSI terminal...')
    terminal <- rstudioapi::terminalCreate('FSI', show=T)
    rstudioapi::terminalSend(terminal, 'dotnet fsi\n')
  }
  invisible(terminal)
}





#' Evaluate Code in FSI
#'
#' @export
to_fsi <- function(code, terminal=NA){
  code %>% stringi::stri_split_lines() -> codechunks
  codechunks_adj <- paste(codechunks[[1]],';;\n',sep = '')
  stringr::str_flatten(codechunks_adj) ->cca
  #rstudioapi::terminalExecute(cca)
  for(i in codechunks_adj){
    rstudioapi::terminalSend(terminal, i)
  }
}

code <- 'let x = 1
let y = 2
x+y'
terminal <- NA

pp <- fsi_init()

find_fsi()

to_fsi(code)
