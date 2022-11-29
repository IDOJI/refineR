rm_dup_row = function(data.df, except=NULL, messaging=F){
  col_names = names(data.df)
  selected_col_names = col_names[!col_names %in% except]
  data_new.df = data.df[!duplicated(data.df[,selected_col_names]),]
  if(nrow(data_new.df)==nrow(data.df)){
    dup_col.list = list()
    for(i in 1:length(col_names)){
      dup_col.list[[i]] = data_new.df[,col_names[i]] %>% unique %>% length
    }
    dup_col.vec = unlist(dup_col.list)

    if(messaging){
      text1 = "There are no duplicate rows. The columns having different elements are : "
      cat("\n", crayon::blue(text1), "\n")

      text2 = col_names[which(dup_col.vec > 1)]
      cat("\n", crayon::bgMagenta(text2), "\n")
    }
    return(data_new.df)
  }else{
    return(data_new.df)
  }
}
