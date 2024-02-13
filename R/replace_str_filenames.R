replace_str_filenames = function(directory, old_string, new_string, recursive = FALSE) {
  # 지정된 경로의 모든 폴더 및 파일 목록을 가져옴
  files <- list.files(directory, full.names = TRUE, recursive = recursive)
  
  # 폴더 및 파일에 대해 반복
  for (file in files) {
    # 파일의 새 이름 생성
    new_name <- gsub(old_string, new_string, file)
    
    # 새 이름으로 파일 또는 폴더를 이동
    file.rename(file, new_name)
  }
  
  cat("Renaming complete.\n")
}

# 예시로 사용할 폴더와 파일 경로 설정
directory <- "/Users/Ido/Library/CloudStorage/GoogleDrive-yido.jee@gmail.com/내 드라이브/Obsidian/SecondBrain_Obsidian/🌸Stat_Bayesian(베이지안)/🟥Textbook/🟧데이터 분석을 위한 베이지안 통계 모델링(마츠우라)"
old_string <- "🟪"
new_string <- "🟨"

# 함수 호출하여 파일 및 폴더 이름 변경
replace_str_filenames(directory, old_string, new_string, recursive = TRUE)
warnings()
