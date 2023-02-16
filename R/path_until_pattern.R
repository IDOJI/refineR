path_until_pattern = function(path, until_pattern){
  # path = ith_subject_path
  # until_pattern = ith_EPB_ImageID
  path    = list.files(path, full.names = T)
  have_pattern = grep(until_pattern, path)
  while(length(have_pattern)==0){
    path    = list.files(path, full.names = T)
    have_pattern = grep(until_pattern, path)
  }
  filter_by(path, until_pattern) %>% return()
}
