ccbind = function(X,Y){
  nx = nrow(X)
  ny = nrow(Y)
  if(nx > ny){
    nrow = nx - ny
    col_names = names(Y)
    df_1 = X
    df_2.1 = Y
    df_2.2 = matrix(NA, nrow,ncol(df_2.1)) %>% as.data.frame;names(df_2.2)=col_names
    return(cbind(df_1, rbind(df_2.1, df_2.2)))
  }else if(nx < ny){
    nrow = ny - nx
    col_names = names(X)
    df_1 = Y
    df_2.1 = X
    df_2.2 = matrix(NA, nrow,ncol(df_2.1)) %>% as.data.frame;names(df_2.2)=col_names
    return(cbind(rbind(df_2.1, df_2.2), df_1))
  }else{
    return(cbind(X,Y))
  }
}
