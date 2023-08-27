update_R = function(){
  install_packages("installr", TRUE)
  check.for.updates.R() # R의 버전을 확인한다.
  install.R() # 최신 버전의 R을 설치한다.
  version # 현재 사용중인 컴퓨터의 플랫폼과 R의 버전 등이 나온다.
}
