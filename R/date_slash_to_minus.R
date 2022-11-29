dates_slash_to_minus = function(ith_date_split.vec){
  mm = ith_date_split.vec[1]
  dd = ith_date_split.vec[2]
  yy = ith_date_split.vec[3]
  if(nchar(mm)==1){
    mm = paste(0, mm, sep="")
  }
  ith_date_new = paste(yy, mm, dd, sep="-")
  return(ith_date_new)
}


