import boto3
import pandas as pd

s3_client = boto3.client("s3")

df = pd.read_csv("data/enem_2020.csv", sep=",")
print(df)

s3_client.upload_file("data/enem_2020.csv",
                      "datalake-fabiojr-718373532469",
                      "raw-data/enem_2020.csv")
