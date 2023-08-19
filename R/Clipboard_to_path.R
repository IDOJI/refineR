Clipboard_to_path = function() {
  OS = Sys.info()["sysname"]

  if (OS == "Windows") {
    path <- system('powershell -command "Get-Clipboard"', intern = TRUE)
    # path <- iconv(path, from = "UTF-16LE", to = "UTF-8")
    gsub("\\\\", "/", path)
  } else if (OS == "Darwin") { # MacOS is referred to as "Darwin" in this context
    system("pbpaste", intern = TRUE)
  } else if (OS == "Linux") {
    system("xclip -o -selection clipboard", intern = TRUE)
  } else {
    stop("Unsupported OS. Please use 'Windows', 'macOS' or 'Linux'")
  }
}
