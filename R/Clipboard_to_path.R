Clipboard_to_path = function(execute_after_copy_the_path=NULL){
  gsub( "\\\\",  "/",  readClipboard())
}



