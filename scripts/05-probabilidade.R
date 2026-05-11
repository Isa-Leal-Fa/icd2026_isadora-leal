# Arquivo: 05-probabilidade.R
# Autor: Isadora leal
# Data: 11/05/2026
# Objetivos:
# 1. Praticar cálculos básicos de probabilidades
# 2. Praticar conceitos básicos de simulação de Monte Carlo

# Configuracoes globais -----------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)


# Pacotes usados ------------------------------------------------------

library(tidyverse)
library(probs) # instale esse pacote

# Solução do exemplo 1
# A função tosscoim simula o lançamento de moedas
# Espaço amostral do lançamento de uma moeda 3 vezes
tosscoin(times = 3)

# Solução do exemplo 2
# A função choose(n, k) calcula o número de combinações possíveis:
# No caso da megasena, temos n=60 e k=6
# para exibir os números sem notação científica
options(scipen = 999)

choose(60,6)

# para exibir os números sem notação científica
options(scipen = 999)

# prob. de acertar os 6 números da megasena com 1 aposta
1/choose(60,6)


# Simulando o lançamento de um dado

# fixa a semente para reprodutibilidade
set.seed(123)

# cria um vetor de 1 até 6 (faces)
dado <- 1:6                                 

# define o n. de lançamentos do dado
n <- 10 

# simula os 10 lançamentos
lançamentos <- sample(dado, size = 10, replace = TRUE)
lançamentos


# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada