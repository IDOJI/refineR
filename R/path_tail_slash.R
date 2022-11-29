path_tail_slash = function(path){
  for(i in 1:length(path)){
    ith_path = path[i]
    if(substr(ith_path, start=nchar(ith_path), stop=nchar(ith_path)) != "/"){
      path[i] = paste(ith_path, "/", sep="")
    }
  }
  return(path)
}
