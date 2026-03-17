import snowflake.connector
from dotenv import load_dotenv
import os

load_dotenv()

conn = snowflake.connector.connect(
    account=os.getenv("SNOWFLAKE_ACCOUNT"),
    user=os.getenv("SNOWFLAKE_USER"),
    password=os.getenv("SNOWFLAKE_PASSWORD"),
    warehouse=os.getenv("SNOWFLAKE_WAREHOUSE"),
    database=os.getenv("SNOWFLAKE_DATABASE"),
    schema=os.getenv("SNOWFLAKE_SCHEMA")
)

cursor = conn.cursor()
cursor.execute("SELECT COUNT(*) FROM BEER")
result = cursor.fetchone()
print("Connected! Row count:", result[0])

import pandas as pd

cursor.execute("SELECT NAME, STYLE, ROUND(ABV, 2) FROM BEER WHERE ABV IS NOT NULL ORDER BY ABV DESC LIMIT 10")
df = pd.DataFrame(cursor.fetchall(), columns=["name", "style", "abv"])
print(df)
pd.set_option('display.max_colwidth', None)
cursor.close()
conn.close()