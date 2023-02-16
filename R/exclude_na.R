exclude_na = function(data=c("vector", "data.frame"), which.col=NULL){
  if(is.null(which.col) && is.vector(data)){
    return(data[!is.na(data)])
  }else if(is.data.frame(data)){
    if(is.null(which.col)){
      which.col = 1:ncol(data)
    }
    n_nrow = nrow(data)
    excluded_rows = c()
    for(i in 1:length(which.col)){
      # i=4
      ith_col = data[,which.col[i]] %>% unlist
      excluded_rows = c(excluded_rows, which(is.na(ith_col))) %>% unique
    }
    if(length(excluded_rows)==0){
      cat(crayon::blue("No NAs were found."))
      return(data)
    }else{
      return(list(Included=data[-excluded_rows,], Excluded=data[excluded_rows,], Excluded_index=excluded_rows))
    }
  }
}
