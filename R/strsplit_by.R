strsplit_by = function(x.vec, split_by=";", subsplit_by="="){
  # 데이터가 X1=123;X2=343;X3=333 으로 나뉘어져 있고
  # ;로 나누고
  # = 이하의 값을 값으로, X1을 이름으로 하는 경우

  split_combined.list = lapply(x.vec, FUN=function(x,...){
    # x = x.vec[1]
    x_split = strsplit(x, split=split_by)[[1]]
    combined.list = lapply(x_split, FUN=function(y, ...){
      # y=x_split[1]
      y_split = strsplit(y, split = subsplit_by)[[1]] %>% data.frame
      return(y_split)
    })
    combined.df = do.call(cbind, combined.list)
    names(combined.df) = combined.df[1,]
    combined.df = combined.df[2,]
    return(combined.df)
  })# lapply



  cols = sapply(split_combined.list, FUN=function(z){
    # z = split_combined.list[[1]]
    return(z %>% ncol)
  })
  cols_unique = unique(cols)



  return_by_same_ncols = function(x.list, n_col=8){
    results.list = lapply(x.list, FUN=function(x,..){
      # x = x.list[[1]]
      if(ncol(x)==n_col){
        return(x)
      }
    })
    return(do.call(rbind, results.list))
  }



  results.list = list()
  for(i in 1:length(cols_unique)){
    results.list[[i]] = return_by_same_ncols(split_combined.list, cols_unique[i])
  }
  return(results.list)
}


#===============================================================================
