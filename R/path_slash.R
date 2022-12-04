path_slash = function(){
  path = readline()
  return(gsub("\\\\", "/", path))
}
