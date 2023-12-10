# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

WORKDIR /app

# Use a imagem oficial do Apache Airflow
FROM apache/airflow:2.1.2

ENV AIRFLOW__WEBSERVER__EXPOSE_CONFIG=true
ENV AIRFLOW__SCHEDULER__MIN_FILE_PROCESS_INTERVAL=5
ENV AIRFLOW__SCHEDULER__DAG_DIR_LIST_INTERVAL=20

# Instale as dependências necessárias
RUN pip install --upgrade pip && \
    pip install requests pandas python-bcb lxml

# Copie o script Python e o arquivo DAG para o contêiner
COPY ./airflow/dags/main.py /opt/airflow/dags/main.py
COPY ./airflow/dags/my_dag.py /opt/airflow/dags/my_dag.py

EXPOSE 8080

# Inicialize o banco de dados do Airflow
RUN airflow db init
