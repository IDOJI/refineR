filter_good_mult =  function(data.df, which.col.list, what.order.list, exact.list=NULL, first.row = T){
  if(length(which.col.list)==length(what.order.list)){
    data.list = list()
    for(m in 1:length(which.col.list)){
      if(m==1){
        data.list[[m]] = filter_good(data.df, which.col.list[[m]], what.order.list[[m]])
      }else{
        data.list[[m]] = filter_good(data.list[[m-1]], which.col.list[[m]], what.order.list[[m]])
      }
    }
  }
  return(data.list[[length(which.col.list)]])
}
