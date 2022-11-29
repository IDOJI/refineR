as.na = function(data.df, which.col = NULL, blank = T, minus = T){
  ## 공백들 NA 처리

  if(is.null(which.col)){
    which.col = names(data.df)
  }

  for(i in 1:length(which.col)){
    # i=1
    ith_col = data.df[,which.col[i]] %>% unlist
    if(class(ith_col)=="character"){
      na = "NA"
    }else if(class(ith_col)=="numeric"){
      na = NA
    }

    if(blank){
      ith_col[which(ith_col == " ")] = na
      ith_col[which(ith_col == "")] = na
    }
    if(minus){
      ith_col[which(ith_col == "-")] = na
    }

    data.df[,which.col[i]] = ith_col
  }# for
  return(data.df)
}
