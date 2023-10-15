# symmetric 행렬을 만드는 함수
make_sym = function(X, upper=T){
  lower.tri(X)
  if(upper){
    X[lower.tri(X)] = t(X)[lower.tri(X)]
  }else{
    X[lower.tri(X)] = t(X)[lower.tri(X)]
  }
  return(X)
}
