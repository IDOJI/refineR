filter_good = function(data.df, which.col.list, what.order.list){
  # 여러 조건을 비교해서 가장 최상의 조건을 만족하는 1행만 추출
  # 원소 개수가 다르면 경고
  if(length(which.col.list)!=length(what.order.list)){
    text1 = crayon::blue("which.col.list")
    text2 = crayon::blue("what.order.list")
    text3 = paste("Different lengths of", text1, "and", text2)
    stop(text3)
  }else{
    # col.list의 원소 개수 만큼 반복
    for(i in 1:length(which.col.list)){

      ith.col = col_extractor(data.df = data.df, including = which.col.list[[i]])
      ith.order = what.order.list[[i]]

      # order에 입력된 원소들과 비교 가능하도록 class 보정
      if(class(ith.col)!= class(ith.order)){
        if(class(ith.col)=="numeric") ith.order = as.numeric(ith.order)
        else if(class(ith.col)=="integer") ith.order = as.integer(ith.order)
        else if(class(ith.col)=="character") ith.order = as.character(ith.order)
      }

      selected.list = list()
      nrow.selected = c() # 선택된 데이터의 행의 수
      for(which.order in 1:length(ith.order)){
        # order의 기준 순서로 리스트에 데이터 입력
        selected.list[[which.order]] = data.df %>% filter(ith.col == ith.order[which.order])
        nrow.selected = c(nrow.selected, nrow(selected.list[[which.order]]))
      }
      # 행의 수가 1개 이상인 경우 중에 최상위 데이터만 선택
      which.best = which(nrow.selected > 0)[1]
      data.df = selected.list[[which.best]]
    }
    return(data.df)
  }
}
