# ccbind = function(X,Y){
#   nx = nrow(X)
#   ny = nrow(Y)
#   if(nx > ny){
#     nrow = nx - ny
#     col_names = names(Y)
#     df_1 = X
#     df_2.1 = Y
#     df_2.2 = matrix(NA, nrow,ncol(df_2.1)) %>% as.data.frame;names(df_2.2)=col_names
#     return(cbind(df_1, rbind(df_2.1, df_2.2)))
#   }else if(nx < ny){
#     nrow = ny - nx
#     col_names = names(X)
#     df_1 = Y
#     df_2.1 = X
#     df_2.2 = matrix(NA, nrow,ncol(df_2.1)) %>% as.data.frame;names(df_2.2)=col_names
#     return(cbind(rbind(df_2.1, df_2.2), df_1))
#   }else{
#     return(cbind(X,Y))
#   }
# }
ccbind <- function(X, Y) {
  # Calculate the row difference
  nx <- nrow(X)
  ny <- nrow(Y)
  
  # Create a vector of unique column names for Y based on X and Y names
  new_Y_names <- make.unique(c(names(X), names(Y)))[(length(names(X)) + 1):length(c(names(X), names(Y)))]
  
  # Assign unique names to Y
  names(Y) <- new_Y_names
  
  # Combine data frames with adjustments for differing row counts
  if (nx > ny) {
    nrow <- nx - ny
    df_1 <- X
    df_2.1 <- Y
    df_2.2 <- as.data.frame(matrix(NA, nrow, ncol(df_2.1)))
    names(df_2.2) <- names(df_2.1)
    return(cbind(df_1, rbind(df_2.1, df_2.2)))
  } else if (nx < ny) {
    nrow <- ny - nx
    df_1 <- Y
    df_2.1 <- X
    df_2.2 <- as.data.frame(matrix(NA, nrow, ncol(df_2.1)))
    names(df_2.2) <- names(df_2.1)
    return(cbind(rbind(df_2.1, df_2.2), df_1))
  } else {
    return(cbind(X, Y))
  }
}
