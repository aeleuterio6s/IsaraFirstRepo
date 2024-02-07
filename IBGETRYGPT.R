
library(ggplot2)
library(readxl)
library(dplyr)

# Ler os dados do arquivo Excel
dados <- read_excel("C:/Users/6spro/Downloads/Censo 2022 - Pirâmide etária - Brasil.xlsx")

# Visualizar as primeiras linhas dos dados
head(dados)

# Resumo estatístico dos dados
summary(dados)

# Estrutura dos dados
str(dados)

# Ajustar a ordem dos grupos de idade
dados$`Grupo de idade` <- factor(dados$`Grupo de idade`, levels = rev(dados$`Grupo de idade`))

# Combinar os dados masculinos e femininos em uma única coluna
dados <- dados %>%
  mutate(Populacao = `População feminina(pessoas)`, Genero = "Feminino") %>%
  bind_rows(dados %>%
              mutate(Populacao = -`População masculina(pessoas)`, Genero = "Masculino"))

# Criar o gráfico de barras empilhadas
grafico <- ggplot(dados, aes(x = `Grupo de idade`, y = Populacao, fill = Genero)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribuição da População por Grupo de Idade e Gênero",
       x = "Grupo de Idade", y = "População", fill = "Gênero") +
  scale_fill_manual(values = c("Feminino" = "pink", "Masculino" = "blue")) +
  theme_minimal() +
  theme(legend.position = "top") +
  scale_y_continuous(labels = scales::comma, breaks = seq(-10000000, 10000000, by = 1000000)) +
  coord_flip() +
  scale_x_discrete(labels = function(x) stringr::str_wrap(x, width = 10))

# Exibir o gráfico
print(grafico)

