#install.packages("stats")
library(stats)

# t 값의 범위 설정
t_values <- seq(0.01, 100, by = 0.01)

# 데이터프레임 초기화
results <- data.frame(
  t = t_values,
  p1 = sapply(t_values, function(t) pnorm(5 * t, mean = 1, sd = t))
)

# 조건 Pr(X ≤ 5t) ≥ 0.5 를 만족하는 행 필터링
filtered_results <- results[results$p1 >= 0.5, ]

# Pr(t^2 - t + 1 ≤ X ≤ t^2 + t + 1) 계산하여 새로운 열로 추가
filtered_results$p2 <- sapply(filtered_results$t, function(t) {
  lower_bound <- t^2 - t + 1
  upper_bound <- t^2 + t + 1
  pnorm(upper_bound, mean = 1, sd = t) - pnorm(lower_bound, mean = 1, sd = t)
})

# Pr(t^2 - t + 1 ≤ X ≤ t^2 + t + 1)이 가장 큰 행 찾기
filtered_results[which.max(filtered_results$p2), ]$t

