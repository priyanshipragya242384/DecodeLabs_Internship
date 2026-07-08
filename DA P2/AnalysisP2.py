import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
df=pd.read_excel("Decode Labs P2.xlsx")

print("Dataset Shape:", df.shape)
print("\nFirst 5 Rows:")
print(df.head())



column = "Product"  

print("\nCount:")
print(df["Product"].count())

print("\nMean:")
print(df["TotalPrice"].mean())

print("\nMedian:")
print(df["TotalPrice"].median())

print("\nMinimum Value:")
print(df["TotalPrice"].min())

print("\nMaximum Value:")
print(df["TotalPrice"].max())




Q1 = df["TotalPrice"].quantile(0.25)
Q3 = df["TotalPrice"].quantile(0.75)
IQR = Q3 - Q1

lower_bound = Q1 - 1.5 * IQR
upper_bound = Q3 + 1.5 * IQR

outliers = df[(df["TotalPrice"] < lower_bound) | (df["TotalPrice"] > upper_bound)]

print("\nNumber of Outliers:", len(outliers))
print(outliers)



group_column = "Quantity"  

print("\nTrend Analysis:")
print(df.groupby(group_column)["TotalPrice"].mean())




print("\nSummary:")
print(f"Total Records: {len(df)}")
print(f"Average price of product: {df['TotalPrice'].mean():.2f}")
print(f"Median price of product: {df['TotalPrice'].median():.2f}")
print(f"Maximum price of product : {df['TotalPrice'].max()}")
print(f"Minimum price of product: {df['TotalPrice'].min()}")
print(f"Outliers Found: {len(outliers)}")

df["CouponCode"] = df["CouponCode"].fillna("No Code")


df["CouponCode"] = df["CouponCode"].astype(str)

plt.boxplot(df["TotalPrice"])
plt.tight_layout()
plt.title("Comparison of  Product and Quantity")
plt.ylabel("Values")
plt.show()
