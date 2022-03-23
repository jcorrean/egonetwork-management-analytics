load("~/Documents/PaperDBA/Data.RData")
library(quanteda)
abstracts <- corpus(M$AB)
summary(abstracts, n = length(M))
docvars(abstracts, "Journal") <- M$SO
docvars(abstracts, "Year") <- M$PY
docvars(abstracts, "Citations") <- M$TC
PapersAnalyzed <- summary(abstracts)
data_tokens <- tokens(abstracts)
Management <- kwic(data_tokens, pattern = "management")
BA <- kwic(data_tokens, pattern = phrase("business analytics"))
BAM <- rbind.data.frame(BA, Management)
library(dplyr)
BAM2 <- filter(BAM, grepl('DATA', pre) | grepl('DATA', post))
selectedpapers <- data.frame(table(BAM2$docname))
EgoCentricPapers <- M %>% slice(100, 102, 103, 105, 115, 120, 128,
                                132, 135, 141, 146, 147, 151, 156,
                                16, 161, 189, 19, 199, 2, 20, 21,
                                215, 232, 27, 28, 3, 33, 35, 4, 52,
                                53, 6, 69, 7, 70, 72, 73, 75, 76,
                                78, 80, 85, 86, 9, 95, 96)
rm(list=setdiff(ls(), "EgoCentricPapers"))
M <- EgoCentricPapers
rm(list=setdiff(ls(), "M"))

biblioshiny()
