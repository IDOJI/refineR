recursive_path_until = function(path, until.depth=NULL, until.pattern=NULL, ignore.case=T){
  path = path_tail_slash(path)
  ## 현재 path에서 몇 번 째 더 안쪽에 있는 폴더까지의 경로로 바꿀 것인가
  if(!is.null(until.depth)){
    if(!is.numeric(until.depth)){
      stop("'unitl.depth' should be a natural number.")
    }else{
      file = list.files(path, recursive=T)[1]
      file_list = strsplit(file, split="/")[[1]]
      file_path_by_depth = paste(file_list[1:until.depth], collapse="/")

      new_path = paste(path, file_path_by_depth, sep="")
      return(new_path)
    }
  }else if(!is.null(until.pattern)){
    ## until.pattern을 포함하는 파일이 나올때까지 path를 변경
    while( grep(until.pattern, path) %>% sum == 0){
      path = dir(path, recursive=FALSE, full.names = TRUE, include.dirs = TRUE)
    }
    files_list = path
    selected_files_list = files_list[grep(until.pattern, files_list, ignore.case)]
    return(selected_files_list)
  }
}


