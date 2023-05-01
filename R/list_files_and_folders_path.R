list_files_and_folders_path = function(path, recursive = T, pattern_exclude = "\\.dcm$", only_folders = F){
  # Define the directory path
  dir_path = path

  # List the files and folders within the specified directory
  files_and_folders = fs::dir_ls(dir_path, recurse = recursive)


  # Filtering by pattern_exclude
  if(!is.null(pattern_exclude)){
    filtered_files_and_folders = files_and_folders[grep(pattern_exclude, files_and_folders, invert = TRUE)]
  }else{
    filtered_files_and_folders = files_and_folders
  }



  # Filter the list to keep only folders
  if(only_folders){
    filtered_files_and_folders = filtered_files_and_folders[dir_info(files_and_folders)$is_dir]
  }
  return(filtered_files_and_folders)
}
