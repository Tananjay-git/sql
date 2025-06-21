import pandas as pd
import sqlite3 as sql

# Creating a SQLite database and a table
conn = sql.connect('company.db')
cursor = conn.cursor()

# cursor.execute('''
#                CREATE TABLE IF NOT EXISTS employees(
#                     emp_id INTEGER PRIMARY KEY,
#                     name TEXT,
#                     department TEXT,
#                     salary INTEGER
#                )
#                ''')

# print("✅ Table created successfully.")

# Load CSV into a pandas DataFrame
df = pd.read_csv('employees.csv')
print("✅ CSV file loaded successfully.")
print(df)

# Insert data into the 'employees' table
df.to_sql('employees', conn, if_exists='replace', index=False)
print("\n✅ Data inserted into 'employees' table!")

# Print inserted data for verification
for r in cursor.execute('SELECT * FROM employees'):
    print(r)

conn.close()