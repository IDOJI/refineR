add_col = function(data.df, col.name, index.list, elements.list){
  # 하나의 열을 추가해서 특정 인덱스에 특정 원소를 추가
  if(length(index.list)!=length(elements.list)){
    stop("The lengths of both 'index.list' and 'elements.list' should be equal.")
  }else{
    new_col = rep(NA, nrow(data.df))
    data.df_new = cbind(data.df, new_col)
    names(data.df_new)[ncol(data.df_new)] = col.name

    for(i in 1:length(index.list)){
      ith_index = index.list[[i]]
      ith_elements = elements.list[[i]]

      if(length(ith_elements)==1){
        ith_elements = rep(ith_elements, length(ith_index))
      }

      if(length(ith_elements)!=length(ith_index)){
        stop("The lengths of 'ith_elements' and 'ith_index' are different.")
      }else{
        data.df_new[ith_index, ncol(data.df_new)] = ith_elements
        if(i==length(index.list)){
          return(data.df_new)
        }
      }
    }
  }
}
