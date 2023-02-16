rm_dup_cols = function(data.df){
  return(data.df[!duplicated(as.list(data.df))])
}
