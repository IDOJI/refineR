saving_data = function(rda.name, rda, path){
  path = path %>% path_tail_slash
  assign(rda.name, rda)


  # setwd(path)
  # require(usethis)

  # do.call("use_data", list(as.name(rda.name), overwrite=TRUE))
  # file = paste0(path, rda.name)
  save(rda.name, file = paste0(path, rda.name, ".rda"))

  # usethis::use_data(data.df, overwrite=T)
  # usethis::use_data_raw(rda.name)
  cat("\n", crayon::blue("Exporting"), crayon::red(rda.name), crayon::blue("is done!"),"\n")
}



#
#
# Yes, the save() function in R will overwrite the existing file if a file with the same name already exists at the specified location. If you want to prevent accidental overwriting, you can add a check to ensure the file doesn't already exist before saving:
#
# R
# Copy code
# # Load the required library
# library(dplyr)
#
# # Assign an example dataset
# rda.name <- "mydata"
# rda <- data.frame(x = 1:10, y = 11:20)
#
# # Define the path and ensure it has a trailing slash
# path <- "C:/Users/lleii/Dropbox/Github/Rpkgs/Papers___Data/ADNI___RS.fMRI___Funtional.Data.Analysis"
# path <- path %>% path_tail_slash
#
# # Set the file path for the RData file
# file_path <- paste0(path, rda.name, ".RData")
#
# # Check if the file exists, and prompt the user before overwriting
# if (file.exists(file_path)) {
#   message("The file already exists. Do you want to overwrite it? (y/n):")
#   user_input <- readline()
#   if (tolower(user_input) == "y") {
#     save(rda, file = file_path)
#     message("File overwritten.")
#   } else {
#     message("File not overwritten.")
#   }
# } else {
#   save(rda, file = file_path)
# }
# This code checks if the file already exists using the file.exists() function. If the file exists, it prompts the user to confirm whether they want to overwrite the file. If the user confirms, the existing file will be overwritten; otherwise, the file will not be saved.







