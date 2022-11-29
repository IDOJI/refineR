df_to_list = function(data.df){
  data.list = list()
  for(i in 1:nrow(data.df)){
    data.list[[i]]  = data.df[i,]
  }
  return(data.list)
}

