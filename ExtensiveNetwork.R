load("~/Documents/PaperDBA/Data.RData")
variable.names(M)
# For those interested in knowing the meaning of each
# of these variables, we strongly suggest to consult
# the following website: 
# https://www.bibliometrix.org/vignettes/Introduction_to_bibliometrix.html

# Our analysis begin with the bibliographic mapping 
# of keywords co-occurrences for the large network
# (i.e., all 381 documents' abstracts)

library(bibliometrix)
NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
netstat <- networkStat(NetMatrix)
netstat$graph
summary(netstat)
net=networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)
Large <- as.data.frame(netstat$network)
