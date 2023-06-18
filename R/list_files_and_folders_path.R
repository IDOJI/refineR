list_files_and_folders_path = function(path, recursive = T, pattern_exclude = NULL, only_folders = F, full.path=F){
  # pattern_exclude =  "\\.dcm$"
  #=============================================================================
  # path List the files and folders within the specified directory
  #=============================================================================
  if(only_folders){
    selected_path = fs::dir_ls(path, recurse = recursive, type = "directory")
  }else{
    selected_path = fs::dir_ls(path, recurse = recursive)
  }




  #=============================================================================
  # only files or folders names?
  #=============================================================================
  if(!full.path){
    selected = fs::path_file(selected_path)
  }else{
    selected = selected_path
  }




  #=============================================================================
  # Filtering by pattern_exclude
  #=============================================================================
  if(!is.null(pattern_exclude)){
    filtered_selected = selected[grep(pattern_exclude, selected, invert = TRUE)]
  }else{
    filtered_selected = selected
  }



  return(filtered_selected)
}

