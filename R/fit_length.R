fit_length = function(x.vec, fit.num){
  if(class(x.vec)=="numeric"){
    x.vec = as.character(x.vec)
  }

  for(j in 1:length(x.vec)){
    while(nchar(x.vec[j]) != fit.num){
      x.vec[j] = paste("0", x.vec[j], collapse = "", sep = "")
    }
  }
  return(x.vec)
}



