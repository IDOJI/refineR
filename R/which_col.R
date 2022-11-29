which_col = function(data.df, which.col, exact = F, ignore.case=T, as.col.names = F){

  # which.col에 열이름을 입력한 경우
  if(class(which.col)=="character"){
    for(n in 1:length(which.col)){
      # exact인 경우 정확히 해당 테스트와 일치하는 경우를 추출
      if(exact){
        if(n==1){
          col.intersect = which(names(data.df)  == which.col[n])
        }else{
          col.intersect = intersect(col.intersect, which(names(data.df) == which.col[n]))
        }
        # exact가 아닌 경우, 해당 텍스트를 일부로서 포함하는 열들을 추출
      }else{
        if(n==1){
          col.intersect = grep(which.col[n], names(data.df), ignore.case = ignore.case)
        }else{
          col.intersect = intersect(col.intersect, grep(pattern = which.col[n], x = names(data.df), ignore.case = ignore.case)) %>% as.numeric
        }
      }
    }

    if(length(col.intersect)==0){
      stop("There is no column satisfying this condition.")
    }

    if(as.col.names){
      return(names(data.df)[col.intersect])
    }else{
      return(col.intersect)
    }

    # 2)열의 위치 입력을 하는 경우
  }else if(class(which.col)=="integer"){
    return(names(data.df)[which.col])
  }
}


which_cols = function(data.df, which.cols){
  cols = names(data.df)
  ind = sapply(which.cols, cols, FUN=function(x, cols){
    return(which(cols==x))
  })
  return(ind)
}


