# Charger la bibliothèque MASS et les données Cars93
library(MASS)
data("Cars93")

# Calculer le décompte des types de véhicules
comptage_types_vehicules <- table(Cars93$Type)

# Créer des graphiques à barres des types de véhicules
par(mfrow=c(3, 1), mar=c(5, 5, 2, 1))

# Graphique 1 : Nombre de modèles de voitures par type
barplot(comptage_types_vehicules, main="Nombre de Modèles de Voitures par Type")

# Graphique 2 : Nombre de modèles de voitures par type (ordonné)
barplot(sort(comptage_types_vehicules), main="Nombre de Modèles de Voitures par Type (Ordonné)")

# Graphique 3 : Nombre de modèles de voitures par type (horizontal, ordonné)
barplot(rev(sort(comptage_types_vehicules)), main="Types de Véhicules",
        las=1, horiz=T, cex.names=1.2, col="gold", border=NA, space=1,
        xlab="Nombre de Modèles")

