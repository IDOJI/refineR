download_github_as_tar = function(repo="IDOJI/ADNIprep"){
  url = paste("https://api.github.com/repos", repo, "tarball", sep="/")
  text1 = crayon::green("Check your")
  text2 = crayon::bgMagenta('download')
  text3 = crayon::green("folder")
  cat(text1, text2, text3)
  browseURL(url = url)
}
