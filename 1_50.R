find_valid_combinations <- function(max_value) {
  count <- 0
  for (c in 1:max_value) {
    for (d in c:max_value) {
      for (a in 1:c) {
        for (b in 1:(c-1)) {
          count <- count + 1
        }
      }
    }
  }
  return(count)
}

max_value <- 50
result <- find_valid_combinations(max_value)
