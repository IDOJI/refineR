install_package = function(pkg_names) {
  Results = sapply(pkg_names, function(ith_pkg_name){
    if(!require(ith_pkg_name, character.only = TRUE)){
      install.packages(ith_pkg_name, dependencies = TRUE)
      library(ith_pkg_name, character.only = TRUE)
    }
  })
}
