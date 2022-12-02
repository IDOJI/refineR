remove_files_fast = function(Source.Folder){
  # robocopy c:\empty c:\test /MIR
  dir.create("C:/EMPTY_FOLDER_FOR_REMOVING", showWarnings = F)

  Source.Folder = "D:/ADNI/ADNI_RS.fMRI"
  cmd = paste("robocopy",
              "C:/EMPTY_FOLDER_FOR_REMOVING",                     # Empty Folder
              Source.Folder,    # Source Folder
              "/MIR",
              sep = " ")

  system(cmd) %>% invisible()


  file.remove("C:/EMPTY_FOLDER_FOR_REMOVING") %>% suppressWarnings()
  unlink("C:/EMPTY_FOLDER_FOR_REMOVING", recursive=T)

  cat("\n",crayon::green("Removing files is done!"),"\n")
}

