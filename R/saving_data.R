saving_data = function(rda.name, rda, path){
  path = path %>% path_tail_slash
  # file = paste0(path, rda.name)
  assign(rda.name, rda)
  # save(rda.name, file = paste0(path, rda.name, ".rda"))
  setwd(path)
  require(usethis)
  do.call("use_data", list(as.name(rda.name), overwrite=TRUE))


  # usethis::use_data(data.df, overwrite=T)
  # usethis::use_data_raw(rda.name)
  cat("\n", crayon::blue("Exporting"), crayon::red(rda.name), crayon::blue("is done!"),"\n")
}
