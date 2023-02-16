index_reverse = function(data, index, return.elements=F){
  # 10개 중에 1번 10번 개체만 고르는 인덱스를
  # 2번~9번의 개체를 고르는 인덱스로 리버스
  if(is.data.frame(data)){
    row.num = 1:nrow(data)
    if(return.elements){
      return(data[!row.num %in% index, ])
    }else{
      return(which(!row.num %in% index))
    }
  }else if(is.vector(data)){
    ind.seq = 1:length(data)
    if(return.elements){
      return(data[ind.seq])
    }else{
      return(ind.seq[-index])
    }
  }
}
