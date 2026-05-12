# Arquivo: 04-lista-resolucao.R
# Autor(a): Isadora leal
# Data: 12/05/2026
# Objetivo: Resolução da Lista de Exercícios 4

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)

# Pacotes usados

library(tidyverse)
library(probs)

# exercicio 1

# a. Qual é um possível espaço amostral para esse experimento?
# RESPOSTA: S = {Adimplente, Inadimplente}
  
# b. Defina um evento associado à inadimplência.
# RESPOSTA: A = {Adimplente, Inadimplente}

# c. Como escreveríamos a probabilidade desse evento?
# RESPOSTA: P(A) = {Inadimplente}
  
# d. O resultado desse experimento é diretamente numérico? Justifique.
# RESPOSTA: O resultado bruto do experimento é qualitativo (categórico), 
#pois se refere a um estado ou atributo do contrato (o "status" de pagamento). 
#Para que possamos realizar cálculos estatísticos ou modelagem matemática, 
# precisamos converter esses atributos em números 
# por meio de uma variável aleatória.

# e.Defina uma variável aleatória x para representar inadimplência numericamente
# RESPOSTA: 
# X = 1, se o contrato estiver Inadimplente;
# X = 0, se o contrato estiver Adimplente.


# Exercício 2 ------------------------------------------------

# a)
# total de conjuntos diferentes de 20 números sorteados entre 100
total_resultados <- choose(100,20)
total_resultados


# b)
# resultados favoráveis: os 20 números sorteados precisam estar
# dentro dos 50 números escolhidos na aposta
resultados_favoraveis <- choose(50,20)
resultados_favoraveis


# c)
# probabilidade de acertar os 20 números
prob_acertar_20 <- choose(50,20) /choose(100,20)
prob_acertar_20

# forma alternativa de interpretação: uma chance em quantas apostas?
uma_chance_em <- 1 /total_resultados
uma_chance_em


# d)
# Escreva sua interpretação como comentário.
# A probabilidade é considerada muito baixa pois é 20 casas
# abaixo de 0


# Exercício 3 ------------------------------------------------

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- 2:6
prob_teorica

# resultados possíveis do dado
dado <- 1:6

# número de lançamentos
n <- 100

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE
)
lancamentos

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <- mean(evento_A)
freq_relativa

# Depois de completar para n = 100, altere n para 1000 e 10000.



# Exercício 5 ------------------------------------------------


# Cálculo do valor esperado com R

# parâmetros do modelo
prob_incendio <- 0.01
indenizacao <- 150000
carregamento <- 0.25

# valor esperado de indenização por residência
valor_esperado <- ___ * ___

# exibe o resultado
valor_esperado

# prêmio anual por residência com acréscimo
premio <- ___ * (1 + ___)

# exibe o resultado
premio


# a) 


# b) 


# c) 



# Exercício 6 ------------------------------------------------

# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(___, ___),
  size = ___,
  replace = TRUE,
  prob = c(1 - ___, ___)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- ___(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- ___(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- ___ * ___
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- ___ - ___
resultado_carteira

# Depois de completar para n = 100, altere n para 10000 e 100000.

# a) 


# b) 


# c) 


# d) 