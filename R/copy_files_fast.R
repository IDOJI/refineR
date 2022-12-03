copy_files_fast = function(Source.Folder, Destination.Folder, move=F, overwrite=T){
  cat("\n", crayon::yellow("The tasks are currently being done ...."),"\n")

  if(move && overwrite){
    cmd = paste("robocopy",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MOVE /MT:20 /IS /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Moviing files is done!"),"\n")
  }else if(move && !overwrite){
    cmd = paste("robocopy",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MOVE /MT:20 /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Moviing files is done!"),"\n")
  }else if(!move && overwrite){
    cmd = paste("robocopy",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MT:20 /njh /njs /ndl /nc /ns /is /it /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Copying files is done!"),"\n")
  }else if(!move && !overwrite){
    cmd = paste("robocopy",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MT:20 /njh /njs /ndl /nc /ns /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Copying files is done!"),"\n")
  }
}
