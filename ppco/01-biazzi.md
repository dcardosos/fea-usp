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

|      **Hipótese**          |              **Equação de projeção**
-----------------------------|------------------------------------------------
        Permanência          |  E(t) = S(t_0) ---- S(t_0) = [Soma V(t)] / N
-----------------------------|------------------------------------------------
        Trajetória           |  E(t) = 
-----------------------------|
Sazonalidade com permanência |
-----------------------------|
Sazonalidade com trajetória  |
-----------------------------|

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
- Fórmula supondo alpha 0,2: S(t_0) = 0,2 * 84 + 0,8 * 78

#### Recursividade

Quanto mais evelho o valor, menos importância ele tem.

$$

E(t_0 + 1) = S(t_0) = \alpha * V(t_0) + (1 - \alpha) * E(t_0)

E(t_0) = S(t_0 - 1) = \alpha * V(t_0 - 1) + (1 - \alpha) * E(t_0 - 1)

E(t_0 + 1) = \alha * V(t_0) + (1 - \alpha) * [\alpha * V(t_0 - 1) + (1- \alpha) * E(t_0 - 1)]

E(t_0 + 1) = \alpha * V(t_0) + (1 - \alpha) * \alpha * V(t_0 - 1) + (1 - \alpha)^2 * [\alpha * V(t_0 - 2) + (1 - \alpha) * E(t_0 - 2)]

E(t_0 + 1) = \alpha * V(t_0) + (1 - \alpha) * \alpha * V(t_0 - 1) + (1 - \alpha)^2 *  \alpha * V(t_0 - 2) + (1 - \alpha)^3 * E(t_0 - 2)

$$

- t_0 = 0, 2
- t_1 = 0,16
- t_2 = 0,128
- t_3 = 0,1024





