vectorize = function(data.mat, half=F, colname=NULL, prefix=NULL, lower = F, return.as.df=FALSE){
  # vectorizing matrix
  
  # colname : if using df, use its colname as 'colname'
  
  
  # is the matrix a square matrix?
  if(nrow(data.mat)!=ncol(data.mat)){
    stop("The matrix is not a square matrix!")
  }
  #=============================================================================
  data.vec = c()
  col_names = c()
  # half = F : basic vectorize =================================================
  if(!half){
    for(i in 1:ncol(data.mat)){
      data.vec = c(data.vec, data.mat[,i])
    }
    
    if(return.as.df){
      data.df = data.frame(data.vec)
      if(!is.null(colname)){
        names(data.df) = colname  
      }
      return(data.df)
    }else{
      return(data.vec)
    }
  # half = T : half-vectorize ==================================================
    # 대각원소 제외
  }else{
    # 1) extract 'lower' triangle elements #####################################
    if(lower){
      for(r in 2:ncol(data.mat)){
        for(c in 1:(r-1)){
          data.vec = c(data.vec, data.mat[r,c])
          # data.mat의 행의 수에 맞춰서 r의 자리수를 조정 -> 3자리수이면 001
          r_fitted = fit_length(r, fit.num = nrow(data.mat) %>% nchar)
          c_fitted = fit_length(c, fit.num = nrow(data.mat) %>% nchar)
          # 해당 자릿수를 열의 이름으로 설정
          col_names = c(col_names, paste(c_fitted, r_fitted, sep="-"))
        }
      }
    # 2) extract 'upper' triangle elements #####################################
    }else{
      for(c in 2:ncol(data.mat)){
        for(r in 1:(c-1)){
          data.vec = c(data.vec, data.mat[r,c])
          r_fitted = fit_length(r, fit.num = nrow(data.mat) %>% nchar)
          c_fitted = fit_length(c, fit.num = nrow(data.mat) %>% nchar)
          col_names = c(col_names, paste(c_fitted, r_fitted, sep="-"))
        }
      }
    }
  }
  #=============================================================================
  # prefix="ROI_"
  if(!is.null(prefix)){
    col_names = paste(prefix, col_names, sep="")
  }
  
  # return results
  if(return.as.df){
    return(data.vec %>% as.data.frame)
  }else{
    names(data.vec) = col_names
    return(data.vec)
  }
}
