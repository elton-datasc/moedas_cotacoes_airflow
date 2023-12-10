from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from main import df_cotacoes

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

dag = DAG(
    'consumo_api',
    default_args=default_args,
    description='Consumo de API - cotacoes e moedas',
    schedule_interval=timedelta(minutes=5),
    catchup=False,
)

df_final = PythonOperator(
                              task_id='cotacoes_api',
                              python_callable=df_cotacoes,
                              provide_context=True,
                              dag=dag   
                                )

