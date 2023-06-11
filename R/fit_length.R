fit_length = function(x.vec, fit.num){
  if(class(x.vec)=="numeric"){
    x.vec = as.character(x.vec)
  }

  New_x.vec = sapply(x.vec, function(y){
    if(nchar(y)>fit.num){
      stop("fit.num should larger!")
    }else{
      while(nchar(y) != fit.num){
        y = paste("0", y, collapse = "", sep = "")
      }
      return(y)
    }
  })

  return(New_x.vec)
}



