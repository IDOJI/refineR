filter_by = function(x, including.words, any=F, excluding.words=NULL, which.col=NULL, ignore.case=F, as.ind=F){
  if(is.null(which.col)){
    selected_col = x
  }else{
    selected_col = x[,which.col]
  }



  ### selecting including words =============================================================
  selected_x = selected_col
  if(any){
    ind_including = lapply(including.words, FUN=function(ith_including, ...){
      ind = which(including.words == ith_including)
      grep(ith_including, selected_x, ignore.case) %>% return
    }) %>% unlist %>% unique
    selected_x  = selected_x[ind_including]
  }else{
    including_list = lapply(including.words, FUN=function(ith_including, ...){
      selected_x <<- selected_x[grep(ith_including, selected_x, ignore.case = ignore.case)]
    })
  }



  ### selecting excluding words ===============================================================
  excluding_list = lapply(excluding.words, FUN=function(jth_excluding, ...){
    selected_x <<- selected_x[-grep(jth_excluding, selected_x, ignore.case = ignore.case)]
  })


  ### index ===================================================================================
  ind = which(x %in% selected_x)

  if(as.ind){
    return(ind)
  }else{
    if(is.null(which.col)){
      return(selected_x)
    }else{
      return(x[ind,])
    }
  }

}
