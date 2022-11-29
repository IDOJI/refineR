extract_by_var_type = function(data.df, type.vec=NULL){
  ### 데이터 프레임에 대해 입력한 변수 타입에 해당하는 열들만 추출
  # type.vec = c("numeric", "integer", "character", "logical)
  data_num.df = data.df[1]
  data_num_names = c()
  for(t in 1:length(type.vec)){
    if(type.vec[t]=="numeric"){
      for(i in 1:ncol(data.df)){
        ith_col = data.df[,i]
        if(is.numeric(ith_col)){
          data_num.df = cbind(data_num.df, ith_col)
          data_num_names = c(data_num_names, names(data.df)[i])
        }
      }
    }else if(type.vec[t]=="integer"){
      for(i in 1:ncol(data.df)){
        ith_col = data.df[,i]
        if(! FALSE %in% is.numeric(ith_col)){
          result = ith_col == round(ith_col)
          if(sum(result)==length(ith_col)){
            data_num.df = cbind(data_num.df, ith_col)
            data_num_names = c(data_num_names, names(data.df)[i])
          }
        }
      }
    }else if(type.vec[t]=="character"){
      for(i in 1:ncol(data.df)){
        ith_col = data.df[,i]
        if(is.character(ith_col)){
          data_num.df = cbind(data_num.df, ith_col)
          data_num_names = c(data_num_names, names(data.df)[i])
        }
      }
    }else if(type.vec[t]=="logical"){
      for(i in 1:ncol(data.df)){
        ith_col = data.df[,i]
        if(is.logical(ith_col)){
          data_num.df = cbind(data_num.df, ith_col)
          data_num_names = c(data_num_names, names(data.df)[i])
        }
      }
    }
  }
  data_num.df[1] = NULL
  names(data_num.df) = data_num_names
  return(data_num.df)
}
