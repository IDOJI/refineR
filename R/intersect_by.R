intersect_by = function(data.list, by){
  ## df들이 담긴 데이터 리스트를 by변수에 의한 교집합에 해당하는 데이터들로 반환
  for(i in 1:length(data.list)){
    if(i==1){
      ith_col = list(col_extractor(data.list[[i]], by))
      which.intersect = ith_col[[i]]
    }else{
      ith_col[[i]] = col_extractor(data.list[[i]], by)
      which.intersect = intersect(which.intersect, ith_col[[i]])
    }
  }
  data.list_new = list()
  for(k in 1:length(data.list)){
    data.list_new[[k]] = filter(data.list[[k]], ith_col[[k]] %in% which.intersect)
  }
  return(data.list_new)
}



