rm(list = ls()); gc()
install.packages("stringr")

library(stringr)
# ´ë¼Ò¹®ÀÚ ¹Ù²Ù±â
text1 <- c("The quick Brown dog", "blue Bird")
str_to_upper(text1)
str_to_lower(text1)
str_to_title(text1)
str_to_sentence(text1)

# ºÙÀÌ±â
str_c("The quick", "Brown dog")     # paste0("The quick", "Brown dog")
str_c("The quick", "Brown dog", sep=" ")   # paste("The quick", "Brown dog")
text2 <- c("Bird", "Dog", "Cat")
str_c("blue", text2, sep=" ")
str_c(c("blue","red","green"), text2, sep=" ")
str_c(text2)
str_c(text2, collapse = "")     # paste(text2, collapse = "")
str_c(text2, collapse = ", ")   # paste(text2, collapse = ", ")

# ±Û·ç(µüÇ®) »ç¿ëÇÏ±â
str_glue(
  "My name is {name}, and my age next year is {current_year-birth_year+1}.",
  name = "James", birth_year = 1980, current_year = 2024)

df <- data.frame(student=c("ÀÌµÎÈ£", "¹ÚÀºÈñ"),
                 status=c("µûºÀ", "½ÖµûºÀ"))
df
df$today <- str_glue("{a}´Â {b}", a=df$student, b=df$status)
df
str_c(df$student, df$status, sep="´Â ")

# ¹®ÀÚ º¤ÅÍ ºÙÀÌ±â
letters
str_flatten(letters)
str_flatten(letters, "-")
str_flatten(letters[1:4], ", ")
str_flatten(letters[1:4], ", ", " and ")

for (i in 1 : 26) {
  str_flatten(letters[1:i])
}

# ¹®ÀÚ ¼¼±â
fruit <- c("apple", "banana", "pear", "Pineapple!", 
           "»ç°ú", "*º¹¼þ¾Æ 23°³?")
fruit_1 <- c("applebananapearPineapple! »ç°ú*º¹¼þ¾Æ 23°³?")

str_count(fruit_1, "a")
str_count(fruit, "ap")
str_count(fruit, "[ap]") # number of a or p
str_count(fruit, "a|p") # number of a or p
str_count(fruit, "p|P") # number of p or P
str_count(fruit, "[pP]") 
str_count(fruit, "[a-z]") # number of a to z
str_count(fruit, "[aA-zZ]|[°¡-ÆR]") # number of all alphabet or all korean character
str_count(fruit, "\\w") # number of character(alphabet + digit)
str_count(fruit, "\\W") # number of none-character
str_count(fruit, "\\w|\\s") # \\s == blank
str_count(fruit, "\\d") # number of digit
str_count(fruit, "[0-9]") 
str_count(fruit, "\\D") # number of none-digit
str_count(fruit, "[[:punct:]]") # number of punctuation
str_count(fruit, ".") # number of anything
str_count(fruit[1:4], c("a", "b", "p", "p"))

text3 <- c("a.", "...", ".a.a")
str_count(text3, ".")
str_count(text3, "\\.") # number of .
str_count(text3 , fixed(".")) # number of .
str_count(text3, str_escape(".")) # number of .

# ¹®ÀÚ¿­ Ã£±â
fruit1 <- c("apple", "banana", "pear", "pineapple")
str_detect(fruit1, "a")
str_detect(fruit1, "ap")
str_detect(fruit1, "^a")
str_detect(fruit1, "^a", negate = TRUE)
str_detect(fruit1, "a$")
str_detect(fruit1, "[aeiou]")

text4 <- c("R ÇÁ·Î±×·¡¹Ö", "ÆÄÀÌ½ã ÇÁ·Î±×·¡¹Ö")
str_detect(text4, "R ÇÁ·Î")
str_detect(text4, "[R ÇÁ·Î]")

# º¹»çÇÏ±â
fruit2 <- c("apple", "pear", "banana")
str_dup(fruit2, 2)
str_dup(fruit2, 1:3)
str_c("ÀÌµÎÈ£ ±³¼ö´Ô", str_dup("Â¯", 1:5), sep = " ")

# ºñ±³
str_equal("apple", "banana")
str_equal("apple", "Apple")
str_equal("apple", "Apple", ignore_case = T)
str_equal(c("ÀÌµÎÈ£", "Â¯"), c("¹ÚÀºÈñ", "Â¯"))

# ÃßÃâÇÏ±â
shopping_list <- c("apples x 4", "bag of flour", "bag of sugar", "milk x2")
str_extract(shopping_list, "\\d") # ¼ýÀÚ ÃßÃâ
str_extract(shopping_list, "[0-9]")
str_extract(shopping_list, "[a-z]+")
str_extract(shopping_list, "[a-z]{1,4}")
str_extract(shopping_list, "\\b")
str_extract(shopping_list, "\\b[a-z]+\\b")
str_extract(shopping_list, "\\b[a-z]{1,3}\\b")
str_extract(shopping_list, "\\b[a-z|\\d]{1,3}\\b")
str_extract(shopping_list, "\\b[a-z|0-9]{1,3}\\b")

shopping_list1 <- c("2 bags of flour", "3 pieces of cake", "1 bottle of coke")
str_extract(shopping_list1, "([a-z]+) of ([a-z]+)")
str_extract(shopping_list1, "([a-z]+) of ([a-z]+)", group = 1)
str_extract(shopping_list1, "([a-z]+) of ([a-z]+)", group = 2)

shopping_list2 <- c("»ç°ú 10°³", "¹Ð°¡·ç 1 Æ÷´ë", "¼³ÅÁ 1Æ÷´ë", "milk 2 Åë")
str_extract(shopping_list2, "\\d")
str_extract(shopping_list2, "\\d+")
str_extract(shopping_list2, "[°¡-ÆR]+")
str_extract(shopping_list2, "[°¡-ÆR]{2}")
str_extract(shopping_list2, "\\b[°¡-ÆR]\\b") # \\b[°¡-ÆR]{1}\\b 
str_extract(shopping_list2, "\\b[°¡-ÆR]{2}\\b")
str_extract(shopping_list2, "\\b[°¡-ÆR]{2,}\\b")
str_extract(shopping_list2, "\\b[°¡-ÆR]+|[a-z]+\\b")

text5 <- c("¹ÚÀºÈñ ±³¼ö´ÔÀº Â¯ÀÌ´Ù.", "ÀÌµÎÈ£ ±³¼ö´ÔÀº Â¯ÀÏ±î?")
str_extract(text5, "[°¡-ÆR] ±³¼ö´ÔÀº [°¡-ÆR]")
str_extract(text5, "[°¡-ÆR]+ ±³¼ö´ÔÀº [°¡-ÆR]")
str_extract(text5, "[°¡-ÆR]+ ±³¼ö´ÔÀº [°¡-ÆR]+")
str_extract(text5, "[°¡-ÆR]+ ±³¼ö´ÔÀº [°¡-ÆR|[[:punct:]]]+")
str_extract(text5, "([°¡-ÆR]+) ±³¼ö´ÔÀº ([°¡-ÆR]+)", group = 1)
str_extract(text5, "([°¡-ÆR]+) ±³¼ö´ÔÀº ([°¡-ÆR]+)", group = 2)

shopping_list3 <- c("apples x 4", "bag of flour", "bag of sugar", "milk x2")
str_extract_all(shopping_list3, "[a-z]+")
str_extract_all(shopping_list3, "\\b[a-z]+\\b")
str_extract_all(shopping_list3, "\\b[a-z]+\\b", simplify = TRUE)
str_extract_all(shopping_list3, "\\d", simplify = TRUE)

str_extract_all("¾È³çÇÏ¼¼¿ä. ¸¸³ª¼­ ¹Ý°©½À´Ï´Ù. Á¦ ÀÌ¸§Àº ÀÌµÎÈ£ ÀÔ´Ï´Ù.",
                boundary("word"))

# ÅØ½ºÆ® ±æÀÌ
text6 <- c("ÀÌµÎÈ£ ±³¼ö´ÔÀº Â¯ÀÌ´Ù.", "¤©¤·?")
length(text6)
str_length(text6)
nchar(text6)
str_count(text, ".")

# Á¤·ÄÇÏ±â
x <- c("apple", "car", "happy", "char")
str_sort(x)
str_sort(x, decreasing = T)
str_order(x)
str_order(x, decreasing = T)

x <- c("100a10", "100a5", "2b", "2a")
str_sort(x)
str_sort(x, numeric = TRUE)

# ¹®ÀÚ¿­¿¡ °ø¹é ºÙÀÌ±â
str_pad("Doo Ho", 10, "left") # default left 
str_pad("Doo Ho", 10, "right")
str_pad("Doo Ho", 10, "both")

str_pad(c("a", "abc", "abcde"), 7)
str_pad(c("a", "abc", "abcde"), 7, "right")
str_pad("a", c(2, 3, 4))
str_pad(letters[1:3], c(2, 3, 4), "right")
str_pad("a", 5, pad = c("*","/"))

# ¹®ÀÚ Á¦°ÅÇÏ±â
fruits <- c("one apPle", "two pears", "three bananas")
str_remove(fruits, "p")
str_remove(fruits, "[np]")
str_remove(fruits, "pP")
str_remove(fruits, "[pP]")
str_remove_all(fruits, "[pP]")
str_remove(fruits, "[aeiou]")
str_remove_all(fruits, "[aeiou]")

text7 <- c("À±¼®¿­Àº", "±è°ÇÈñ°¡")
str_remove_all(text7, "[Àº´ÂÀÌ°¡À»¸¦]")

fruits <- c("1 apple", "two pears", "33 bananas")
str_remove(fruits, "\\d")
str_remove(fruits, "\\d+")
str_remove_all(fruits, "\\d")
str_remove(fruits, c(1,"two", 33))
str_remove_all(fruits, c("\\d+","two","\\d+"))
str_remove_all(fruits, c("\\d+|s","two|s","\\d+|s"))
fruits <- c(" apple", " pear ", "   banana  ")
str_trim(fruits)
cat("  Á¦  ÀÌ¸§Àº ÀÌµÎÈ£     ÀÔ´Ï´Ù.\t¸¸³ª¼­   ¹Ý°©½À´Ï´Ù. ")
cat(str_squish("  Á¦  ÀÌ¸§Àº ÀÌµÎÈ£     ÀÔ´Ï´Ù.\t¸¸³ª¼­   ¹Ý°©½À´Ï´Ù. "))

text6 <- c("´Þµð´Þ°í x 2 ´Þµð´Ü ¹ã¾ç°» x 2", "¹ã¾ç°»ÀÌ¾ß?!.,")
str_remove_all(text6, " ")
str_remove_all(text6, "[a-z]")
str_remove_all(text6, "[[:punct:]]")
str_remove_all(text6, " |[a-z]|[[:punct:]]")

# ¹®ÀÚ ¹Ù²Ù±â
fruits <- c("one apple", "two pears", "three bananas")
str_replace(fruits, "a", "*")
str_replace(fruits, "[aeiou]", "-")
str_replace(fruits, "na", "*")
str_replace_all(fruits, "na", "*")
str_replace_all(fruits, "[aeiou]", "-")
str_replace_all(fruits, "[aeiou]", "")
str_replace_all(fruits, "[aeiou]", toupper)
str_replace_all(fruits, "b", NA_character_)     

str_replace(fruits, c("one","two","three"), as.character(1:3))
str_replace_all(fruits, c("one" = "1", "two" = "2", "three" = "3"))
str_replace(fruits, "[aeiou]", c("1", "2", "3"))
str_replace(fruits, c("e", "e", "n"), "-")
str_replace_all(fruits, c("[ae]", "e", "n"), "-")

text8 <- c("ÀÌ·± xx", "Àú·± yy")
str_replace(text8, "[a-z]", "³ð")
str_replace_all(text8, "[a-z]", "³ð")
str_replace(text8, "[a-z]+", "³ð")
str_replace(text8, "^[°¡-ÆR]", "±×")
str_replace(text8, c("^[°¡-ÆR]", "[a-z]+"), c("±×", "³ð"))

# ¹®ÀÚ ºÐ¸®
fruits <- c("apples and oranges and pears and bananas",
            "pineapples and mangos and guavas")
str_split(fruits, " and ")
str_split(fruits, " and ", simplify = TRUE)
str_split(fruits[2], " and ")
str_split_1(fruits[2], " and ")

str_split(fruits, " and ", 3)
str_split(fruits, " and ", 2)
str_split_fixed(fruits, " and ", 3)
str_split_fixed(fruits, " and ", 4)
str_split_i(fruits, " and ", 1)
str_split_i(fruits, " and ", 4)
str_split_i(fruits, " and ", -1)

# ¹®ÀÚ¿­ ½ÃÀÛ/³¡
fruit <- c("apple", "banana", "pear", "pineapple")
str_starts(fruit, "p")
str_starts(fruit, "p", negate = TRUE)
str_ends(fruit, "e")
str_ends(fruit, "e", negate = TRUE)

# ¹®ÀÚ »©³»±â
dhl <- "Hong Gil Dong"
str_sub(dhl, start = 1, end = 6)
str_sub(dhl, 1, 6)
str_sub(dhl, end = 6)
str_sub(dhl, 8, 14)
str_sub(dhl, start = 8)
str_sub(dhl, 8)
str_sub(dhl, -1)
str_sub(dhl, -7)
str_sub(dhl, end = -7)
str_sub(dhl, c(1, 8), c(6, 14))

x <- c("abcde", "ghifgh")
str_sub(x, c(1, 2), c(3, 4))
str_sub_all(x, c(1, 2), c(3, 4))

x <- "BBCDEF"
str_sub(x, 1, 1) <- "A"; x
str_sub(x, -1, -1) <- "K"; x
str_sub(x, -2, -2) <- "GHIJ"; x
str_sub(x, 2, -2) <- ""; x

# ºÎºÐÁýÇÕ
fruit <- c("apple", "banana", "pear", "pineapple")
str_subset(fruit, "a")
str_subset(fruit, "^a")
str_subset(fruit, "a$")
str_subset(fruit, "b")
str_subset(fruit, "[nb]")
str_subset(fruit, "^p", negate = TRUE)

# Àý´ÜµÈ ¹®ÀÚ¿­
x <- "This string is moderately long"
str_count(x)
str_trunc(x, 10, "right")
str_trunc(x, 10, "left")
str_trunc(x, 10, "center")

# ¹Ýº¹¹®ÀÚ Á¦°Å
str_unique(c("a", "b", "c", "b", "a"))
str_unique(c("a", "b", "c", "B", "A"))
str_unique(c("a", "b", "c", "B", "A"), ignore_case = TRUE)

# ¹®ÀÚ¿­ ÀÎµ¦½º ¹øÈ£
fruit <- c("1 appLe", "banana x 2", "3 pears", "pineapples")
str_which(fruit, "a")
str_which(fruit, "[lL]")
str_which(fruit, "nana|ear")
str_which(fruit, "^\\d")
str_which(fruit, "s$")
str_which(fruit, "^p", negate = TRUE)

# ¹®Àå¿¡¼­ ´Ü¾î »Ì¾Æ³»±â
sentences <- c("Jane saw a cat", "Jane sat down")
word(sentences, 1)
word(sentences, 2)
word(sentences, -1)
word(sentences, 2, -1)
word(sentences[1], 1:3, -1)
word(sentences[1], 1, 1:4)
str <- "¾È³çÇÏ¼¼¿ä\t¸¸³ª¼­\t¹Ý°©½À´Ï´Ù\tÁ¦\tÀÌ¸§Àº\tÈ«±æµ¿\tÀÔ´Ï´Ù."
word(str, 1, sep = fixed("\t"))
word(str, 2, sep = fixed("\t"))
word(str, 3, sep = fixed("\t"))
word(str, c(1,3,5), sep = fixed("\t"))
