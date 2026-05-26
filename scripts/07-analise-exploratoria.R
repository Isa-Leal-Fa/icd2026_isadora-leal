# Arquivo: 07-analise-exploratoria.R
# Autor(a): Isadora Leal
# Data: 25/05/2026
# Objetivos:
# 1. Calcular estatísticas descritivas amostrais.
# 2. Visualizar a distribuição empírica dos dados.
# 3. Comparar padrões entre grupos.

# 0. Configurações globais ---------------------------------------------

# Controla a forma como os valores numéricos aparecem no console.
options(digits = 5, scipen = 999)

# Carrega os pacotes usados para caminhos, manipulação e visualização.
library(here)
library(tidyverse)
library(tidyplots)


# 1. Carregamento dos dados --------------------------------------------------


# Permite que os gráficos do tidyplots usem o espaço disponível.
tidyplots_options(width = NA, height = NA)

# Usa um caminho relativo ao projeto para encontrar os dados limpos.
caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")

# Carrega os dados de marketing preparados na Lista 2.
dados_marketing <- read_rds(caminho_dados)

# Confere variáveis, tipos e primeiras observações dos dados.
glimpse(dados_marketing)


# 2. Inspeção inicial -----------------------------------------------------

# Verifica o tamanho dos dados: quantidade de linhas e colunas.
dim(dados_marketing)

# Lista os nomes das variáveis disponíveis.
names(dados_marketing)

# Mostra as primeiras linhas para uma inspeção rápida dos dados.
head(dados_marketing)

# Conta quantas semanas aparecem em cada status de promoção.
dados_marketing |>
  count(status_promocao)


# 3. Primeira inspeção estatística da receita -----------------------------

# Calcula estatísticas iniciais da receita semanal de vendas.
inspecao_receita <- dados_marketing |>
  summarize(
    n = n(),
    minimo = min(receita_vendas),
    maximo = max(receita_vendas),
    amplitude = max(receita_vendas) -
      min(receita_vendas)
  )
# Mostra a tabela de inspeção no console.
inspecao_receita


# 4. Distribuição empírica da receita -------------------------------------

# Visualiza como a receita semanal se distribui nos dados observados.
# tidyplot() inicia o gráfico e add_histogram() adiciona o histograma.
# O argumento bins controla a quantidade de classes do histograma.
dados_marketing |>
  tidyplot(x = receita_vendas) |>
  add_histogram(bins = 20)

x <- c(1,2,1000)
mean(x) # calcula a média
median(x) # calcula a mediana 



# 5. Valores típicos da receita -------------------------------------------

# Calcula média e mediana para descrever o centro da distribuição.
centro_receita <- dados_marketing |>
  summarize(
    media = mean(receita_vendas),
    mediana = median(receita_vendas)
  )

centro_receita


# 6. Quantis da receita ---------------------------------------------------

# Calcula posições importantes da distribuição empírica da receita.
quantis_receita <- dados_marketing |>
  summarize(
    q1 = quantile(receita_vendas, 0.25),
    mediana = quantile(receita_vendas, 0.50),
    q3 = quantile(receita_vendas, 0.75),
    p90 = quantile(receita_vendas, 0.90)
  )

quantis_receita


# 7. Variabilidade da receita  --------------------------------------------

# Calcula estatísticas de variabilidade da receita semanal.
estatisticas_variabilidade <- dados_marketing |>
  summarize(
    variancia = var(receita_vendas),
    desvio_padrao = sd(receita_vendas),
    iqr = IQR(receita_vendas),
    amplitude = max(receita_vendas) -
      min(receita_vendas)
  )

estatisticas_variabilidade



# 8. Boxplot da receita ---------------------------------------------------

# Visualiza mediana, quartis, variabilidade central e possíveis extremos.
dados_marketing |>
  tidyplot(y = receita_vendas) |>
  add_boxplot()


# 9. Comparação por status de promoção ------------------------------------

# Compara semanas com e sem promoção; isto não estima efeito causal.
estatisticas_promocao <- dados_marketing |> 
  group_by(status_promocao) |> 
  summarize(
    n = n(),
    media = mean(receita_vendas),
    mediana = median(receita_vendas),
    desvio_padrao = sd(receita_vendas),
    q1 = quantile(receita_vendas, 0.25),
    q3 = quantile(receita_vendas, 0.75)
  )

# exibe o objeto
estatisticas_promocao


# Compares visualmente a receita semanal entre os grupos de promoção.
dados_marketing |> 
  tidyplot(x = status_promocao, y = receita_vendas) |> 
  add_boxplot()


#  10. Coeficiente de variação  -------------------------------------------

# Calcula a variabilidade relativa da receita como percentual da média.
cv_receita <- dados_marketing |> 
  summarize(
    media = mean(receita_vendas),
    desvio_padrao = sd(receita_vendas),
    cv_percentual = 100 * desvio_padrao / media
  )

cv_receita

