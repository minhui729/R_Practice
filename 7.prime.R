# 필요한 라이브러리 로드
if(!require('combinat')) install.packages('combinat', dependencies=TRUE)
if(!require('numbers')) install.packages('numbers', dependencies=TRUE)
library(combinat)
library(numbers)

# 2에서 300 사이의 자연수
nums <- 2:50

# 피타고라스 수 확인 함수
is_pythagorean_triplet <- function(a, b, c) {
  return(a^2 + b^2 == c^2)
}

# 가능한 세 수의 조합 찾기
combinations <- combn(nums, 3)

# 피타고라스 수 조합 찾기
pythagorean_combinations <- apply(combinations, 2, function(x) {
  x <- sort(x)
  if (is_pythagorean_triplet(x[1], x[2], x[3])) {
    return(x)
  } else {
    return(NULL)
  }
})

# NULL 값 제거
pythagorean_combinations <- do.call(rbind, Filter(Negate(is.null), pythagorean_combinations))

# 데이터프레임으로 변환
df <- data.frame(pythagorean_combinations)
colnames(df) <- c("a", "b", "c")

# 세 숫자가 모두 소수인지 확인하는 열 추가
df$all_primes <- apply(df, 1, function(row) {
  all(are.prime(row))
})

# 소수인 경우 1, 아닌 경우 0으로 변환
df$all_primes <- as.integer(df$all_primes)

# 조건을 만족하는 행의 개수
num_pythagorean_primes <- sum(df$all_primes)

# 전체 조합의 수
total_combinations <- choose(length(nums), 3)

# 확률 계산
probability <- num_pythagorean_primes / total_combinations

cat("피타고라스 수이면서 소수인 세 숫자의 조합이 나올 확률:", probability, "\n")
