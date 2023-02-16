rm_dup_row = function(data.df, except=NULL, messaging=F){
  col_names = names(data.df)
  selected_col_names = col_names[!col_names %in% except]
  return(unique(data.df[,selected_col_names]))

}
