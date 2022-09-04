import json
import psycopg2


def lambda_handler(event, context):
    with connection() as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            cur.execute("select * from sample;")
            row = cur.fetchone()
            return {"statusCode": 200, "body": json.dumps(row)}


def connection():
    user = "postgres"
    pwd = "postgres"
    server = "127.0.0.1"
    port = 5431
    db = "postgres"
    conn = psycopg2.connect(
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
