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

library(ggplot2)

# Converter a tabela em um data frame para usar com ggplot
df_comptage_types_vehicules <- as.data.frame(comptage_types_vehicules)
df_comptage_types_vehicules$Type <- rownames(df_comptage_types_vehicules)

# Gráfico 1: ggplot para número de modelos de carros por tipo
ggplot(df_comptage_types_vehicules, aes(x = Type, y = Freq)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Nombre de Modèles de Voitures par Type", x = "Type de Véhicule", y = "Nombre de Modèles")

# Gráfico 2: ggplot para número de modelos de carros por tipo (ordenado)
df_comptage_types_vehicules <- df_comptage_types_vehicules[order(df_comptage_types_vehicules$Freq),]
ggplot(df_comptage_types_vehicules, aes(x = Type, y = Freq)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Nombre de Modèles de Voitures par Type (Ordonné)", x = "Type de Véhicule", y = "Nombre de Modèles") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Gráfico 3: ggplot para número de modelos de carros por tipo (horizontal, ordenado)
ggplot(df_comptage_types_vehicules, aes(x = Type, y = Freq)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Types de Véhicules", x = "Nombre de Modèles", y = "Type de Véhicule") +
  coord_flip() +
  theme(axis.text.y = element_text(size = 9))

