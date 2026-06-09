# Arquivo: 02-avaliacao-resolucao.R
# Integrante 1: Evelyn Cristine Marçal Leal
# Integrante 2: Isadora Leal Faria
# Integrante 3: Kerollayne Borges Silva
# Integrante 4: Sara Pâmela Ferreira
# Data: 09/06/2026
# Objetivo: Resolução da Avaliação 2 — Introdução à Ciência de Dados


# Configurações globais ---------------------------------------
options(digits = 5, scipen = 999)

# Exercício 1 -------------------------------------------------

# a) Um possível espaço amostral é: S = {renovou ou não renovou}
#

# b) Um evento associado à renovação do contrato. é: A = {renovação}
# Em palavras: A é o evento "o cliente realiza a renovação".
#

# c) A probabilidade desse evento pode ser escrita como:
# P(A)

# d) Antes de definir uma variável aleatória, o resultado observado não é
# diretamente numérico.
# Ele é qualitativo/binário: renova ou não renova
# Ele só passa a ser representado numericamente depois que definimos X.

# e) Uma variável aleatória indicadora adequada é:
# X = 1 se o cliente realiza a renovação;
# X = 0 se o cliente não realiza a renovação
#
# Com essa definição, o evento A = {renovação} também pode ser escrito
# como X = 1. Assim, P(A) = P(X = 1).

# f) A distribuição de probabilidade que mais se adequa para representar essa 
# variavel é a Bernoulli, pois ela é usada para uma unica variavel,
# com apenas dois resultados possíveis, sucesso ou fracasso
# (No caso, renova ou não renova).


# Exercício 2 -------------------------------------------------

# a) 
# X pode assumir dois valores:
# X = 12, quando o cupom é utilizado;
# X = 0, quando o cupom não é utilizado


# b) 
# P(X = 12) = 0,1

# c)
# P(X = 0) = 1 - 0,1 = 0,9


# d)
# valor esperado de X:
# E(X) = X1 * P(X = 12) + X2 * P(X = 0)
# E(X) = 12 * 0,1 + 0 * 0,9
# E(X) = R$ 1,20


# e)
# O custo esperado do uso do cupom é de R$ 1,20 por produto vendido.
# Isso não significa que cada produto terá custo de R$ 1,20
# Individualmente, o custo será R$ 0 ou R$ 12
# O valor esperado resume o custo médio por produto quando pensamos
# em muitos produtos vendidos sob as mesmas condições.



# Exercício 3 -------------------------------------------------

# Digite e execute o código necessário e escreva a 
# interpretação em comentários.


# a) (1,0 pto) Defina os parâmetros da simulação: 
# média de clientes por hora de pico, capacidade atual e número de valores de 
# que serão simulados.

set.seed(123)

# define os parâmetros da simulação
lambda <- 10
capacidade <- 13
n_simulacoes <- 1000




# item b) Simula os valores de usando a função adequada do R
clientes <- rpois(n = n_simulacoes, lambda = lambda)
head(clientes)


# item c) calcula a média simulada de clientes por hora de pico
media_simulada <- mean(clientes)
media_simulada


# item d)  Calculo da proporção de valores 
# simulados em que a capacidade de 13 clientes foi excedida.
prop_acima_capacidade <- mean(clientes > capacidade)
prop_acima_capacidade


# item e) Valor do percentil 95 da contagem de clientes por hora de pico.
percentil_95 <- quantile(clientes, 0.95)
percentil_95


# item f) interpretação
# A média simulada ficou próxima de 10 clientes por hora, como esperado
# pelo modelo Poisson(lambda = 10).
#
# A capacidade de 13 clientes foi ultrapassada em cerca de 12,5% dos valores
# simulados. Portanto, em uma hora de pico sob esse modelo, a unidade ficaria
# acima da capacidade com alguma frequência.
#
# O percentil 95 foi igual a 15. Nesta simulação, isso indica que uma
# capacidade de 15 clientes por hora cobriria cerca de 95% das simulações.
#
# Assim, se a prioridade for reduzir saturação no horário de pico,
# a capacidade atual de 13 clientes por hora parece limitada. 
# Nesse caso, aumentar a capacidade para 15 clientes por hora seria mais 
# adequado, já que esse valor atenderia aproximadamente 
# 95% das situações simuladas.


