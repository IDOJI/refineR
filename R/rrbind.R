rrbind = function(X,Y){
  ncol_x = ncol(X)
  ncol_y = ncol(Y)
  if(ncol_x > ncol_y){
    mat = matrix(NA, nrow(Y), ncol_x - ncol_y) %>% as.data.frame
    Y_new = cbind(Y, mat)
    names(Y_new) = names(X)
    if(names(Y_new) %>% is.null){
      names(X) = names(Y_new) = as.character(1:ncol(Y_new))
    }
    return(rbind(X, Y_new))
  }else if(ncol_x < ncol_y){
    mat = matrix(NA, nrow(X), ncol_y - ncol_x) %>% as.data.frame
    X_new = cbind(X, mat)
    names(X_new) = names(Y)
    if(names(X_new) %>% is.null){
      names(Y) = names(X_new) = as.character(1:ncol(X_new))
    }
    return(rbind(X_new, Y))
  }else{
    return(rbind(X,Y))
  }
}
