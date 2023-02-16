gather_col = function(data.df, col.words, exact=T, ignore.case=T, where=NULL){

  # # 특정 키워드를 가진 변수들 한 곳에 몰아 주는 함수
  col_names = names(data.df)

  selected_col = which_col(data.df,
                           col.words,
                           exact = exact,
                           ignore.case = ignore.case,
                           as.col.names = F)

  selected.df = data.df[,selected_col] %>% data.frame
  names(selected.df) = names(data.df)[selected_col]
  data.df[,selected_col] = NULL

  # 선택된 col들 위치
  if(where==1){
    data.df = cbind(selected.df, data.df)
  }else if(where==length(col_names)){
    data.df=  cbind(data.df, selected.df)
  }else{
    front.df = data.df[seq(1, where-1, 1)]
    back.df = data.df[seq(where, ncol(data.df))]
    data.df = cbind(front.df, selected.df, back.df)
  }
  return(data.df)
}
