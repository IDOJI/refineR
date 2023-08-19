path_clip = function(){
  Former_path = getwd()

  install_packages("clipr", T)

  setwd(read_clip())
  Later_path = getwd()

  setwd(Former_path)
  return(Later_path)
}
