add_affix = function(data.df, which.col, str, affix.type){
  selected.col = data.df[,which.col]
  # 접두어인 경우
  if(affix.type %in% c("head", "pre", "prefix")){
    # 해당 접두어를 갖고 있지 않은 케이스만 접두어를 붙인다.
    which.row = which(substr(selected.col, start=1, stop=nchar(str)) != str)
    selected_elements = data.df[which.row, which.col]
    data.df[which.row, which.col] = paste(str, selected_elements, sep="")
    # 접미어인 경우
  }else if(affix.type %in% c("tail", "suf", "suffix")){

  }

  return(data.df)
}
