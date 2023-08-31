gcinfo(TRUE)

measure_properties <- function(graph, directed.info = TRUE,
loops.info = TRUE, 
component.info = "weak",
motif.info = 3){
gc(reset = TRUE)
results <- list()
## Property List
# Average Path Length: Average length of edges between all vertices. 
## ! function: igraph::mean_distance()
results[1] <- igraph::mean_distance(graph, directed = directed.info, unconnected = TRUE)
# Average Local Efficiency: proportional to the distance between nodes (negative.) for every node. 
## ! function: igraph::average_local_efficiency()
results[2] <- igraph::average_local_efficiency(graph, directed = directed.info, mode = "all")
# Centralization Degree #Normalized. 
## ! function: igraph::centr_degree()
results[[3]] <- igraph::centr_degree(graph, mode = "all", loops = loops.info)
# Number of Components:: Number of islands in a graph, not connected to each other, but complete connection between nodes within themselves.
## ! function: igraph::count_components()
results[4] <- igraph::count_components(graph, mode = component.info)
# Motifs: Patterns in subgraphs, 16 possible combinations. List is given at 
#https://wandb.ai/syllogismos/machine-learning-with-graphs/reports/3-Motifs-and-Structural-Roles-in-Networks--VmlldzozNzU1NTg
## ! function: igraph::count_motifs(n = 3, 4)
results[[5]] <- igraph::motifs(graph, size = motif.info)
#Diameter: Diameter of the biggest component in a graph. 
## ! function: igraph::diameter()
results[6] <- igraph::diameter(graph, directed = directed.info)
names(results) <- c("Mean_Distance","Local_Eff","Degree_Centr","n_Component","Motif_Count","Diameter")
return(results)
}


