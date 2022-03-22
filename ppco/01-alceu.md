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
