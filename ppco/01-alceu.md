# PMP - planejamento mestre da produção

- planejamento agregado é formatar a oferta, tudo eu que vou produzir, terei um outsourcing (comprar o produto inteiro ou grandes sistemas), o que é melhor para a empresa?
- obter a melhor alternativa de oferta, descobrir quanto e quando a empresa deve produzir, fazer outsourcing e/ou mudar o ritmo de produção
- é necessário saber a previsão da demanda, a disponibilidade dos recursos produtivos e condições de outsourcing

## Exercicio

Uma empresa precisa fazer o planejamento agregado para o ano todo. O custo unitário de produção é de R$ 50/ton e o custo unitário de estocagem por R$ 1,5/ton/dia útil. É possível alterar o ritmo de produção e os custos de admissão e de demissão, respectivamente, de $500 e $2000 por funcionário. A produtividade de cada funcionário é de 1 ton/dia útil e existe 10 funcionário no início de janeiro. Assim, a política de ritmo de 10ton/dia útil é eficaz para atender toda demanda?

A política de ritmo constante não vai conseguir atender a demanda o ano inteiro.

```{}
library(ggplot2)

tab <- tibble::tibble(
  mes = 1:12,
  demanda = c(100, 150, 175, 150, 200, 300, 350, 500, 650, 593, 200, 100),
  dias_produtivos = c(20, 18, 21, 21, 22, 22, 21, 10, 21, 22, 21, 18)
)

tab |>
  dplyr::mutate(
    demanda_acumulada = cumsum(demanda),
    estocagem = dias_produtivos * 1.5,
    custo_producao = demanda * 50,
    producao = dias_produtivos * 10,
    producao_acumulada = cumsum(producao),
    estoque = producao_acumulada - demanda_acumulada) |>
  tidyr::pivot_longer(
    cols = c("demanda_acumulada", "producao_acumulada"),
    names_to = "acumulado",
    values_to = "values"
  ) |>
  ggplot(aes(mes, values, color = acumulado)) +
  geom_line() +
  theme_bw()
```

Considerando ainda o ritmo constante de produção, qual deveria ser esse valor para conseguirmos atender o valor no ano inteiro? 16, pois passa no ponto de inflexão da reta

Qual seria o custo total envolvido de 16 funcionários ao longo do ano inteiro? 

library(ggplot2)

tab <- tibble::tibble(
  mes = 0:12,
  demanda = c(0, 100, 150, 175, 150, 200, 300, 350, 500, 650, 593, 200, 100),
  dias_produtivos = c(0, 20, 18, 21, 21, 22, 22, 21, 10, 21, 22, 21, 18)
)

# ritmo constante de prod de 16 ton/dia -----------------------------------

da <- tab |>
  dplyr::mutate(
    producao = dias_produtivos * 16,
    producao_acumulada = cumsum(producao),
    demanda_acumulada = cumsum(demanda),
    estoque = producao_acumulada - demanda_acumulada,
    lag_estoque = dplyr::lag(estoque),
    estoque_medio = (estoque + lag_estoque)/2,
    custo_estocagem = dias_produtivos * 1.5 * estoque_medio,
    custo_producao = producao * 50) 

tidy_da |>
  tidyr::pivot_longer(
    cols = c("demanda_acumulada", "producao_acumulada"),
    names_to = "acumulado",
    values_to = "values"
  ) 

tidy_da |>
  ggplot(aes(mes, values, color = acumulado)) +
  geom_line() +
  theme_bw()

# custo de admissão e de demissã0
## c_a * f_a  e c_d * f_d
## teríamos que ter 6 funcionarios a mais, para atingir 16
da |> 
  dplyr::summarise(
    custo_producao_total = sum(custo_producao),
    custo_estocagem_total = sum(custo_estocagem, na.rm =TRUE)) |> 
  dplyr::mutate(
    custo_admissao = 500 * 6
  ) |> 
  dplyr::rowwise() |> 
  dplyr::summarise(
    custo_total = sum(custo_producao_total, custo_estocagem_total, custo_admissao)
  )

# custo total de 

#b) 9 ton/dia de janeiro até final de junho e depois 29 ton/dia até  outubro
# e depois 12 ton/dia até dezembro

item_b <- tab |>
  dplyr::mutate( producao = dplyr::case_when(
    mes == 0 ~ 0,
    mes %in% 1:6 ~ dias_produtivos* 9,
    mes %in% 7:10 ~ dias_produtivos* 29,
    mes %in% 11:12 ~ dias_produtivos* 12),
    producao_acumulada = cumsum(producao),
    demanda_acumulada = cumsum(demanda),
    estoque = producao_acumulada - demanda_acumulada,
    lag_estoque = dplyr::lag(estoque),
    estoque_medio = (estoque + lag_estoque)/2,
    custo_estocagem = dias_produtivos * 1.5 * estoque_medio,
    custo_producao = producao * 50) 

item_b |>
  tidyr::pivot_longer(
    cols = c("demanda_acumulada", "producao_acumulada"),
    names_to = "acumulado",
    values_to = "values"
  ) |> 
  ggplot(aes(mes, values, color = acumulado)) +
  geom_line() +
  theme_bw()

da |> 
  dplyr::summarise(
    custo_producao_total = sum(custo_producao),
    custo_estocagem_total = sum(custo_estocagem, na.rm =TRUE)) |> 
  dplyr::mutate(
    custo_admissao = 500 * 20,
    custo_demissao = 2000 * 21
  ) |> 
  dplyr::rowwise() |> 
  dplyr::summarise(
    custo_total = sum(custo_producao_total, custo_estocagem_total, custo_admissao)
  )


#c) 12 ton/dia de janeiro até final de julho e depois 27 ton/dia até  outubro
# e depois 12 ton/dia até dezembro






