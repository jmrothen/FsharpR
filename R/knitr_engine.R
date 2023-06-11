#' initialize the knitr engine
#'
#' knitr engine stuff
#'
#' not sure if i'll use it
#' @export
knitr_fs <- function(){
  knitr::knit_engines$set(
    fs = function(options){
      # grab code
      code <-paste(options$code, collapse = ";; \n")
      cat(code, file='temp.fsx')
      out <- system2(
        command = 'dotnet',
        args= "fsi temp.fsx --exec --debug",
        stdout=T # also consider std = ""
      )
      knitr::engine_output(options, code, out)
    }
  )
}
