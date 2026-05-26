# Arquivo: 04-lista-resolucao.R
# Autor(a): Isadora leal
# Data: 12/05/2026
# Objetivo: Resolução da Lista de Exercícios 4


# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)


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
prob_acertar_20 <-resultados_favoraveis/total_resultados
prob_acertar_20

# forma alternativa de interpretação: uma chance em quantas apostas?
uma_chance_em <- 1 /  prob_acertar_20
uma_chance_em


# d)
# Escreva sua interpretação como comentário.
## É baixa, pois O valor encontrado foi aproximadamente de 0,0000008793
# Isso significa que a chance de uma aposta acertar os 20 números sorteados é 
# muito baixa.


# Exercício 3 ------------------------------------------------

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <-  2:6
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
  size =n,
  replace = TRUE,
  prob = rep(1/6,6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <-mean(evento_A)
freq_relativa

# Depois de completar para n = 100, altere n para 1000 e 10000.

##1000

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <-  2:6

# resultados possíveis do dado
dado <- 1:6

# número de lançamentos
n <- 1000

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size =n,
  replace = TRUE,
  prob =rep(1/6,6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <-mean(evento_A)
freq_relativa


##10.000

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <-  2:6

# resultados possíveis do dado
dado <- 1:6

# número de lançamentos
n <- 10000

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size =n,
  replace = TRUE,
  prob = rep(1/6,6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <-mean(evento_A)
freq_relativa




# Exercício 5 ------------------------------------------------


# Cálculo do valor esperado com R

# parâmetros do modelo
prob_incendio <- 0.01
indenizacao <- 150000
carregamento <- 0.25

# valor esperado de indenização por residência
valor_esperado <- prob_incendio * prob_incendio

# exibe o resultado
valor_esperado

# prêmio anual por residência com acréscimo
premio <- valor_esperado * (1 + carregamento)

# exibe o resultado
premio


# a) O valor esperado de idenização é de R$1.500 por residência por ano 
#Ele representa a média teórica das idenizações por residência em 
#uma carteira grande de riscos semelhantes



# b) O valor esperado não significa que toda residência terá idenização 
#de r$1.500 .Para uma residência individual ,a idenização será r$0
#se não houver incêndio ou r$150.000



# c) o Calculo  é simplificado.ELE ignora despesas administrativas ,impostos,
#corretagem ,inadimplência ,capital regulatório ,resseguro ,eventos extremos 



# Exercício 6 ------------------------------------------------

# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- n * premio
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <-total_premios -total_indenizacoes
resultado_carteira

#Carteira com n=100000

#fixa a semente para reprodutibilidade 
set.seed(2)

#Tamanho da carteira de residências seguradas
n <-100000


#Simula a idenização de cada residência :0 ou valor total 

indenizacoes <-sample(
  x = c(0,indenizacao),
  size = n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

#Total arrecadado com premios
total_premios <- n * premio
total_premios

#resultado simplificado 
receita_carteira  <-total_premios -total_indenizacoes
resultado_carteira