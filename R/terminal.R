#' find fsi terminal
#'
#' @export
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
      out <- 'no fsi terminals'
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
  return(terminal)
}



#' Evaluate Code in FSI
#'
#' @param code Fsharp code to be executed in FSI
#' @param terminal relevant terminal id
#' @param show should it bring the terminal window to focus?
#' @export
to_fsi <- function(code, terminal=NA, show=T){
  if(is.na(terminal)){
    terminal <- find_fsi()
  }
  if(terminal %in% c('no terminals', 'no fsi terminals')){
    terminal <- fsi_init()
  }
  if(length(code)==1){
    code %>% stringi::stri_split_lines() -> codechunks
    codechunks_adj <- paste(codechunks[[1]],';;\n ',sep = '')
    stringr::str_flatten(codechunks_adj) ->cca
  }else{
    code -> codechunks
    codechunks_adj <- paste(codechunks,';;\n ',sep = '')
    stringr::str_flatten(codechunks_adj) ->cca
  }
  #rstudioapi::terminalExecute(cca)
  if(show){rstudioapi::terminalActivate(terminal)}
  for(i in cca){
    rstudioapi::terminalSend(terminal, i)
  }
}



#' pass selection into fsi
to_fsi_selected <- function(){
  fsi_init()
  rstudioapi::getActiveDocumentContext() -> selected_text
  to_fsi(trimws(selected_text$selection[[1]]$text))
}

#' pass all text into fsi
to_fsi_all <- function(){
  fsi_init()
  rstudioapi::getActiveDocumentContext() -> selected_text
  print(selected_text$contents)
  to_fsi(trimws(selected_text$contents))
}

