filter_by = function(x, including.words, excluding.words=NULL, which.col=NULL, ignore.case=T, as.ind=F){
  if(is.null(which.col)){
    selected_col = x
  }else{
    selected_col = x[,which.col]
  }


  ### selecting including words
  for(i in 1:length(including.words)){
    if(i==1){
      ind = grep(including.words[i], selected_col, ignore.case)
    }else{
      ind = intersect(ind, grep(including.words[i], selected_col, ignore.case))
    }
  }


  ### selecting excluding words
  if(!is.null(excluding.words)){
    for(j in 1:length(excluding.words)){
      if(j==1){
        ind_exclude = grep(excluding.words[j], selected_col, ignore.case)
      }else{
        ind_exclude = intersect(ind_exclude, grep(excluding.words[j], selected_col, ignore.case))
      }

    }
    ind = setdiff(ind, ind_exclude)
  }




  if(as.ind){
    return(ind)
  }else{
    if(is.null(which.col)){
      return(x[ind])
    }else{
      return(x[ind,])
    }
  }

}


# filter_including.words = function(X, including.words, which.col=NULL, exact = F,  ignore.case = T, include=T, any=T, as.ind = F){
#   ## 벡터에 대해 including.words라는 특정 데이터/문자열을 포함한 벡터 원소들만 추출
#   # any = T : including.words에 포함된 문자열 하나라도 포함하는 경우
#   # any = F : including.words에 포함된 모든 문자열을 포함하는 경우만
#
#   if(!is.null(which.col)){
#     df = X
#     selected_col = df[,which.col] %>% unlist
#     row_seq = 1:nrow(df)
#   }else{
#     selected_col = X
#   }
#
#
#
#
#   ###############################################################################
#   # Selecting index
#   ###############################################################################
#   is_logical = is.logical(including.words) && is.logical(selected_col)
#   is_character = is.character(including.words) && is.character(selected_col)
#   is_numeric = is.numeric(including.words) && is.numeric(selected_col)
#   ### logical인 경우
#   if(is_logical && is.null(which.col)){
#     return(selected_col[selected_col])
#   ### Character인 경우
#   }else if(is_character || is_numeric){
#     index.list = list()
#
#     for(i in 1:length(including.words)){
#       # i=1
#       if(exact){
#         index.list[[i]] = which(selected_col==including.words[i])
#       }else{
#         index.list[[i]] = grep(including.words[i], selected_col, ignore.case)
#       }
#     }
#
#
#
#     if(any){
#       final_index = index.list %>% unlist %>% unique
#     }else{
#
#       for(i in 1:length(index.list)){
#         if(i==1){
#           final_indeX = index.list[[i]] %>% unlist
#         }else{
#           final_indeX = intersect(selected_indeX, index.list[[i]] %>% unlist)
#         }
#       }
#
#     }
#   }
#   if(!include){
#     final_index  = index_reverse(selected_col, final_index)
#   }
#
#
#
#   ###############################################################################
#   # returning results
#   ###############################################################################
#   if(length(final_index)==0){
#     warning("There is no data meeting the condition.")
#     if(!is.null(which.col)){
#       return(df)
#     }else{
#       return(selected_col)
#     }
#   }else{
#     if(as.ind){
#       return(final_index)
#     }else{
#       if(!is.null(which.col)){
#         return(df[final_index,])
#       }else{
#         return(selected_col[final_index])
#       }
#     }
#   }
# }
