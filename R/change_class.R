change_class = function(df, cols, what_class = c("numeric", "integer", "factor", "logical", "complex", "raw", "Date"), strict=TRUE) {
  # class
  what_class = tolower(what_class)
    
  # new df
  new_df = df %>% as.data.frame
  
  # change class for each col
  for(ith_col in cols){
    new_df[[ith_col]] = as(new_df[[ith_col]], what_class, strict)
  }
  
  
  # 변환된 데이터 프레임 반환
  return(new_df)
}

