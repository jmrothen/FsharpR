#' install dotnet via shell
#'
#'
moveGrammarFileToRStudio <- function(grammarFileName) {
  # Get the path of the RStudio application directory
  rstudioDir <- system.file("RStudio", package = "RStudio")

  # Check if the RStudio application directory is found
  if (identical(rstudioDir, "")) {
    stop("RStudio application directory not found.")
  }

  # Set the destination directory for grammar files
  grammarDir <- file.path(rstudioDir, "www", "grammars")

  # Create the destination directory if it doesn't exist
  if (!dir.exists(grammarDir)) {
    dir.create(grammarDir, recursive = TRUE)
  }

  # Get the source path of the grammar file in the 'inst' directory of the package
  sourcePath <- system.file("inst", grammarFileName, package = "FsharpR")

  # Check if the grammar file exists
  if (!file.exists(sourcePath)) {
    stop("Grammar file '", grammarFileName, "' not found.")
  }

  # Set the destination path for the grammar file in the RStudio directory
  destPath <- file.path(grammarDir, grammarFileName)

  # Copy the grammar file to the destination directory
  file.copy(sourcePath, destPath, overwrite = TRUE)

  # Print a success message
  cat("Grammar file '", grammarFileName, "' copied to RStudio directory successfully.\n")
}


# prepare FS grammar
fs_prep <- function(){
  jsons <- c('fsharp','fsharp.fsx','fsharp.fsl','fsharp.fsi')
  for(i in jsons){
    moveGrammarFileToRStudio(i)
  }
  print('All good to go, make sure to reset your Rstudio!')
}


# fs_prep()
