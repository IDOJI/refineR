change_class = function(data.list, which.col, what.class){
  ## 클래스 바꾸기
  if(is.data.frame(data.list)){
    is.df = T
    data.list = list(data.list)
  }else{
    is.df = F
  }
  for(i in 1:length(data.list)){
    # i=1
    for(j in 1:length(which.col)){
      selected.col = data.list[[i]][,which.col[j]] %>% unlist
      if(what.class %in% c("character", "Character", "Char", "char", "c",  "C")){
        selected.col = as.character(selected.col) %>% suppressWarnings
        selected.col = stringr::str_trim(selected.col)
      }else if(what.class %in% c("numeric", "num", "Num", "Numeric", "N")){
        selected.col = as.numeric(selected.col) %>% suppressWarnings
      }else if(what.class %in% c("integer","Integer", "int", "Int", "I")){
        selected.col = as.integer(selected.col) %>% suppressWarnings
      }
      data.list[[i]][,which.col[j]] = selected.col
    }
  }
  if(is.df){
    return(data.list[[1]])
  }else{
    return(data.list)
  }
}
