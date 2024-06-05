BR31_start <- function() {
  cat("베스킨 라빈스 31 게임 시작!\n")
  cat("가위 바위 보로 누가 먼저 숫자를 부를지 정하겠습니다.\n")
  
  # 가위 바위 보 입력 받기 함수
  get_input <- function(prompt_text) {
    valid_inputs <- c("가위", "바위", "보")
    while(TRUE) {
      user_input <- readline(prompt=prompt_text)
      if (user_input %in% valid_inputs) {
        return(user_input)
      } else {
        cat("똑바로 입력하세요. --;\n")
      }
    }
  }
  
  who_win <- function(player, computer) {
    if (player == computer) {
      return("draw")
    } else if ((player == "가위" && computer == "보") ||
               (player == "바위" && computer == "가위") ||
               (player == "보" && computer == "바위")) {
      return("player_win")
    } else {
      return("com_win")
    }
  }
  
  # 가위 바위 보 게임 반복
  while(TRUE) {
    player_choice <- get_input("가위 바위 보: ")
    computer_choice <- sample(c("가위", "바위", "보"), 1)
    winner <- who_win(player_choice, computer_choice)
    
    cat("저는", computer_choice, "를 냈습니다.\n")
    if (winner == "draw") {
      cat("비겼습니다. 다시\n")
    } else {
      break
    }
  }
  
  if (winner == "player_win") {
    whose_turn <- "player"
  } else {
    whose_turn <- "computer"
  }
  
  current_number <- 0
  first_turn_completed <- FALSE
  while (current_number < 31) {
    if (whose_turn == "computer") {
      # 컴퓨터의 차례
      remaining_numbers <- 31 - current_number
      num_to_call <- sample(1:min(3, remaining_numbers), 1)
      computer_numbers <- current_number + 1:num_to_call
      if (!first_turn_completed) {
        cat("제가 이겼네요. 저부터 시작하겠습니다.", computer_numbers, "\n")
        first_turn_completed <- TRUE
      } else {
        cat("제가 부르겠습니다. ", computer_numbers, "\n")
      }
      current_number <- max(computer_numbers)
      whose_turn <- "player"
    } else {
      # 사용자의 차례
      if (!first_turn_completed) {
        repeat {
          user_input <- readline(prompt="당신이 이겼습니다. 먼저 숫자를 부르세요. 최대 3개입니다. ")
          user_numbers <- as.numeric(strsplit(user_input, " ")[[1]])
          if (all(user_numbers == (current_number + 1):(current_number + length(user_numbers))) && length(user_numbers) <= 3 && length(user_numbers) > 0) {
            break
          } else {
            cat("잘못된 입력입니다. 다시 시도하세요.\n")
          }
        }
        first_turn_completed <- TRUE
      } else {
        repeat {
          user_input <- readline(prompt="숫자를 부르세요. 최대 3개입니다. ")
          user_numbers <- as.numeric(strsplit(user_input, " ")[[1]])
          if (all(user_numbers == (current_number + 1):(current_number + length(user_numbers))) && length(user_numbers) <= 3 && length(user_numbers) > 0) {
            break
          } else {
            cat("잘못된 입력입니다. 다시 시도하세요.\n")
          }
        }
      }
      current_number <- max(user_numbers)
      whose_turn <- "computer"
    }
  }
  
  if (whose_turn == "player") cat("당신이 이겼습니다. 게임 종료!\n")
  else cat("제가 이겼습니다. 게임 종료\n")
}
