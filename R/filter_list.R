filter_list = function(data.list, ID=NULL, col_1, cond_1, include_1, col_2, cond_2, include_2){
  # col1의 조건을 만족하는 행들 가운데
  # col2의 조건을 만족하는 행이 있는 경우
  # 리스트의 해당 원소를 추출한다.
  # data.list = selected_by_what.date.list
  # col_1 = "Series_Type"
  # cond_1 = "EPB"
  # inlcude_1 = T
  # col_2 = "Manufacturer"
  # cond_2 = Manufacturer[i]
  # include_2 = T

  result.list = lapply(data.list, ID, col_1, cond_1, include_1, col_2, cond_2, include_2, FUN=function(x, col_1=col_1, cond_1=cond_1, include_1=include_1, col_2=col_2, cond_2=cond_2, include_2=include_2, ID=ID){
    # x = data.list[[1]]
    if(is.logical(include_1)){
      selected_by_col_1 = x[x[,col_1]==cond_1,]
    }else{
      selected_by_col_1 = x[x[,col_1]!=cond_1,]
    }

    if(as.logical(include_2)){
      selected_by_col_2 = selected_by_col_1[selected_by_col_1[,col_2] == cond_2]
    }else{
      selected_by_col_2 = selected_by_col_1[selected_by_col_1[,col_2] != cond_2]
    }

    if(is.data.frame(selected_by_col_2)){
      if(nrow(selected_by_col_2)>0){
        if(!is.null(ID)){
          cat(selected_by_col_2[,ID][1], "is done !")
        }
        return(selected_by_col_2)
      }
    }
  })

  result.list = rm_list_null(result.list)
  return(result.list)
}
