# Arquivo: revisao-probabilidade.R
# Autor: Isadora Leal
# Data: 08/06/2026
# Objetivos:
# Exercícios de revisão para a avaliação 2

# Configurações globais -------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)

# Orientação:
# Nos Exercícios 1, 2 e 3, escreva as respostas como comentários.
# No Exercício 4, complete e execute o código em R.



# a) Um possível espaço amostral é: S = {compra, não compra}
# Também seria aceitável escrever:
# S = {realiza compra, não realiza compra}
# ou outra redação equivalente.

# b) Um evento associado à realização de compra é: A = {compra}
# Em palavras: A é o evento "o cliente realiza compra".

# c) A probabilidade desse evento pode ser escrita como:
# P(A)
# ou
# P(cliente realiza compra).

# d) Antes de definir uma variável aleatória, o resultado observado não é
# diretamente numérico.
# Ele é qualitativo/binário: compra ou não compra.
# Ele só passa a ser representado numericamente depois que definimos X.

# e) Uma variável aleatória indicadora adequada é:
# X = 1 se o cliente realiza compra;
# X = 0 se o cliente não realiza compra.
#
# Com essa definição, o evento A = {compra} também pode ser escrito
# como X = 1. Assim, P(A) = P(X = 1).


# a) X pode assumir dois valores:
# X = 500, quando a garantia é acionada;
# X = 0, quando a garantia não é acionada.

# b) P(X = 500) = 0,04.

# c) P(X = 0) = 1 - 0,04 = 0,96.

# d) Valor esperado de X:
# E(X) = X1 * P(X = 500) + X2 * P(X = 0)
# E(X) = 500 * 0,04 + 0 * 0,96 
# E(X) = R$ 20

# e) Interpretação:
# O custo esperado da garantia é R$ 20 por produto vendido.
# Isso não significa que cada produto terá custo de R$ 20.
# Individualmente, o custo será R$ 0 ou R$ 500.
# O valor esperado resume o custo médio por produto quando pensamos
# em muitos produtos vendidos sob as mesmas condições.


# a) Bernoulli: há uma única observação com dois resultados possíveis
#    compra ou não compra.

# b) Binomial: conta o número de sucessos em um número fixo de tentativas
#    semelhantes, neste caso 300 clientes contatados.

# c) Poisson: conta ocorrências em um intervalo fixo de tempo,
#    neste caso o número de chegadas em uma hora de pico.

# d) Normal: variável numérica contínua, com valores aproximadamente
#    simétricos em torno de uma média.


# Exercício 4 ------------------------------------------------

# fixa a semente para reprodutibilidade
set.seed(123)

# define os parâmetros da simulação
lambda <- 12
capacidade <- 15
n_simulacoes <- 1000

# item a) simula 1.000 realizações de X
# cada valor é uma contagem de clientes em uma hora de pico
clientes <- rpois(n = n_simulacoes, lambda = lambda)
# exibe as primeiras contagens simuladas de clientes
head(clientes)


# item b) calcula a média simulada de clientes por hora de pico
media_simulada <- mean(clientes)
media_simulada


# item c) calcula a proporção de simulações em que a capacidade
# de 15 clientes foi excedida pela contagem de clientes
prop_acima_capacidade <- mean(clientes > capacidade)
prop_acima_capacidade


# item d) calcula o percentil 95 da contagem de clientes por hora de pico
percentil_95 <- quantile(clientes, 0.95)
percentil_95


# Exercício 4 ------------------------------------------------

# item e) interpretação
# A média simulada ficou próxima de 12 clientes por hora, como esperado
# pelo modelo Poisson(lambda = 12).
#
# A capacidade de 15 clientes foi excedida em cerca de 14,4% dos valores
# simulados. Portanto, em uma hora de pico sob esse modelo, a unidade ficaria
# acima da capacidade com alguma frequência.
#
# O percentil 95 foi igual a 18. Nesta simulação, isso indica que uma
# capacidade de 18 clientes por hora cobriria cerca de 95% das simulações.
#
# Assim, se a prioridade for reduzir saturação no horário de pico,
# a capacidade atual de 15 clientes por hora parece limitada. Se a unidade
# aceitar alguma espera em parte das horas de pico, essa capacidade ainda
# pode ser defendida, mas com risco operacional visível.
