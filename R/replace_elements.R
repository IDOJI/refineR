replace_elements_single = function(data.df, col_name, from, to){
  # Specify the column name as a character string
  # column_name = column_name

  # Replace all "Male" with "M" in the specified column
  # data.df = data.df %>% mutate(across(.cols = all_of(column_name), .fns = ~ifelse(.x == from, to, .x)))
  selected_col = data.df[,col_name] %>% unlist
  if(is.factor(selected_col)){
    selected_col = as.character(selected_col)
  }
  selected_col[selected_col %in% from] = to

  data.df[,col_name] = selected_col

  # In this example, the across() function is used within mutate() to specify the column to be modified.
  # all_of(column_name) is used to select the column(s) to be applied the function to.
  # The .fns = ~ ifelse(.x == "Male", "M", .x) part is the function to be applied. The .x is the placeholder for the column values.

  return(data.df)
}



replace_elements = function(data.df, col_name, from, to){
  if(length(from)!=length(to)){
    stop("The lengths of 'from' and 'to' are different!")
  }


  for(i in 1:length(from)){
    data.df = replace_elements_single(data.df, col_name, from = from[i], to = to[i])
  }

  return(data.df)
}
