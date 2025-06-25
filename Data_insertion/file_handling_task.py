# Your Practice Task
# Create a file file_handling_task.py that does the following:

# Reads employees.csv

# Filters employees with salary > 70000

# Writes filtered data to high_salary_employees.csv

import sqlite3 as sql
import pandas as pd

# Connect to SQLite DB
conn = sql.connect('company.db')

# Load CSV into pandas DataFrame
df = pd.read_csv('employees.csv')

# Create table (replace if exists)
df.to_sql('employees_table', conn, index=False, if_exists='replace')
print("✅ Table created successfully.")

# Filter employees with salary > 70000
filtered_df = df.query('salary > 70000')

# Export filtered result to CSV
filtered_df.to_csv('high_salary_employees.csv', index=False)
print("✅ Filtered data saved to high_salary_employees.csv")
