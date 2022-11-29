grouping_by_conditions = function(data.df, by.col, LU_condition, group_names, type=c(1,2), as.factor=T){
  # type = 1 : "<= x <"
  # type = 2 : "< x <="
  # by.col = "AHI"
  # LU_condition :Lower-Upper condtion
  # LU_condition = c(5,15,30)
  # data.df = Data_RmNaRow_2.df

  if(length(group_names)!=(length(LU_condition)+1)){
    stop("Check the length of 'group_names'.")
  }


  selected = data.df[,by.col] %>% unlist

  # min_val = min(selected)
  # max_val = max(selected)
  # LU_condition = c(min_val, LU_condition, max_val


  group.list = list()
  if(type==1){
    for(i in seq(1,length(LU_condition)+1,1)){
      #i=1
      if(i==1){
        group.list[[i]] = cbind(group_names[i],data.df[selected<LU_condition[i],])
      }else if(i==(length(LU_condition)+1)){
        group.list[[i]] = cbind(group_names[i],data.df[LU_condition[i-1]<=selected,])
      }else{
        group.list[[i]] = cbind(group_names[i],data.df[LU_condition[i-1]<=selected & selected<LU_condition[i],])
      }
      names(group.list[[i]])[1] = paste(by.col, "group", sep="_")
    }#for
  }else if(type==2){
    for(i in seq(1,length(LU_condition)+1,1)){
      #i=1
      if(i==1){
        group.list[[i]] = cbind(group_names[i],data.df[selected<=LU_condition[i],])
      }else if(i==(length(LU_condition)+1)){
        group.list[[i]] = cbind(group_names[i],data.df[LU_condition[i-1]<selected,])
      }else{
        group.list[[i]] = cbind(group_names[i],data.df[LU_condition[i-1]<selected & selected<=LU_condition[i],])
      }
      names(group.list[[i]])[1] = paste(by.col, "group", sep="_")
    }#for
  }
  names(group.list) = group_names
  grouped.df = do.call(rbind,group.list)
  if(as.factor){
    grouped.df[,1] = factor(grouped.df[,1], levels=group_names)
  }
  return(grouped.df)
}# function
