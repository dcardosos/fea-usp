## Previsão de demanda

Em qualquer horizonte de planejamento, é necessário saber qual vai ser a demanda. Se ela for mais feita, você dimensiona uma operação muito abaixo ou muito acima. A gente sempre erra tentando prever a demanda, por isso trabalhamos com faixas e margens de segurança para lidar com a incerteza da previsão. No médio prazo, existem decisões para usar a estrutura disponível, com tempo mais curto, normalmente 12 meses, trabalhando de 1 em 1 mês. No curto prazo, as empresas ainda vão precisar de demanda para tomar decisões. Por exemplo, varejo, tentar prever para reposição de produtos. Algumas empresas chamam de planejamento de demanda, mas não é interessante, porque pressupõe que você tem a possibilidade de interferir na demanda do produto, o que de fato acontece, mas em alguns casos, como contratação de pessoas, compra de equipamentos. Todas as áreas precisa saber qual a demanda para poder dimensionar seus produtos.

Manufaturas e suprimento tem algumas funções, coomo estoque de matéria prima, operação do produto e estoque de produto acabado. Isso muda, por exemplo, em empresas de construção civil não tem estoque de matérias-prima, normalmente o negócio é fechado e só depois procura os elementos necessários para a operação. Para transporte e serviço, por exemplo, temos uma operação que é feita para atender uma fila de clientes. Em alguns casos, a empresa pode direcionar pelas matérias primas, como uma empresa que produz armários embutidos que pode comprar antecipadamente dobradiças, chapas e outros mesmo sem ter a ideia de como será exatamente o produto acabado.

## Métodos de previsão

Em decisões de curto e médio prazo, normalmente a projeção basta.

A **projeção** é o comportamento do passado que se repetirá no futuro, extrapola o comportamento do passado para o futuro.

$$V(t) = f(t) + e * alpha_v(t)$$

A **explicação** é uma lei de dependência entre variáveis, no futuro, será a mesma verificada no passado. Uma relação que no passado valeu e continua valendo. Extrapola as relações do passado.

$V(t) = f[X_1(t), X_2(t), ..., X_N(t)] + e * alpha_v(t)$$

A **predição** é onde o futuro não guarda relação nenhuma com o passado.

## Projeção

Empresa sempre prevê demanda, não venda. Demanda é o que o mercado gostaria de ser atendido, venda a gente planeja e depois executa.

$$V(t) = f(t) + e * alpha_v(t)$$

- V: demanda
- componentes de f(t): base, tendência, sazonalidade, ciclicidade (séries longas)
- componentes de e * alpha_v(t): aleatoriedade

- Histórico de demanda é a soma das vendas com histórico de potencial de vendas.
- A base é o patamar atual do produto, quando o histórico se encontra com o presente
- A tendência é pra onde vai a curva na média
- Sazonalidade abrange padrões de movimentos que ocorrem no tempo, com um comportamento fora da média
- Ciclicidade: séries longas, sazonalidade mas considerando anos, apenas o tempo explica, a cada 4 anos televisores são mais comprados


##  Moving average

- useful in removing the random fluctuations for forecasting if it does not have seasonal *characteristics*
- longer moving-average period = greater the random elements are smoothed

$$
F_t = \frac{A_{t-1} + A_{t-2} + A_{t-3} + ... + A_{t-n}}{n}
$$

where:
- $F_t$ = forecast for the coming period
- $n$ = number of periods to be averaged
- $A_{t-1} = actual occurrence in the past period

```{r}

da <- readr::read_csv('ex_demand_moving_average.csv')

da |>
  dplyr::mutate(
    three_week = zoo::rollmean(
      x = demand,
      k = 3,
      fill = NA,
      align = 'right'),
    nine_week = zoo::rollmean(
      x  = demand,
      k = 9,
      fill = NA,
      align = 'right'
    )
  ) |>
  tidyr::pivot_longer(
    cols  = demand:nine_week,
    names_to = 'labels',
    values_to = 'values'
  ) |>
  ggplot2::ggplot(ggplot2::aes(week, values, color = labels)) +
  ggplot2::geom_line() +
  ggplot2::theme_bw()

```

## Weighted moving average

- allow any weights to be placed on each element, providing, of course, that the sum of all weights equals 1
- example:
  - uma empresa acredita que para uma previsão melhor considerando 4 meses, e preciso utilizar 40% das vendas atuais para o mês mais recente, 30% para dois meses atrás, 20% para três meses atrás e 10% para 4 meses atrás, ou seja, atribui pesos diferentes a cada mês, sendo que esse peso vai decaindo ao decorrer do tempo

$$
F_t  = w_1 A_{t-1} + w_2 A_{t-2} + ... + w_n A_{t-n}
$$

where $w$ is the weight.

### Choosing weights

- most recent past is the most important indicator of what to expect in the future and therefore should get higher weighting
- if data is seasonal, weights should be established accordingly

## Exponential Smoothing

- each increment in the past is decreased by $(1 - \alpha)$
- most used of all forecasting techniques, because:
  - accurate
  - easy
  - understandable
  -  little computational power
  - storage is small
  - easy test for accuracy forecast
- are needed: most recent forecast, actual demand that occurred for that forecast period and a smoothing constant alpha
- the higher the value of alpha, the more closely the forecast follow the actual
-
$$
F_t = F_{t-1} + \alpha(A_{t-1} - F_{t-1})
$$

where:
- F = exponentially smoothed forecast
- A = actual demand


## Permanência

A demanda é estável, então para calcular é o simples $S(t_0)$, onde $S$ é a média do ponto que se encontra com a linha de $t_0$. $S$ é o patamar da demanda no momento $t_0$. O instante $t_0$ é o último ponto onde temos uma demanda conhecida. Média corrida ou média móvel é a mais simples que temos, onde tiramos a média do que aconteceu antes. Na hipótese de permanência, a reta será sempre a mesma até surgir uma nova informação no histórico de demanda. Qual o tamanho do nosso histórico? Qual o erro de previsão em função de adotar diferentes níveis de histórico.

### Suavização exponencial

É uma média ponderada, onde o peso será de acordo com o quão recente o valor é, quanto mais recente, mais peso, mais importância terá. Temos $\alpha$ como um dos coeficientes de suavização, é o quanto iremos corrigir para cima ou para baixo de acordo com qual foi o valor real da estimativa. Uma das vantagens é que não precisamos guardar todo histórico, apenas a última estimativa e a demanda correspondente. Para decidir o $\alpha$ , temos que testar, normalmente fica em 0,3 e 0,5. A equação é recursiva:  

$$
S(t_0) = \alpha . V(t_0) + (1- \alpha) . E(t_0)
$$

- S(t_0 - 1) = 78
- E(t_0) = 78
- V(t_0) = 84 (o que foi de fato)
- Fórmula supondo alpha 0,2 : S(t_0) = 0,2 * 84 + 0,8 * 78


## Sazonalidade com permanencia
### média corrida

- S(t0) = média dos valores anteriores
- média dos fatores de sazonalidade tem que dar um
- quanto mais granular, mais fatores de sazonalidade, então teremos uma série de estimativas, pra isso precisamos calcular os erros para cada base utilizada

### Suavização exponencial

- primeiro vamos atualizar a base (S(t_0)), para ter como referências demandas reais e não estimadas, ponderação, por meio de um alfa, entre a demanda desazonalizada e a base anterior
- alpha = peso que a gente vai dar para o patamar de demanda que teria gerado o 170 (a demanda real), por isso divimos ela pelo fator de sazonalidade
- vamos atualizar apenas um fator de sazonalidade, aplicando um gama, dividir a demanda real pelo novo S(t_0) eu tenho a sazonalidade desse período

## Sazonalidade com trajetória

- fator de sazonalidade que multiplica um ponto na reta média

### média corrida

- fazer uma regressão linear para calcular a reta média
- a base da demanda é um ponto na reta media
- R_{t_0} é o $b$ da reta, tendência atual
- vamos calcular todos os pontos na reta média, dividindo o real pela média, e depois fazendo a média de todos os resultados (para cada período)
- R^2 não funciona com sazonalidadem porque os pontos estão distante da reta média
- S(t_0) será a + b . t_0


### suavização exponencial
- atualizar a base da demanda, a inclinação e o fator de sazonalidade
- qual que seria a base que justificaria a demanda real considerando o fator de desazonalidade atual?
  - desazonalizar o real, volta ao valor que estaria na reta média
