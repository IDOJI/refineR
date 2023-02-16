path_tail_slash = function(path, add_slash=TRUE){
  path_new = path
  if(add_slash){
    for(i in 1:length(path)){
      ith_path = path[i]
      if(substr(ith_path, start=nchar(ith_path), stop=nchar(ith_path)) != "/"){
        path_new[i] = paste(ith_path, "/", sep="")
      }
    }
  }else{
    for(i in 1:length(path)){
      ith_path = path[i]
      if(substr(ith_path, start=nchar(ith_path), stop=nchar(ith_path)) == "/"){
        path_new[i] = substr(ith_path, start=1, stop=nchar(ith_path)-1)
      }
    }
  }
  return(path_new)
}
