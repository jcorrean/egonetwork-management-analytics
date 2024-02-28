library(readr)
Internos <- read_csv("/home/jcc/Documents/GitHub/egonetwork-management-analytics/Internos.csv")
library(igraph)
int <- as.matrix(Internos)
net1 <- graph_from_edgelist(int, directed = FALSE)
summary(net1)
plot(net1, 
     displaylabels = TRUE, 
     edge.width=0.5,
     vertex.label.cex=0.6,
     vertex.shape = "circle",
     vertex.color = "white",
     vertex.frame.color = "gray",
     vertex.label.font=1, 
     layout =   layout_as_star)

