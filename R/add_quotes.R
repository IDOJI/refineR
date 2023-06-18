add_quotes = function(x) {
  # Use sapply to apply the function to each element of a
  # The function we apply is paste0, which concatenates strings
  quoted_x = sapply(x, function(x) paste0("\"", x, "\""))

  # Collapse the quoted elements into a single string with commas
  result =  paste(quoted_x, collapse = ", ")


}
