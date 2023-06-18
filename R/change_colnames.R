change_colnames = function(data.df, from, to, exact.from=T, ignore.case.from=T){
  ### 열 이름 바꾸기
  # from은 단편적으로 설정해도 됨.
  colnames = names(data.df)

  if(exact.from){
    names(data.df)[which(colnames==from)] = to
  }else{
    selected_col = which_col(data.df = data.df, which.col = from, exact = exact.from, ignore.case = ignore.case.from, as.col.names = F)
    names(data.df)[selected_col] = to
  }
  return(data.df)
}
