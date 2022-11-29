vec_partition = function(x, part.num){
  ## 벡터 나누기 함수 (리스트 출력)
  n = length(x)
  each_num = ceiling(n/part.num)

  x.list = list()
  for(k in 1:part.num){
    if(i==1){
      x.list[[k]] = x[1:each_num]
    }else{
      last_num = c(k*each_num)
      if(last_num < length(x)){
        x.list[[k]] = x[c((k-1)*each_num+1):last_num]
      }else{
        while(last_num > length(x)){
          last_num = last_num - 1
        }
        x.list[[k]] = x[c((k-1)*each_num+1):last_num]
      }
    }
  }
  return(x.list)
}

