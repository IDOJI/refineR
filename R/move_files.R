move_files = function(path,
                      recursive_folder = NULL,
                      destination){
  # recursive_folder : path내의 폴더 가운데 recursive_folder의 안에 있는 파일을 지정하고 싶을 때
  # 즉, path = paste00(path, "/", recursive_folder)로 path가 새롭게 지정됨
  # files_list : NULL이면 모든 파일들 옮김
  # path, destination의 길이가 동일한 벡터의 경우 여러 폴더에 대해 파일 옮김이 적용됨
  #
  # path = list.files(path_Preprocessing.Completed, full.names=T)
  # destination = Clipboard_to_path()
  # recursive_folder = "@Original_EPI"
  #=============================================================================
  # Fit vector length
  #=============================================================================
  if(length(path) != length(destination)){
    stop("The length of 'path' and 'destionation' is different!")
  }



  #=============================================================================
  # Add recursive_folder name
  #=============================================================================
  if(length(recursive_folder)==1){
    path = paste0(path %>% path_tail_slash(), recursive_folder)
  }else if(length(path)!= length(recursive_folder)){
    stop("The length of 'path' and 'recursive' is different!")
  }else{
    path = paste0(path, "/", recursive_folder)
  }





  #=============================================================================
  # files list for each folder  & moving files
  #=============================================================================
  lapply(seq_along(path), function(i, ...){
    ith_path = path[i]
    # check whether destination exists
    if(fs::dir_exists(destination[k])){
      tictoc::tic()

      ith_files = fs::dir_ls(ith_path)
      # moving
      for(file in ith_files) {
        fs::file_move(file, destination[i]) %>% invisible()
      }
      # Remove the '@Original_EPI' directory
      fs::dir_delete(ith_path)

      tictoc::toc()

      cat("\n", crayon::green("Moving files is done! :"), crayon::red(paste0(i,"th folder")),"\n")
    }
  })
}
