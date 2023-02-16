merge_by_ID = function(df1, df2, by, name.x="", name.y="", messaging=F){
  # ID는 단 하나의 값을 갖는 경우
  # df1 = ith_search_imageID
  # df2 = ith_QC_imageID
  # by = "Image_ID"
  # name.x="_Search"
  # name.y="_QC"

  # merge_by_ID(ith_search_imageID, ith_QC_imageID, by = "Image_ID", name.x = "_Search", name.y = "_QC", messaging = F)
  # df1 = ith_search_imageID
  # df2 = ith_QC_imageID
  # by = "Image_ID"
  # name.x = "_Search"
  # name.y = "_QC"

  ID1 = col_extractor(df1, by, exact=T)
  ID2 = col_extractor(df2, by, exact=T)
  if(is.data.frame(ID1) || is.data.frame(ID2)){
    stop("More than two columns are selected. Change the argument 'by'")
  }

  ## ID more than one
  names_1 = names(table(ID1))
  result_1 = table(ID1) %>% as.vector
  more_than_one_1 = which(result_1 > 1)
  if(length(more_than_one_1)>1){
    which_more_than_one_ID_1 = names_1[more_than_one_1]
  }else{
    which_more_than_one_ID_1 = NULL
  }

  names_2 = names(table(ID2))
  result_2 = table(ID2) %>% as.vector
  more_than_one_2 = which(result_2 > 1)
  if(length(more_than_one_2)>1){
    which_more_than_one_ID_2 = names_2[more_than_one_2]
  }else{
    which_more_than_one_ID_2 = NULL
  }


  ### 선택된 중복 ID가 있는 경우 따로 제외
  results.list  = list(NULL, NULL, NULL)
  if(!is.null(which_more_than_one_ID_1)){
    results.list[[2]] = filter_by(df1, by, condition=as.list(which_more_than_one_ID_1), exact.condition = T, include = T)
    df1_2 = filter_by(df1, by, condition=as.list(which_more_than_one_ID_1), exact.condition = T, include = F)
  }else{
    df1_2 = df1
  }

  if(!is.null(which_more_than_one_ID_2)){
    results.list[[3]] = filter_by(df2, by, condition=as.list(which_more_than_one_ID_2), exact.condition = T, include = T)
    df2_2 = filter_by(df2, by, condition=as.list(which_more_than_one_ID_2), exact.condition = T, include = F)
  }else{
    df2_2 = df2
  }


  ### 행이 중복인지 확인 =======================================================
  if(!is.null(results.list[[2]])){
    df1_chk = results.list[[2]]
    unique_ID = col_extractor(df1_chk, including = by, exact=T) %>% unique
    # uniqueID만큼 반복
    for(i in 1:length(unique_ID)){
      ith_ID = unique_ID[i]
      ith_data = filter_by(df1_chk, which.col = by, col.exact = T, condition=ith_ID, exact.condition = T, include = T)

      ith_results = list()
      for(r in 1:nrow(ith_data)){
        if(r < nrow(ith_data)){
          ith_results[[r]] = all.equal(ith_data[r,], ith_data[r+1,])
        }
      }
      if(unlist(ith_results) %>% length == nrow(ith_data)-1){
        df1_chk = filter_by(df1_chk, which.col = by, col.exact = T, condition = ith_ID, exact.condition = T, include = F)
        df1_2 = rbind(df1_2, ith_data[1,])
      }
    }
    results.list[[2]] = df1_chk
  }
  if(!is.null(results.list[[3]])){
    df2_chk = results.list[[3]]
    unique_ID = col_extractor(df2_chk, including = by, exact=T) %>% unique
    # uniqueID만큼 반복
    for(i in 1:length(unique_ID)){
      ith_ID = unique_ID[i]
      ith_data = filter_by(df2_chk, which.col = by, col.exact = T, condition=ith_ID, exact.condition = T, include = T)

      ith_results = list()
      for(r in 1:nrow(ith_data)){
        if(r < nrow(ith_data)){
          ith_results[[r]] = all.equal(ith_data[r,], ith_data[r+1,])
        }
      }
      if(unlist(ith_results) %>% length == nrow(ith_data)-1){
        df2_chk = filter_by(df2_chk, which.col = by, col.exact = T, condition = ith_ID, exact.condition = T, include = F)
        df2_2 = rbind(df2_2, ith_data[1,])
      }
    }
    results.list[[3]] = df2_chk
  }


  ##############################################################################
  ### merge
  merged.df = merge(df1_2, df2_2, by=by)

  ### .x, .y 열 비교 후 같은 열 지우기
  same_colnames = intersect(names(df1_2), names(df2_2))
  same_colnames_without_by = same_colnames[same_colnames!=by]
  if(length(same_colnames_without_by)>0){
    for(i in 1:length(same_colnames_without_by)){
      ith_colname = same_colnames_without_by[i]
      merged.df = rm_same_col(merged.df, paste(ith_colname, "x", sep="."), paste(ith_colname, "y", sep="."), col.name = ith_colname)
    }

    ### 열들 모으기
    x = paste(same_colnames_without_by, "x", sep=".")
    y = paste(same_colnames_without_by, "y", sep=".")
    xy_colnames = c(same_colnames_without_by, x, y)
    xy_colnames = xy_colnames[xy_colnames %in% names(merged.df)]
    for(i in 1:length(xy_colnames)){
      merged.df = gather_col(merged.df, xy_colnames[i], where=1)
    }

    ### .x, .y 이름 변경
    x_in = x[x %in% names(merged.df)]
    x_in_split = substr(x_in, start = 1, stop = nchar(x_in)-2)
    x_new = paste(x_in_split, name.x, sep="")
    y_in = y[y %in% names(merged.df)]
    y_in_split = substr(y_in, start = 1, stop = nchar(y_in)-2)
    y_new = paste(y_in_split, name.y, sep="")

    for(i in 1:length(x_new)){
      merged.df = change_colnames(merged.df, from=x_in[i], to=x_new[i])
    }
    for(i in 1:length(y_new)){
      merged.df = change_colnames(merged.df, from=y_in[i], to=y_new[i])
    }
  }

  ### gather col 'by'
  merged.df = gather_col(merged.df, by, where=1)


  ### 데이터 저장
  results.list[[1]] = merged.df


  ### rm null
  results.list = rm_list_null(results.list)
  if(length(results.list)==1){
    if(messaging){
      text = paste("\n", "Merged data is returned as a dataframe.", "\n")
      cat(crayon::blue(text))
    }
    return(results.list[[1]])
  }else{
    if(messaging){
      text = paste("\n", "Merged data is returned as a list.", "\n")
      cat(crayon::blue(text))
    }
    return(results.list)
  }
}
