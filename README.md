### O projeto  que coleta e processa dados de várias APIs para fornecer informações sobre cotações de moedas, índices econômicos e outras informações financeiras,compilando estes dados num dataframe. O projeto é composto por três arquivos principais: main.py, Dockerfile e my_dag.py.

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

No projeto também consta um docker-compose com maiores possibilidades de configuração.

### my_dag.py

O arquivo `my_dag.py` define o DAG (Directed Acyclic Graph) para o Apache Airflow. O DAG inclui uma única tarefa que chama a função `df_cotacoes()` do arquivo `main.py`.


### Como Executar o Projeto

Para executar o projeto, siga as seguintes etapas:

1 - Crie uma imagem Docker a partir do Dockerfile com o comando `docker build -t my_project .`.

2 - Execute o contêiner Docker com o comando `docker run -p 8080:8080 my_project`.

3 - Acesse a interface do usuário do Apache Airflow em `http://localhost:8080`.
