dates_having = function(data.list, date.col, criterion.col, having){
  # data.list = data_more_than_one_row.list
  # date.col = "Study.Date"
  # criterion.col = "Series_Type"
  # having = c("EPB","MT1")

  result.list = lapply(data.list, date.col, criterion.col, having, FUN=function(x, date.col=date.col, criterion.col=criterion.col, having=having){
    # x = data.list[[1]]
    ### date column
    if(!date.col %in% names(data.list[[1]])){
      stop("Check the input of 'date.col'. There is no such a column.")
    }

    ### unique date
    unique_date = col_extractor(data.df = x, including = date.col, exact = T) %>% unique
    x_selected.list = list()

    for(d in 1:length(unique_date)){
      dth = x[x[,date.col]==unique_date[d],]
      if(sum(having %in% dth[,criterion.col])==length(having)){
        x_selected.list[[d]] = dth
      }
    }

    if(length(x_selected.list)!=0){
      x_selected.list = rm_list_null(x_selected.list)
      x_selected.df = do.call(rbind, x_selected.list)
      return(x_selected.df)
    }
  })# lapply

  result_removed_null.list = rm_list_null(result.list)
  return(result_removed_null.list)
}
