# 상자 B에 들어 있는 공의 수가 8개인 경우우
prob_case_4411 <- 6/256
prob_case_2or3 <- 16/256
prob_case_4_1_2or3 <- 48/256

# 전체 확률
prob_total <- prob_case_4411 + prob_case_2or3 + prob_case_4_1_2or3

# 검은 공 2개인 경우의 확률
prob_black_2 <- prob_case_4411 / prob_total

cat("Probability that there are exactly 2 black balls in box B:", prob_black_2, "\n")
