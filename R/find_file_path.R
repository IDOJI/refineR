find_file_path = function(path, pattern, include=T, exact=F, ignore.case=T, return.path=T){
  # path = rth_path
  # pattern = c("MP", "RAGE")
  files = list.files(path) %>% as.data.frame
  which.file = filter_by(data.df = files, which.col = 1, condition = pattern, exact.condition = exact, include = include, ignore.case = ignore.case, as.index=T)
  
  if(return.path){
    selected_files_path.list = list()
    for(i in 1:length(which.file)){
      selected_files_path.list[[i]] = paste(path, files[which.file[i],], sep="") %>% path_tail_slash()
    }
    selected_files_path.vec = selected_files_path.list %>% unlist
    return(selected_files_path.vec)
  }else{
    return(files[which.file,])
  }  
}



