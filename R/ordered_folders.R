ordered_folders = function(path, x.vec, pattern, gapped, digit){
  ## 특정문자열_001 순서의 폴더 생성
  # 예시  ordered_folders(path=gth_path_T1, x.vec = gth_folders, pattern = "Sub", gapped = "_", digit = 3)

  # path : 폴더 생성 위치
  # x.vec : 순서를 매길 벡터
  # pattern 앞부분에 붙을 문자열
  # gapped : 중간에 놓일 문자열
  # digit : 넘버링 길이
  path = path %>% path_tail_slash()
  if(nchar(length(x.vec))>digit){
    warning("The length of x.vec must be smaller than digit")
  }else{
    folders = paste(pattern, gapped, fit_length(1:length(x.vec), digit), sep = "")
    folders.path = paste(path, folders, sep = "")

    sapply(folders.path, FUN = function(x){
      dir.create(x, showWarnings = F)
      y = substr(x, start=nchar(x)-6, stop=nchar(x))
      print(paste("A Folder named ", y, " is created !"))
    })
  }
}
