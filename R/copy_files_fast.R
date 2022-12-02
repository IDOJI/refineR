copy_files_fast = function(Source.Folder, Destination.Folder, move=F){
  if(move){
    cmd = paste("Robocopy.exe",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/MOVE /MT:20 /njh /njs /ndl /nc /ns /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Mopying files is done!"),"\n")
  }else{
    cmd = paste("Robocopy.exe",
                Source.Folder,    # Source Folder
                Destination.Folder,    # Destination Folder
                "/E /MT:20 /njh /njs /ndl /nc /ns /Log:c:\\temp\\Robolog.log",
                sep = " ")
    system(cmd) %>% invisible()
    cat("\n",crayon::green("Copying files is done!"),"\n")
  }
}
