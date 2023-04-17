rm_same_col = function(data.df, col1, col2, col.name=NULL, messaging=F){
  # col1과 col2의 원소가 동일하면 하나의 열을 없앰
  n_row = nrow(data.df)
  col_1 = data.df[,col1] %>% unlist
  col_2 = data.df[,col2] %>% unlist

  if(sum(col_1==col_2)==n_row){
    data.df[which_col(data.df, col1)] = NULL
    if(! col.name %>% is.null){
      names(data.df)[which_col(data.df, col2)] = col.name
      if(messaging){
        cat(crayon::blue(paste("They are same. col1 is removed.", "\n" ,
                               "The column name has been changed to ",
                               crayon::magenta(col.name), ".", sep="")))
      }
    }else{
      if(messaging){
        cat(crayon::blue("They are same. col1 is removed."))
      }
    }
  }else{
    if(messaging){
      text = paste("\n", "There are different elements! The original data is returned.")
      cat(crayon::bgMagenta(text))
    }
  }
  return(data.df)
}
