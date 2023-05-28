copy_files = function(path, recursive_folder = NULL, copy.dir = F, destination, overwrite=T){
  # recursive_folder : path내의 폴더 가운데 recursive_folder의 안에 있는 파일을 지정하고 싶을 때
  # 즉, path = paste00(path, "/", recursive_folder)로 path가 새롭게 지정됨
  # files_list : NULL이면 모든 파일들 옮김
  # path, destination의 길이가 동일한 벡터의 경우 여러 폴더에 대해 파일 옮김이 적용됨
  #
  # path = list.files(path_Preprocessing.Completed, full.names=T)
  # destination = Clipboard_to_path()
  # recursive_folder = "@Original_EPI"
  # copy.dir = T : path 경로에 해당하는 폴더를 카피
  #=============================================================================
  # Fit vector length
  #=============================================================================
  if(length(path) != length(destination)){
    stop("The length of 'path' and 'destionation' is different!")
  }





  #=============================================================================
  # Add recursive_folder name
  #=============================================================================
  if(!is.null(recursive_folder)){
    if(length(recursive_folder)==1){
      path = paste0(path %>% path_tail_slash(), recursive_folder)
    }else if(length(path)!= length(recursive_folder)){
      stop("The length of 'path' and 'recursive' is different!")
    }else{
      path = paste0(path, "/", recursive_folder)
    }
  }




  #=============================================================================
  # files list for each folder  & moving files
  #=============================================================================
  Return = lapply(seq_along(path), FUN=function(i, ...){
    ith_path = path[i]
    ith_destination = destination[i]

    # check whether destination exists
    dir.create(ith_destination, showWarnings = F)



    tictoc::tic()
    #===========================================================================
    # Copy dir
    #===========================================================================
    if(copy.dir){
      fs::dir_copy(path = ith_path, new_path = ith_destination, overwrite = overwrite)
    }else{
      #===========================================================================
      # Copy files
      #===========================================================================
      ith_files = fs::dir_ls(ith_path)
      for(file in ith_files){
        fs::file_copy(from = file, to = ith_destination) %>% invisible()
      }
    }
    tictoc::toc()

    cat("\n", crayon::green("Copying files is done! :"), crayon::red(paste0(i,"th folder")),"\n")
  })
}
