rm_list_elements_by_nrow = function(data.list, nrow=1, as.df=F){
  # nrow=1인 data.list의 원소는 제거
  data_returned.list = lapply(data.list, nrow, FUN=function(x, n.row=nrow){
    if(nrow(x)==n.row){
      return(NULL)
    }else{
      return(x)
    }
  })
  data_rm_null.list = rm_list_null(data_returned.list)
  if(as.df){
    return(do.call(rbind, data_rm_null.list))
  }else{
    return(data_rm_null.list)
  }
}
