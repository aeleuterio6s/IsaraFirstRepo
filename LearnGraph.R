# Criar alguns dados de exemplo
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 7, 11)

# Criar o gráfico de dispersão
plot(x, y, 
     main = "Gráfico de Dispersão", # Título do gráfico
     xlab = "Eixo X",               # Rótulo do eixo X
     ylab = "Eixo Y",               # Rótulo do eixo Y
     col = "blue",                  # Cor dos pontos
     pch = 19)                      # Tipo de símbolo dos pontos

scatter_plot <- function(x, y, main_title = "Gráfico de Dispersão", x_label = "Eixo X", y_label = "Eixo Y", color = "blue", symbol = 19) {
  plot(x, y, main = main_title, xlab = x_label, ylab = y_label, col = color, pch = symbol)
}
histogram_plot <- function(data, main_title = "Histograma", x_label = "Valores", color = "blue") {
  hist(data, main = main_title, xlab = x_label, col = color)
}
# Criar alguns dados de exemplo
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 7, 11)
data <- c(3, 4, 4, 6, 6, 6, 7, 8, 8, 8)

# Criar e exibir o gráfico de dispersão
scatter_plot(x, y)

# Criar e exibir o histograma
histogram_plot(data)

# Criar e exibir o gráfico de dispersão personalizado
scatter_plot(x, y, main_title = "Meu Gráfico de Dispersão", color = "red", symbol = 17)

histogram_plot <- function(data, main_title = "Histograma", x_label = "Valores", color = "blue", breaks = NULL, ...) {
  hist(data, main = main_title, xlab = x_label, col = color, breaks = breaks, ...)
}
# Criar e exibir o histograma personalizado
histogram_plot(data, main_title = "Meu Histograma", color = "green", breaks = 8)

