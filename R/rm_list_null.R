rm_list_null = function(data.list){
  # 리스트 원소들 중에 NULL 제외
  data.list[sapply(data.list, is.null)] = NULL
  return(data.list)
}



