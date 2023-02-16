intersect_list = function(data.list){
  for(i in 1:length(data.list)){
    if(i==1){
      intersection = data.list[[1]]
    }else{
      intersection = intersect(intersection, data.list[[i]])
    }
  }
  return(intersection)
}
