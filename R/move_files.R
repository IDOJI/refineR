move_files = function(source_dir, destination_dir, keywords_for_each_file){


  # Get a list of all files in the source directory
  all_files = fs::dir_ls(source_dir)

  # Loop through the file numbers
  for (ith_keyword in keywords_for_each_file) {
    # Extract the files that contain the current file number
    files_to_move <- all_files[str_detect(all_files, ith_keyword)]

    # Move each file to the destination directory
    fs::file_move(files_to_move, fs::path(destination_dir, fs::path_file(files_to_move)))
  }
}


# move_files = function(path,
#                       destination,
#                       files=NULL,
#                       no.move.if.already.exist=F){
#   # path 폴더 안에 있는 파일들을 destination 폴더 안으로 옮김
#   # files = NULL : path 안의 모든 파일을 옮김
#   # files = c("파일명") : 특정 파일명의 파일만 옮김
#   #=============================================================================
#   # Fit vector length
#   #=============================================================================
#   if(length(path) != length(destination)){
#     stop("The length of 'path' and 'destionation' is different!")
#   }
#
#
#
#
#
#   #=============================================================================
#   # files list for each folder  & moving files
#   #=============================================================================
#   Results = lapply(seq_along(path), function(i, ...){
#     ith_path = path[i]
#     ith_destination = destination[i]
#     # check whether destination exists
#
#
#     tictoc::tic()
#     # If specific files are not provided, select all files in the source directory
#     if(is.null(files)){
#       path_files = fs::dir_ls(ith_path)
#     }else{
#       path_files = file.path(ith_path, files)
#       # Exclude files that do not exist in the source directory
#       path_files = path_files[fs::file_exists(path_files)]
#     }
#
#
#     # Make sure destination directory exists
#     if(!fs::dir_exists(ith_destination)){
#       fs::dir_create(ith_destination)
#     }
#
#
#
#     # Move files to destination directory
#     if(no.move.if.already.exist){
#       fs::file_move(path_files, ith_destination)
#     }else{
#       for(ith_path_files in path_files){
#         file.rename(from=ith_path_files, file.path(ith_destination, basename(ith_path_files)))
#       }
#     }
#
#
#
#     tictoc::toc()
#
#     cat("\n", crayon::green("Moving files is done! :"), crayon::red(paste0(i,"th folder")),"\n")
#
#
#   })
# }



# ith_files = fs::dir_ls(ith_path)
# # moving
# for(file in ith_files) {
#   fs::file_move(file, destination[i]) %>% invisible()
# }
# # Remove the '@Original_EPI' directory
# fs::dir_delete(ith_path) %>% invisible()
