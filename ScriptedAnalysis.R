# This is the supplemental material for the work titled: 
# "Management in Business Analytics: An Ego-Network Approach".

load("~/Documents/PaperDBA/Data.RData")
# The following 25 variables are present in this data set
variable.names(M)
# For those interested in knowing the meaning of each
# of these variables, we strongly suggest to consult
# the following website: 
# https://www.bibliometrix.org/vignettes/Introduction_to_bibliometrix.html


# To fulfill the goal of examining how visible is the 
# the connection between the term "management" and the 
# brigram "business analytics", we need to focus on 
# the abstract of each document retrieved with the 
# criterion explained in the method section of our manuscript.
# The abstract of each paper is available in the column "AB". 


# To do so, we need to set all
# abstracts as a standard corpus. For such a purpose
# we use quanteda package.
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
library(bibliometrix)
#biblioshiny()
M <- EgoCentricPapers
rm(list=setdiff(ls(), "M"))
NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
netstat <- networkStat(NetMatrix)
summary(netstat, k=10)

# Plot the network
net=networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)
