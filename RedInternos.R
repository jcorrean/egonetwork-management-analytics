library(readr)
Internos <- read_csv("/home/jcc/Documents/GitHub/egonetwork-management-analytics/Internos.csv")
library(igraph)
int <- as.matrix(Internos)
#net1 <- graph_from_edgelist(int, directed = FALSE)
net1 <- graph_from_data_frame(Internos, directed = FALSE)

plot(net1,
     displaylabels = TRUE,
     edge.width = E(net1)$width, # Usar los pesos para el grosor de las aristas
     vertex.label.cex = 0.6,
     vertex.shape = "circle",
     vertex.color = "white",
     vertex.frame.color = "gray",
     vertex.label.font = 1,
     layout = layout_as_star)


E(net1)$width <- E(net1)$Dinero/180

# Identificar el primer nodo de la columna "From"
primer_nodo <- Internos$From[1]

# Visualizar la red con colores condicionales
plot(net1,
     displaylabels = TRUE,
     edge.width = E(net1)$width,
     vertex.label.cex = 0.6,
     vertex.shape = "circle",
     vertex.color = ifelse(V(net1)$name == primer_nodo, "red", "white"), # Colores condicionales
     vertex.frame.color = "gray",
     vertex.label.font = 1,
     layout = layout_as_star)
