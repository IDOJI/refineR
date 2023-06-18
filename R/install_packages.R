install_packages = function(package_names){
  sapply(package_names, FUN=function(x){
    if(! x %in% installed.packages()){
      install.packages(x)
    }
  })
}






