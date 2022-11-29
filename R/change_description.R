change_description = function(data.df, which.col, from, to){
  selected.col = data.df[,which.col]
  selected.col[selected.col==from] = to
  data.df[,which.col] = selected.col

  return(data.df)
}

# ## 특정 원소들 다른 특정 원소로 바꾸기
# if(is.numeric(which.col) & length(which.col)==1){
#
# }else if(is.character(which.col) & length(which.col)>0){
#   selected.col = col_extractor(data.df = data.df, including = which.col, exact=exact)
#   if(!dim(selected.col) %>% is.null){
#     stop("The selected columns are more than one.")
#   }
#   selected.col[selected.col==from] = to
#   data.df[,which_col(data.df, which.col, exact)] = selected.col
# }
