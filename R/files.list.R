files.list = function(path){
  directory_path = path
  # Use the system function to execute a shell command
  if (Sys.info()["sysname"] == "Windows") {
    # Windows shell command
    shell_command = sprintf('cmd /c dir /s /b "%s"', directory_path)
    file_list = system(shell_command, intern = TRUE)
  } else {
    # Unix-based shell command (e.g., macOS and Linux)
    shell_command = sprintf('find "%s"', directory_path)
    file_list = system(shell_command, intern = TRUE)
  }
  return(file_list)
}
