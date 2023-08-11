install_packages = function(packages, load=TRUE) {
  # load : load the packages after installation?

  for(pkg in packages) {
    if (!require(pkg, character.only = TRUE)) {
      install.packages(pkg)
    }

    if(load){
      library(pkg, character.only = TRUE)
    }
  }
}






