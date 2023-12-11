### O projeto  que coleta e processa dados de várias APIs para fornecer informações sobre cotações de moedas, índices econômicos e outras informações financeiras,compilando estes dados num dataframe. O projeto é composto por três arquivos principais: main.py, Dockerfile e my_dag.py.

![image](https://github.com/elton-datasc/moedas_cotacoes_airflow/assets/67129543/1fa362c9-95a8-41de-9941-805f0ee36594)


## Descrição dos Arquivos

### main.py

O arquivo main.py contém as funções para coletar e processar os dados. As funções incluem:

+ `cotacao_dolar()`: Coleta a cotação do dólar.
+ `cotacao_euro()`: Coleta a cotação do euro.
+ `cotacao_btc()`: Coleta a cotação do Bitcoin.
+ `selic_meta()`: Coleta a taxa Selic meta.
+ `coleta_selic_12m()`: Coleta a taxa Selic acumulada em 12 meses.
+ `coleta_igpm_mes()`: Coleta o IGP-M do mês.
+ `ipca_mes()`: Coleta o IPCA do mês.
+ `df_cotacoes()`: Cria um dataframe com os índices coletados.

### Dockerfile

O arquivo `Dockerfile` é usado para criar uma imagem Docker que contém o projeto e todas as suas dependências. A imagem Docker é baseada na imagem oficial do Python 3.8 e inclui a biblioteca Apache Airflow. A imagem Docker também copia o script Python e o arquivo DAG para o contêiner.

No projeto também consta um docker-compose com maiores possibilidades de configuração. Este arquivo está na documentação do Docker na página : https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html

arquivo : https://airflow.apache.org/docs/apache-airflow/2.7.3/docker-compose.yaml

### my_dag.py

O arquivo `my_dag.py` define o DAG (Directed Acyclic Graph) para o Apache Airflow. O DAG inclui uma única tarefa que chama a função `df_cotacoes()` do arquivo `main.py`.


### Como Executar o Projeto

Para executar o projeto, siga as seguintes etapas:

1 - Crie uma imagem Docker a partir do Dockerfile com o comando `docker build -t my_project .`.

![build](https://github.com/elton-datasc/moedas_cotacoes_airflow/assets/67129543/a5e14a94-47fc-4887-ac3d-cd9183bfaafb)


2 - Execute o contêiner Docker com o comando `docker run -p 8080:8080 my_project`.

3 - Acesse a interface do usuário do Apache Airflow em `http://localhost:8080`.

![airf](https://github.com/elton-datasc/moedas_cotacoes_airflow/assets/67129543/b8b59d91-45b2-4298-9421-7864f16b234f)


### Adicionais

1 -  Para criar um usuário e senha, acesse o container via terminal com : 

`airflow users create --username admin --password admin --firstname Anonymous --lastname Admin --role Admin --email admin@example.org`

2 - Para iniciar o scheduler, ainda dentro do container, digite: `airflow scheduler`. Depois digite exit para retornar ao terminal.

## Scheduler

![airf scheduler 2](https://github.com/elton-datasc/moedas_cotacoes_airflow/assets/67129543/c9c622fe-e1dd-4ebe-b0e2-5d83b8105a1b)

### Output

![terminão cotações2](https://github.com/elton-datasc/moedas_cotacoes_airflow/assets/67129543/b53cdb53-b4fc-41ea-8bf3-1beadbdd073a)



