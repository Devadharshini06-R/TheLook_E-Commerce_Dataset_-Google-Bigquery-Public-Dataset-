# TheLook_E-Commerce_Dataset_-Google-Bigquery-Public-Dataset-

The TheLook eCommerce dataset is a public, industry-quality dataset hosted by Google BigQuery. It simulates the real-world transactions of an online retail company, covering users, orders, products, and returns.This dataset is great for data analysis, machine learning, and creating dashboards for use cases like Product Return Prediction, Customer Segmentation, and Sales Performance Analysis.

---

## BigQuery 

BigQuery is a fully managed, AI-ready data platform that helps you manage and analyze your data with built-in features like machine learning, search, geospatial analysis, and business intelligence. BigQuery's serverless architecture lets you use languages like SQL and Python to answer your organization's biggest questions with zero infrastructure management.


  ---

  ### 🪄 What This Query Does

| Step | Description |
| :-- | :-- |
| 🧩 **Joins 4 tables** | Combines `orders`, `order_items`, `users`, and `products` tables |
| 🎯 **Creates target label** | Defines `is_returned = 1` if the order was returned (`returned_at` not null) |
| 💰 **Adds discount info** | Calculates discount amount and percentage between `retail_price` and `sale_price` |
| 🚚 **Adds delivery insights** | Includes `days_to_ship`, `shipping_duration`, and `days_to_return` metrics |
| 🕓 **Adds temporal features** | Extracts `weekday`, `month`, and `year` from the order date |
| 👥 **Includes customer features** | Adds demographic details such as `age`, `gender`, and `country` |
| 🛍️ **Includes product features** | Adds `category`, `brand`, `department`, and `retail_price` |
| 📊 **Ready for ML training** | Final dataset is suitable for classification models (`return = 1` / `not return = 0`) |

---
## 🧠 What this query does:

- Joins customer, order, and product tables.
- Creates a new label is_returned (1 for returned, 0 for completed orders).
- Selects key features like age, gender, product brand, and price difference for model training.

--- 
## 🚀 How to Access and Export the Data

- Open the dataset:
👉 [Google BigQuery Console – TheLook Dataset](https://console.cloud.google.com/bigquery?p=bigquery-public-data&d=thelook_ecommerce&page=dataset)
- Click “Compose New Query”.
- run the SQL query.
- Once results are shown → click “Export” → “CSV”.
- Download the file locally and use it in Python for preprocessing or model training.

--- 
## 🧮 Example Use Cases

- **Machine Learning:** Predict product returns using Random Forest, XGBoost, or Logistic Regression.
- **Analytics Dashboards:** Create Power BI or Tableau dashboards for customer and sales insights.
- **Feature Engineering:** Explore relationships between demographics, price, category, and returns.
