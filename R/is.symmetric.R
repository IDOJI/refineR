is.symmetric = function(data.mat){
  # data.mat = FC_mat.list[[1]][[1]]
  diag(data.mat) = 0
  if(sum(rowSums(data.mat) == colSums(data.mat))==nrow(data.mat)){
    return(TRUE)
  }else{
    return(FALSE)
  }
}
#
# is.symmetric = function(data.mat){
#   half_1 = vectorize(data.mat, lower = F, half = T)
#   half_2 = vectorize(data.mat, lower = T, half = T)
#   is.same = c(half_1 == half_2)
#
#   if(sum(is.same)==length(half_1)){
#     return(TRUE)
#   }else{
#     return(FALSE)
#   }
# }
