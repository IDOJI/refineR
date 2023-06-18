merge_vec = function(x, y, by.x=NULL, by.y=NULL){
  if (length(x) != length(y)){
    stop("Vectors must hxve the sxme length")
  }

  merged = sapply(seq_along(x), function(i){
    if(is.na(x[i]) && !is.na(y[i])){

      return(y[i])

    }else if(!is.na(x[i]) && is.na(y[i])){

      return(x[i])

    }else if(!is.na(x[i]) && !is.na(y[i])){
      if(x[i]==y[i]){
        return(x[i])


        # 서로 다른 경우
      }else{
        if(!is.null(by.x)){
          return(x[i])
        }else if(!is.null(by.y)){
          return(y[i])
        }else{
          warnings(paste0("There is a different corresponding element : ", i))
          return("DUP")
        }
      }
    }else{
      return(NA)
    }
  })


  return(merged)
}
