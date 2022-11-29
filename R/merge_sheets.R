merge_sheets = function(file.path, sheets_names, unifying_colnames_by=2, col_names=T){
  # file.path="G:/내 드라이브/[백업] 공부/[백업] 공부_논문/논문_CNU Sleep Center/CNUH sleep center PSG data_1028.xlsx"
  # sheets_names = as.character(2017:2022)


  dataset.list = list()
  for(i in 1:length(sheets_names)){
    dataset.list[[i]] = readxl::read_xlsx(path=file.path, sheet = sheets_names[i], col_names = T) # fast
  }


  u_colnames = colnames(dataset.list[[unifying_colnames_by]])
  dataset.list_unified = lapply(dataset.list, u_colnames, FUN=function(x, u_colnames){
    names(x) = u_colnames
    return(x)
  })

  return(do.call(rbind, dataset.list_unified))

  # if(unifying_colnames_by=T){
  #   unifying_colnames
  #   # the number of columns
  #   # n_col = sapply(dataset.list, FUN=function(X){
  #   #   return(ncol(x))
  #   # })
  #   #
  #   # # the names of each column
  #   # names.list = lapply(dataset.list, FUN=function(x){
  #   #   # x = dataset.list[[1]]
  #   #   return(colnames(x))
  #   # })
  #   #
  #   # # checking same columns
  #   # for(k in 1:length(names.list)){
  #   #   if(k==1){
  #   #     colnames.df = data.frame(names.list[[k]])
  #   #   }else{
  #   #     colnames.df = cbind(colnames.df, names.list[[k]])
  #   #     colnames.df = refineR::rm_same_col(colnames.df, 1, 2, messaging = T)
  #   #   }
  #   # }
  #
  #   sames_colnames = sapply(names.list)
  # }
}
