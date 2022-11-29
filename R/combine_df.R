combine_df = function(df1, df2, by.row=T){
  ## 열이름 기준으로 두 데이터 프레임 합치기
  df1_col = names(df1)
  df2_col = names(df2)

  col_union = union(df1_col, df2_col)
  col_intersect = intersect(df1_col, df2_col)
  col_setdiff = setdiff(col_union, col_intersect)

  ## 공통 열이름으로 합치기====================================================
  intersect.list = lapply(col_intersect, df1, df2, FUN=function(x, ...){
    df = data.frame(c(df1[,x],df2[,x]))
    names(df) = x
    return(df)
  })
  intersect.df = do.call(cbind, intersect.list)

  ## 공통되지 않은 이름의 열들 합치기===========================================
  # df1
  only_in_df2 = setdiff(df2_col, col_intersect)
  df1_2 = matrix(NA, nrow(df1), length(only_in_df2)) %>% as.data.frame
  names(df1_2) = only_in_df2
  df1_new = cbind(df1, df1_2)

  # df2
  only_in_df1 = setdiff(df1_col, col_intersect)
  df2_2 = matrix(NA, nrow(df2), length(only_in_df1)) %>% as.data.frame
  names(df2_2) = only_in_df1
  df2_new = cbind(df2, df2_2)

  return(cbind(rbind(df1_new, df2_new), intersect.df))
}
