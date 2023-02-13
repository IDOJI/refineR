copy_files_fast = function(Source.Folder, Destination.Folder, move=F, overwrite=F){
  cat("\n", crayon::yellow("The tasks are currently being done ...."),"\n")

  if(move && overwrite){
    cmd = paste("robocopy",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MOVE /MT:20 /is /it",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Moving files is done!"),"\n")
  }else if(move && !overwrite){
    cmd = paste("robocopy",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MOVE /MT:20 /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Moving files is done!"),"\n")
  }else if(!move){
    cmd = paste("robocopy",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MT:20 /njh /njs /ndl /nc /ns /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Copying files is done!"),"\n")
  }
}



copy_files_fast_multi = function(Source.Folders, Destination.Folder, move=F, overwrite=F){
  lapply(Source.Folders, FUN=function(ith_folder, ...){
    copy_files_fast(Source.Folder = ith_folder, Destination.Folder, move, overwrite)
  })
}


move_files = function(Source.files.path , Destination.Folder){
  dir.create(Destination.Folder, showWarnings = F)
  lapply(Source.files.path, FUN=function(ith_file_path, ...){
    file.copy(from = ith_file_path, to = Destination.Folder, overwrite = T)
    file.remove(ith_file_path)
  })
}





