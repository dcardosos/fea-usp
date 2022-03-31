## titulos de emissão privada

- captação de crédito: um emissor e um credor
- titulo de divida: entrada de caixa para o emissor e no futuro, um valor para o portador do titulo
- taxa de juros, pode ser prefixada ou pós fixada
- ou levo até o fim ou vendo em qualquer momento, quando você transfere a portabilidade, para o emissor não muda nada, apenas uma transferência
- do ponto de vista de quem é o portador, se ele desfaz do contrato e vende antes do vencimento, ele vende para um terceiro que vai pagar um outro valor presente para mimm que será corrigida pelo juros do período
- CDIs, CDBs, debêntures, letras financeiras, notas promissórias
- CRIs, CRAs, LCIs, LCAs e FIDCs (fundos imobiliários de direto creditório)

## CDI - certificado de depósito interbancário
- emissor: instituições financeiras, maioria bancos
- isentos de IOF e IR na fonte
-  ao longo de um dia, os bancos terão fluxos de saídas e entradas, ao final do dia, as entradas serão diferentes da saída, para fechar o caixa, os bancos vão emprestar ou emprestam capital para outros bancos, para todos fecharem os caixas, e essas transações entre bancos são negociadas pela taxa de juros DI (que segue a SELIC)
-  DI over -> média diária CDI prefixado de 1 d.u.
- operacionalização da taxa em dias úteis (taxa efetiva)
- contratos de curtíssimos prazos
- por que essas transações não são taxadas, que são agentes de grande porte?
- não tem mercado secundário, o agente que receber o montante final não irá repassar o contrato, porque os contratos são de curtíssimos prazos, no máximo 5 dias

### exercicio
Banco opera CDI com valor principal de 500.000,00 por dois dias úteis. Taxa foi de 10,40% a.a.o e de 10,75% a.a.o nos respectivos dias.

- montante (do ponto de vista do credor):

  - instante 0: 500000
  - instante 1:
  - instante 2: valor futuro = valor presente * (1 + taxa), como a taxa não é constante, precisa incorporar as duas taxas, FV = 500000 (1 + 0,1040)^(1/252) (1+0,1075)^(1/252) = 500399,10

- taxa efetiva (i_f): (FV/PV) - 1 = 0,08% p/2d.u. (taxa do periodo)

- taxa média: calcula-se a taxa equivalente (i_q) = (1 + taxa efetiva)^(252/2) -1 = 10,57% a.a.o

## CDB/RDB (certificado/recibo de depósito bancário)

- emissor: apenas bancos, que recebem depósito em conta corrente
- por que o banco emite? para financiar suas atividades no mercado de crédito, pega o dinheiro para você e empresta para outra pessoa, a diferença entre as taxas que ele empresta e capta, será o **spread bancário**
- pré ou pós-fixado (IPCA, Selic, IGPM, CDI)
- IOF regressivo (96% a 0%) no resgate até 30 dias
- RDB não é transferível, CDB por endosso
- IR tributado no resgate, incide nos juros da transação, alíquota regressiva
- CDB: proteção Fundo Garantidor de Crédito (até R$ 250K), criado em 1995 por instituições do mercado de capitais para garantir estabilidade do sistema financeiro

### exercicio

Investi 200 mil em um CDB prefixado à taxa de 17,5% a.a. (base 360 dias, dias corridos). Período de 194 dias, IR computado com a alíquota de 20%

- montante (FV) e rendimento brutos da operação:
  - montante = FV = 200000 (1 + 0,175)^(194/360) = 218.158,74
  - juros = 18.158,74
- IR: 20% * juros = 3.631,75
- juro liquido: 14.526,99
- taxa efetiva bruta: (FV/PV) - 1 = (218.158,74 / 200000) - 1 = 9,08%
- taxa efetiva liquida: (FV_liquido/PV) -1 = (214.526,9 / 200000) -1 = 7,26%

Análise repetida para um CDB pós-fixado que remunera a uma taxa flutuante mais 13,50% a.a., quando o indexador do período foi de 3%:

- FV = 200 mil (1 + 0,135)^(194/360) (1 + 0,03)^(1 p/ 194 dias)
- ...

## letras financeiras
- emissor: instituições financeiras (BNDES incluso)
- contratos de prazo mínimo de 2 anos (parcial ou total, a partir de 2 anos)
- valor nominal (principal), em geral R$ 150K (ou 300K com cláusulas de subordinação)
- no caso do emissor ir a falência/inadimplência, a prioridade no recebimento sem subordinação
- pré ou pós, e pode envolver recebimento de recebimentos semestrais (cupons)
- IR de 15% (sempre), IOF não incide e sem Fundo Garantidor de Crédito

## notas promissórias
- emissor: sociedade anônima, aberta ou fechada
- prazo máximo: SA fechada, 180 dias e SA aberta, 360 dias
- sem FGC, prazo e remuneração definidos no contrato
- pós indexado ao DI e IPCA+juros
- fonte de captação para financiar capital de giro, por isso o prazo máximo, é de curto prazo
- IR regressivo, sem IOF e negociação no mercado secundário para SA aberta
- preço unitário mínimo > R$ 200K

## debêntures

- similar a nota promissórias, mas com prazo > 360 dias
- cada empresa emite em condições específicas de remuneração e prazo
- mercado secundário mais líquido que as notas promissórias
- alta liquidez -> marcação à mercado (se você manter a debêntures até o vencimento, você recebe o acordado, mas com mercado secundário é possível antecipar, então quando você vai transferir, ou seja, antecipa a negociação do título, o mercado irá precificar esse título, porque ele acredita que os juros podem ter mudado)

## CRIs (certificado de recebíveis imobiliários)

- emissores: atrelado a empreendimento imobiliários, securitizadoras (converte recebíveis em lastro para títulos, pega a promessa de pagamento, mensura o risco associado e o mercado precifica a taxa de juros para antecipar aquele seguro)
- maior % dos CRIs tem valor de face, unitário, de R$ 300K (pré ou pós)
- regime fiduciário: se a securitizadoras quebra, os recebíveis não são atingidos
- isenção de IR para PF
- permite pgto. de juros semestrais e cláusulas de correção monetária (definidos anteriormente)
- crise de 2008, CRIs podres e as securitizadoras precificou de forma incorreta
- temos a CRAs, que apenas muda a razão, visto que fomenta atividades do agronegócio
### exercicio

Adquiri 3 CRIs com valor nominal de 300K prefixada com 10% a.a. e prazo de 2 anos. Qual o fluxo de caixa para pgtos. semestrais?

instante 0: 900K (3*300)
instante 1: juros = 43.927,96
instante 2: juros = 43.927,96
instante 3: juros = 43.927,96
instante 4: principal + juros = 900.000,00 + 43.927,96

- como calcular esses juros de cada período? taxa de juros imputadas na operação de 1 semestre:

J = 900000 [(1 + 0,1)^(1/2) - 1] = 43.927,96

Caso esses títulos tenham cláusulas de correção monetária com uma inflação aproximada de 1% a.s. Como seriam os fluxos?


instante 0: 900K
instante 1: juros = 43.927,96
instante 2: juros_corrigido = 900000 (1+ 0,01) = 909000 (principal_corrigido_1) -----> 909000 * [(1 + 0,1)^(1/2) - 1] = 44.367,24
instante 3: juros_corrigido = principal_corrigido_2 * (1 + 0,1) = ...
instante 4: principal + juros_corrigido = 900.000,00 + 43.927,96

## LCIs (letra de crédito imobiliário)

- lastro em recebíveis do setor imobiliário
- emissor: instituições financeiras
- captar recursos e emprestar para o sistema financeiro habitacional, fomentar imóveis para PF
- prazos médios de até 1 ano, de acordo com o indexador (pré ou pós)
- isenção IR para PF, isento IOF e FGC
- temos a LCAs, que apenas muda a razão, visto que fomenta atividades do agronegócio

## FIDCs

- fundo de investimento, formada por condônimos para formar um principal
- patrimônio líquido > 50% em direitos creditórios (renda fixa), seja do mercado agropecuário ou do imobiliário
- critérios dependem da política do fundo
- investidor qualificado para operar (mínimo de 1M)
- IR regressivo sem FGC
- vantagens: rating e liquidez

### exercício

LCI adquirida por 100K por um ano (365 dias), pós-fixada de 90% do CDI, que foi de 8,5% no período, determine o montante no vencimento e sua taxa efetiva mensal.  
