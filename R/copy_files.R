copy_files = function(path, recursive_folder = NULL, destination, rename_to=NULL, overwrite=T, message = T){
  # recursive_folder : path내의 폴더 가운데 recursive_folder의 안에 있는 파일을 지정하고 싶을 때
  # 즉, path = paste00(path, "/", recursive_folder)로 path가 새롭게 지정됨
  # files_list : NULL이면 모든 파일들 옮김
  # path, destination의 길이가 동일한 벡터의 경우 여러 폴더에 대해 파일 옮김이 적용됨
  #
  # path = list.files(path_Preprocessing.Completed, full.names=T)
  # destination = Clipboard_to_path()
  # recursive_folder = "@Original_EPI"
  # path가 dir이면 해당 폴더를 복사
  # path가 file이면 해당 파일을 복사
  # rename : path 형태가 아니라 파일 이름 형태로 input
  #=============================================================================
  # rep destination
  #=============================================================================
  if(length(destination)==1){
    destination = rep(destination, times = length(path))
  }else if(length(path) != length(destination)){
    stop("The length of path and destination is different!")
  }






  #=============================================================================
  # Check the existence of destination folders
  #=============================================================================
  Results = sapply(destination, function(ith_destination){
    dir.create(ith_destination, showWarnings = F)
  })






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
  # Rename?
  #=============================================================================
  if(!is.null(rename_to)){
    if(length(path)!=length(rename_to)){
      stop("The length of path and rename is different!")
    }
  }




  #=============================================================================
  # Copying
  #=============================================================================
  Return = lapply(seq_along(path), FUN=function(i, ...){
    ith_path = path[i]
    ith_destination = destination[i]




    #===========================================================================
    # Copying
    #===========================================================================
    tictoc::tic()
    # is directory?
    if(fs::is_dir(ith_path)){
      fs::dir_copy(path = ith_path, new_path = ith_destination, overwrite = overwrite)

    # is file?
    }else if(fs::is_file(ith_path)){
      # copying
      fs::file_copy(path = ith_path, new_path = ith_destination, overwrite)
      cat("\n", crayon::yellow("Copying a file is done! :"), crayon::red(basename(ith_path)),"\n")


      # rename
      if(!is.null(rename_to)){
        # ith_extension = basename(ith_path) %>% fs::path_ext()
        ith_rename_to = rename_to[i]
        fs::file_move(path = paste(ith_destination, basename(ith_path), sep="/"), new_path = paste(ith_destination, ith_rename_to, sep="/"))
        cat("\n", crayon::yellow("Renaming a file is done! :"), crayon::red(basename(ith_path)),"\n")
      }

    }
    tictoc::toc()







    if(message){
      cat("\n", crayon::green("Copying files is done! :"), crayon::red(paste0(i,"th folder")),"\n")
    }

  })
}






















