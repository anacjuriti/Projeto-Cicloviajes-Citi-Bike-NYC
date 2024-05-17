# Ficha Técnica - Projeto Cicloviajes

## Desafio Técnico Projeto Cicloviajes

## Análise exploratória do conjunto de dados sobre o uso do programa CitiBike NYC

---

## Objetivo

O objetivo do estudo Cicloviajes é realizar uma análise exploratória de dados do programa de compartilhamento de bicicletas Citi Bike New York City. Esta análise tem como finalidade fornecer insights sobre o uso do serviço, identificar padrões e tendências no comportamento dos usuários, através da compreensão da estrutura dos dados, análises detalhadas e visualizações claras e eficazes.

---

## Equipe

Individual (Ana Guimarães)

---

## Ferramentas e Tecnologias

- **Google BigQuery:** Consulta e processamento dos dados.
- **Google Looker Studio:** Criação do dashboard e relatório dos dados.

**Linguagens:** 

- **SQL:** BigQuery

---

## Processamento e Análises

---

- **Preparação da base de dados**
    1. A variável **`stoptime`**, que originalmente continha informações de data e hora, foi transformada para exibir apenas a data. Isso foi feito utilizando a função **`DATE()`** em SQL. A função **`DATE(stoptime)`** extrai a parte da data da coluna **`stoptime`**. Essa modificação facilita a análise de dados baseada em datas, eliminando a necessidade de considerar o componente de tempo das entradas.
        
        A nova variável foi renomeada como **`stop_date`** para refletir que passou a conter apenas a data.
        
    2. A variável **`tripduration`**, que originalmente exibia a duração das viagens em segundos, foi convertida para minutos. Essa transformação da **`tripduration`** simplifica a análise da duração das viagens, tornando-a mais intuitiva, especialmente para períodos curtos.
        
        A nova coluna resultante foi renomeada para **`tripduration_minutes`**.
        
    3. A média diária de viagens realizadas foi criada através do agrupamento das viagens por data fim (**`stoptime`)** para contar o número de viagens para cada dia e calcular a média desses contagens diárias.
    4. Através da variável **`tripduration`** foi possível gerar estatísticas descritivas calculando as métricas de máximo, mínimo, média e desvio padrão da duração das viagens em minutos.
    5. Foi calculado as métricas históricas, incluindo o total de viagens, crescimento no número de viagens diárias ao longo do tempo, e total de viagens dos usuários por sexo, idade e tipo de assinatura.
    6. Para calcular o crescimento no número de viagens diárias ao longo do tempo foi extraída a data de início das viagens, usando uma consulta SQL, o número de viagens para cada dia e ordenado os resultados por período para analisar a série temporal do número de viagens diárias para visualizar o crescimento ao longo do tempo. 
    7. A variável **`total_viagens`** calculou o total de viagens segmentadas por sexo (**`gender`**), idade (**`birth_year`**) e tipo de assinatura (**`usertype`**). 
    

---

## Resultados e Conclusões

Citi Bike é um programa de compartilhamento de bicicletas lançado em maio de 2013 em Nova York. O programa oferece uma maneira conveniente e sustentável de transporte para residentes e visitantes da cidade. Com estações de bicicletas espalhadas por Manhattan, Brooklyn, Queens, e recentemente expandindo para o Bronx e Staten Island, o programa permite que os usuários aluguem bicicletas por períodos curtos, facilitando deslocamentos rápidos e ecológicos.

O programa incentiva as viagens de curto espaço e permite viagens multimodais sem o incômodo de garantir um bicicleta particular, tempo gasto caminhando, o custo de um serviço de táxi ou carro, gera um benefício adicional de fornecer exercício físico, além de fornecer para os nova-iorquinos a escolha de aderir ao sistema para lazer quanto para deslocamento.

Este estudo foi realizado utilizando dados do programa Citi Bike de Nova York, coletados entre os anos de 2015 a 2018. Durante este período, foi analisada a utilização diária das bicicletas, a duração das viagens, e o perfil dos usuários.

O número médio de viagens realizadas é de aproximadamente 53 por dia. Este número oferece uma visão geral da utilização diária das bicicletas, indicando uma alta demanda pelo serviço em dias normais.

A duração média das viagens é de 16 minutos, sugerindo que a maioria dos usuários utiliza as bicicletas para trajetos curtos. O desvio padrão de 256 minutos, embora pareça elevado, reflete a variabilidade significativa nas durações das viagens. O tempo máximo registrado é de 55 mil minutos, enquanto o mínimo é de 1 minuto, demonstrando uma ampla faixa de durações.

A maior parte dos usuários é composta por adultos mais maduros ou idosos, com 42,86% dos clientes tendo 66 anos ou mais, resultando em uma idade média de 54 anos. A maioria dos clientes opta pelo programa de assinatura, enquanto 41% preferem usar planos avulsos.

Desde o seu lançamento, o programa Citi Bike tem sido amplamente bem-sucedido, com milhares de viagens realizadas anualmente. Ele se tornou um modelo de referência para programas de compartilhamento de bicicletas em outras cidades ao redor do mundo. A popularidade do Citi Bike destaca a crescente demanda por opções de transporte sustentável e a importância de integrar bicicletas na infraestrutura urbana.

---

## Limitações/Próximos Passos

O data frame possui mais de 58 milhões de registros, mas esse estudo, por limitações técnicas, foi realizado usando uma amostra de 50 mil viagens.

O serviço Citi Bike pode não estar suficientemente disponível em todas as áreas da cidade, especialmente em bairros periféricos ou menos densamente povoados, limitando o acesso a um público mais amplo.

Foi possível analisar que a utilização do serviço pode estar concentrada em determinados grupos demográficos, como adultos mais maduros, podendo não refletir uma diversidade de usuários.

Como medidas futuras é imprescindível uma expansão da cobertura do Citi Bike para incluir mais bairros, especialmente aqueles atualmente subatendidos, para aumentar a acessibilidade e o uso do serviço.

Desenvolver campanhas de marketing e programas de incentivo que alcancem uma gama mais ampla de usuários, incluindo diferentes faixas etárias, gêneros e grupos socioeconômicos.

Mais dados sobre o comportamento de consumo dos clientes facilitará uma atuação mais efetiva, direcionada e voltada para a experiência do cliente, porém todos esses pontos fornecem um caminho claro para abordar as limitações atuais do programa Citi Bike e sugerem passos concretos para melhorar e expandir o serviço no futuro.

---

## Links de interesse

Fontes: 

[https://wagner.nyu.edu/files/faculty/publications/Citi_Bike_First_Two_Years_RudinCenter.pdf](https://wagner.nyu.edu/files/faculty/publications/Citi_Bike_First_Two_Years_RudinCenter.pdf)

[https://citibikenyc.com/system-data](https://citibikenyc.com/system-data)

Dashboard:

[https://lookerstudio.google.com/reporting/5b0d3dae-a670-4850-8452-4c80aed7bd34](https://lookerstudio.google.com/reporting/5b0d3dae-a670-4850-8452-4c80aed7bd34)

---
