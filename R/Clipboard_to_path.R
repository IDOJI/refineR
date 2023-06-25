Clipboard_to_path = function() {
  OS = Sys.info()["sysname"]

  if (OS == "Windows") {
    gsub("\\\\", "/", system('powershell -command "Get-Clipboard"', intern = TRUE))
  } else if (OS == "Darwin") { # MacOS is referred to as "Darwin" in this context
    system("pbpaste", intern = TRUE)
  } else if (OS == "Linux") {
    system("xclip -o -selection clipboard", intern = TRUE)
  } else {
    stop("Unsupported OS. Please use 'Windows', 'macOS' or 'Linux'")
  }
}
