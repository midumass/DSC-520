library(readr)
library(ggplot2)
library(dplyr)
library(data.table)

input_file <- './en_full.txt'
data <- read.table(input_file, sep = " ")
data <- data %>% mutate(V3 = V2 / sum(V2))

# edits1 <- function(word) {
#   letters <- 'abcdefghijklmnopqrstuvwxyz'
#   splits <- [(word[:i], word[i:])    for i in range(len(word) + 1)]
#   deletes <- [L + R[1:]               for L, R in splits if R]
#   transposes <- [L + R[1] + R[0] + R[2:] for L, R in splits if len(R)>1]
#   replaces <- [L + c + R[1:]           for L, R in splits if R for c in letters]
#   inserts <- [L + c + R               for L, R in splits for c in letters]
# }

letters <- 'abcdefghijklmnopqrstuvwxyz'

edits1 <- function(word) {
  
  deletes <- c()
  for (l in seq(1:nchar(word)))
    deletes <- c(deletes, paste0(substr(word, start = 0, stop = l-1), substr(word, start = l+1, stop = nchar(word))))
  
  transposes <- c()
  vec_word <- strsplit(word, split = '')[[1]]
  for (l in seq(1:(nchar(word)-1))) {
    vec_word_tmp <- vec_word
    splice <- rev(vec_word_tmp[l:(l+1)])
    vec_word_tmp[l] <- splice[1]
    vec_word_tmp[l+1] <- splice[2]
    transposes <- c(transposes, paste(vec_word_tmp, collapse = ""))
  }
  
  replaces <- c()
  for (l in seq(1:nchar(word)))
    for (k in seq(1:nchar(letters)))
      replaces <- c(replaces, paste0(substr(word, start = 0, stop = l-1), substr(letters, start = k, stop = k), substr(word, start = l+1, stop = nchar(word))))
  
  inserts <- c()
  for (l in seq(1:(nchar(word)+1)))
    for (k in seq(1:nchar(letters)))
      inserts <- c(inserts, paste0(substr(word, start = 0, stop = l-1), substr(letters, start = k, stop = k), substr(word, start = l, stop = nchar(word))))
  
  return (unique(c(deletes, transposes, replaces, inserts)))
}

known <- function(words) { 
  known_list <- unique(intersect(words,data$V1))
  return (known_list)
}

top3 <- function(words) {
  top_df <- data.frame(words)
  colnames(top_df) <- c("V1")
  top_df <- merge(top_df, data, by = "V1")
  top_df <- top_df[order(-top_df$V3),]
  
  return (unique(top_df[0:3,]))
}

edits2 <- function(words) {
  edits2_list <- c()
  for (i in seq(1:length(words)))
    edits2_list <- c(edits2_list, edits1(words[i]))
  
  return (edits2_list)
}
