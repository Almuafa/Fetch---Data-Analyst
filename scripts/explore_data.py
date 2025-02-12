import pandas as pd

# Load CSV files
users = pd.read_csv("data/USER_TAKEHOME.csv")
transactions = pd.read_csv("data/TRANSACTION_TAKEHOME.csv")
products = pd.read_csv("data/PRODUCTS_TAKEHOME.csv")

# Display basic info
print("Users Data:\n", users.info(), "\n")
print("Transactions Data:\n", transactions.info(), "\n")
print("Products Data:\n", products.info(), "\n")

# Check for missing values
print("Missing Values:\n")
print("Users:\n", users.isnull().sum(), "\n")
print("Transactions:\n", transactions.isnull().sum(), "\n")
print("Products:\n", products.isnull().sum(), "\n")

# Check for duplicates
print("Duplicate Rows:\n")
print("Users:", users.duplicated().sum())
print("Transactions:", transactions.duplicated().sum())
print("Products:", products.duplicated().sum())

