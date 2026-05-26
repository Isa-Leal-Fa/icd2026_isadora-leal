# Arquivo: 01-avaliacao-resolucao.R
# Integrante 1: Evelyn Cristine Marçal Leal
# Integrante 2: Isadora Leal Faria
# Integrante 3: Kerollayne Borges Oliveira Souza
# Integrante 4: Sara Pâmela Ferreira
# Data: 28/04/2026
# Objetivo: Resolução da Avaliação 1 — Introdução à Ciência de Dados


# Configurações globais -----------------------------------------------

options(digits = 5, scipen = 999)

# carrega os pacotes usados (Exercício 1)
library(here)
library(tidyverse)


# Exercício 1 -----------------------------------------------------------

# importa o arquivo agencias.csv

# define o caminho relativo do arquivo usando a função here():
caminho_agencias <- here("dados/brutos/agencias.csv")

# importa o arquivo com a função read_csv:
dados_agencias <- read_csv(caminho_agencias)
  
  
# inspeciona a estrutura do objeto
glimpse(dados_agencias) 
  
# importa o arquivo credito_trimestral.csv
  
  # define o caminho relativo do arquivo usando a função here():
  caminho_credito <- here("dados/brutos/credito_trimestral.csv")
  
  # importa o arquivo com a função read_csv:
  dados_credito <- read_csv(caminho_credito)
  
  # inspeciona a estrutura do objeto
  
  glimpse(dados_credito)
  
  # Exercício 2 ----------------------------------------------------------

# 2.a)
  
  dados_agencias_plenas <- dados_agencias |> 
    filter(tipo_agencia == "Plena")
  
  View(dados_agencias_plenas)

# 2.b)
  
  dados_agencias |> 
    select("nome_agencia","cidade", "num_cooperados") |> 
    arrange(desc("num_cooperados"))

  view(dados_agencias)
  
# 2.c)
dados_agencias |> 
  filter(cidade == "Divinópolis" & num_cooperados > 1000)

view(dados_agencias)


# Exercício 3 ---------------------------------------------------------

# 3.a) pivot_longer

# reorganiza os dados de crédito em trimestre e volume_credito
dados_credito_longo <- dados_credito |>
  pivot_longer(
    cols = T1:T4,
    names_to = "trimestre",
    values_to = "volume_credito"
  )

# exibe a estrutura
glimpse(dados_credito_longo)
  
  

  # 3.b) left_join
  
  # combina `dados_credito_longo`com `dados_agencias`
  dados_completos <- dados_credito_longo |>
    left_join(dados_agencias, by = "codigo_agencia")
  
  # exibe a estrutura do objeto
  glimpse(dados_completos)
  
  # visualiza o objeto no RStudio
  View(dados_completos)
  
  # Exercício 4 ---------------------------------------------------------

# cria dados_analise com credito_por_cooperado
dados_analise <- dados_completos |> 
    mutate(credito_por_cooperado = volume_credito / num_cooperados)
  
  View(dados_analise)
  
  
  # resume por cidade e ordena por volume_total
  dados_analise |>
    group_by(cidade) |> 
    summarise(
      volume_total = sum(volume_credito),
      media_dos_creditos_por_cooperado = mean(volume_total)
    ) |> 
    arrange(desc(volume_total))
  
  
  # Resposta do Exercício 4:

  
  # Cidade com maior volume_total: Divinópolis
  # Cidade com maior media_dos_creditos_por_cooperado: Divinópolis 
  
  
  
  # Exercício 5 ---------------------------------------------------------

# classifica nivel_credito e resume por tipo_agencia
 resumo_por_tipo <- dados_analise |> 
    mutate(
      nivel_credito = case_when(
        credito_por_cooperado < 1400 ~ "Baixo",
        credito_por_cooperado >= 1400 & credito_por_cooperado < 1700 ~ "Médio",
        credito_por_cooperado >= 1700 ~ "Alto"
      )
    ) |> 
    group_by(tipo_agencia, nivel_credito) |> 
    summarise(
      volume_total = sum(volume_credito)
      n_obs  = n()
    ) |> 
    arrange(desc(volume_total))
  
resumo_por_tipo


# resolução 5

# Resposta do Exercício 4:
# Cidade com maior volume_total: Divinópolis
# Cidade com maior media_dos_creditos_por_cooperado: Formiga


# Exercício 5 ---------------------------------------------------------

# classifica nivel_credito e resume por tipo_agencia
resumo_por_tipo <- dados_analise |>
  mutate(
    nivel_credito = case_when(
      credito_por_cooperado < 1400 ~ "Baixo",
      credito_por_cooperado >= 1400 & credito_por_cooperado < 1700 ~ "Médio",
      credito_por_cooperado >= 1700 ~ "Alto"
    )
  ) |>
  group_by(tipo_agencia, nivel_credito) |>
  summarise(
    volume_total = sum(volume_credito),
    n_obs        = n()
  ) |>
  arrange(desc(volume_total))

# imprime o objeto
resumo_por_tipo