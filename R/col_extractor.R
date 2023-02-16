col_extractor = function(data.df, including=NULL, exact=F, excluding=NULL, ignore.case = T, as.df = F){
  index.in = NULL
  index.ex = NULL

  ### extract col names
  col.names = names(data.df)

  if(is.null(including)&&is.null(excluding)){
    stop("The argument either 'including' or 'excluding' should have character input.")
  }

  if(!is.null(including)){
    if(exact){
      if(length(including) == 1){
        index.in = which(col.names == including)
      }else{
        stop("If 'exact' is TRUE, the length of 'including' should be the same one.")
      }
    }else{
      for(i in 1:length(including)){
        if(i==1){
          index.in = grep(pattern =including[i], x = col.names, ignore.case = ignore.case)
        }else{
          index.in = intersect(index.in, grep(pattern = including[i], x = col.names, ignore.case = ignore.case))
        }
      }
    }
  }


  if(!is.null(excluding)){
    for(j in 1:length(excluding)){
      if(j==1){
        index.ex = grep(pattern = excluding[j], x = col.names, ignore.case = ignore.case)
      }else{
        index.ex = intersect(index.ex, grep(pattern = excluding[j], x = col.names, ignore.case = ignore.case))
      }
    }
  }


  ### select columns from data.df
  if(is.null(index.in) && is.null.(index.ex)){
    stop("There is no column satisfying the conditions.")
  }else if(!is.null(index.in) && !is.null(index.ex)){
    index.in_new = index.in[!index.in %in% index.ex]
    selected.df = data.df[index.in_new]
    names(selected.df) = col.names[index.in_new]
  }else if(!is.null(index.in) && is.null(index.ex)){
    selected.df = data.df[index.in]
  }else if(is.null(index.in) && !is.null(index.ex)){
    selected.df = data.df[-index.ex]
    names(selected.df) = col.names[-index.ex]
  }

  if(as.df){
    return(selected.df)
  }else{
    if(ncol(selected.df)==0){
      stop("There is no column satisfying the conditions.")
    }else if(ncol(selected.df)==1){
      return(selected.df[,1] %>% unlist)
    }else{
      text1 = c("The selected colums are more than one.")
      text2 = c("A data.frame is returned.")
      cat(crayon::green(paste(text1, "\n", text2, "\n",sep="")))
      return(selected.df)
    }
  }# else : as.df==F
}
