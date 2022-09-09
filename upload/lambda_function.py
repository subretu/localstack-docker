import json
import psycopg2

# import psycopg2.extras


def connection():
    user = "postgres"
    pwd = "postgres"
    server = "127.0.0.1"
    port = 5431
    db = "postgres"
    conn = psycopg2.psycopg2-3.9.connect(
        "host="
        + server
        + " port="
        + str(port)
        + " dbname="
        + db
        + " user="
        + user
        + " password="
        + pwd
    )
    return conn


def lambda_handler(event, context):
    with connection() as conn:
        with conn.cursor() as cur:
            return {"statusCode": 200, "body": "lll"}
