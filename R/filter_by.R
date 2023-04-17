filter_by = function(x, including.words, any_including.words=T, excluding.words=NULL, any_excluding.words=T, which.col=NULL, ignore.case=F, as.ind=F){
   ## data.frame or vector?
  if(is.null(which.col)){
    selected_col = x
  }else{
    selected_col = x[,which.col]
  }
  selected_x = selected_col
  ##############################################################################
  filter_by_extract.index = function(x, words, any, ignore.case){
    ind = lapply(words, FUN=function(ith_word){
      grep(pattern = ith_word, x, ignore.case)
    })


    if(any){
      ind_intersect = ind %>% unlist %>% unique
    }else{
      for(k in 1:length(ind)){
        if(k==1){
          ind_intersect = ind[[k]]
        }else{
          ind_intersect = intersect(ind_intersect, ind[[k]])
        }
      }
    }
    return(ind_intersect)
  }
  ### selecting including words =============================================================
  # including.words 중에 하나라도 포함하는 원소를 추출
  ind_including = filter_by_extract.index(x = selected_x, words = including.words, any = any_including.words, ignore.case)
  if(!is.null(excluding.words)){
    ind_excluding = filter_by_extract.index(x = selected_x, words = excluding.words, any = any_excluding.words, ignore.case)
    ind = ind_including[!ind_including %in% ind_excluding]
  }else{
    ind = ind_including
  }

  if(as.ind){
    return(ind)
  }else{
    return(selected_x[ind])
  }
}
