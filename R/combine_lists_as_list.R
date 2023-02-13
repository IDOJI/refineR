combine_lists_as_list = function(data.list){
  combined.list = list()
  for(k in 1:length(data.list)){
    combined.list = c(combined.list, data.list[[k]])
  }
  return(combined.list)
}
