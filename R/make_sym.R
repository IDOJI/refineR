# symmetric 행렬을 만드는 함수

make_sym = function(mat, upper=T){
  if(upper){
    mat[lower.tri(mat)] <- t(mat)[lower.tri(mat)]
  }else{
    mat[upper.tri(mat)] <- t(mat)[upper.tri(mat)]
  }
  return(mat)
}
