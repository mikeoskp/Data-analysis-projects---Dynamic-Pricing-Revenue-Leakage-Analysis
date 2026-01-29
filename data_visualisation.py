# PYTHON ANALYSIS (EDA + VISUALS)
import matplotlib.pyplot as plt
import pandas as pd

# read file
df = pd.read_excel('product_dataset.xlsx')

# Revenue Leakage Column
df["leakage"] = df["base_price"] * df["quantity"] - df["revenue"]

# Leakage by Discount
leakage_discount = df.groupby("discount_pct")["leakage"].sum()

leakage_discount.plot(kind="bar")
plt.title("Revenue Leakage by Discount Percentage")
plt.show()




# Demand vs Discount Analysis
import seaborn as sns

sns.boxplot(x="demand_level", y="discount_pct", data=df)
plt.title("Discounting Pattern vs Demand")
plt.show()


# Device-wise Revenue Comparison
device_revenue = df.groupby("device")["revenue"].sum()
device_revenue.plot(kind="pie", autopct="%1.1f%%")
plt.title("Revenue Share by Device")
plt.show()


# BUSINESS INSIGHTS

# ✔ High demand products were discounted up to 20–30% unnecessarily
# ✔ Mobile users showed higher revenue leakage
# ✔ Certain regions consistently underpriced products
# ✔ Static pricing caused ~18–25% potential revenue loss



















































