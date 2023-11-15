basename_sans_ext = function(path){
  path %>% basename %>% tools::file_path_sans_ext()
}
