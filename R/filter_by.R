filter_by = function(x, include=NULL, any_include=T, exact_include=T, exclude=NULL, any_exclude=T, exact_exclude = F, which.col=NULL, ignore.case=F, as.ind=F){
  # any_incldue = T : include 벡터에 있는 문자열을 하나라도 포함하는 경우의 인덱스
  # any_incldue = F : include 벡터에 있는 문자열을 모두 포함하는 경우의 인덱스
  #=============================================================================
  # Define a function
  #=============================================================================
  extract_index = function(x, words, any_words, exact, ignore.case){
    index.list = lapply(words, FUN=function(i, ...){
      if(exact){
        which(selected_x==i)
      }else{
        grep(i, selected_x, ignore.case)
      }
    })
    if(any_words){
      index = index.list %>% unlist %>% unique
    }else{
      for(k in 1:length(index)){
        if(k==1){
          index = index.list[[k]]
        }else{
          index = intersect(index, index.list[[k]])
        }
      }
    }
    return(index)
  }



  #=============================================================================
  # Input
  #=============================================================================
  if(is.null(which.col)){
    # Vector
    selected_x = x
  }else{
    # Data frame
    if(is.null(which.col) & is.data.frame(x) & ncol(x)!=1){
      stop("Since x is a df, 'which.col' argument need to be defined!")
    }else{
      if(ncol(x)==1){
        selected_x = x[,1]
      }else{
        selected_x = x[,which.col]
      }
    }
  }


  #=============================================================================
  # Include
  #=============================================================================
  if(!is.null(include)){
    index_include = extract_index(x = selected_x, words = include, any_words = any_include, exact = exact_include, ignore.case = ignore.case)
  }else{
    index_include = NULL
  }



  #=============================================================================
  # Exclude
  #=============================================================================
  if(!is.null(exclude)){
    index_exclude = extract_index(x = selected_x, words = exclude, any_words = any_exclude, exact = exact_exclude, ignore.case = ignore.case)
  }else{
    index_exclude = NULL
  }




  #=============================================================================
  # Include & Exclude
  #=============================================================================
    # include, exclude 둘 다 있으면 exclude를 제외함
  if(!is.null(index_include) & !is.null(index_exclude)){
    index = setdiff(index_include, index_exclude)
    # include만 있으면 include만 내보냄
  }else if(!is.null(index_include) & is.null(index_exclude)){
    index = index_include
    # exclude만 있으면 exclude만 내보냄
  }else if(is.null(index_include) & !is.null(index_exclude)){
    index = index_reverse(1:length(selected_x), index_exclude)
  }else{
    #
  }






  #=============================================================================
  # as index?
  #=============================================================================
  if(as.ind){
    return(index)
  }else{
    return(selected_x[index])
  }
}
