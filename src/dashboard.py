import streamlit as st
import pandas as pd
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
st.set_page_config(page_title="E-Commerce Sales AI",layout="wide")
st.title("E-Commerce Sales Analytics & Forecasting")
st.caption("DEMO: synthetic transactions, not real company data")
df=pd.read_csv(ROOT/"data/orders_synthetic.csv",parse_dates=["order_date"])
regions=st.multiselect("Regions",sorted(df.region.unique()),default=sorted(df.region.unique()))
cats=st.multiselect("Categories",sorted(df.category.unique()),default=sorted(df.category.unique()))
df=df[df.region.isin(regions)&df.category.isin(cats)]
a,b,c,d=st.columns(4)
a.metric("Revenue",f"₹{df.sales.sum():,.0f}")
b.metric("Profit",f"₹{df.profit.sum():,.0f}")
c.metric("Orders",f"{len(df):,}")
d.metric("Margin",f"{df.profit.sum()/df.sales.sum()*100:.1f}%" if df.sales.sum() else "0%")
st.subheader("Monthly revenue")
st.line_chart(df.set_index("order_date").resample("MS")["sales"].sum())
st.subheader("Sales by category")
st.bar_chart(df.groupby("category")["sales"].sum())
st.subheader("30-day sales forecast (illustrative)")
st.caption("Forecast is trained on synthetic data and does not change when you filter the transactions above.")
f=pd.read_csv(ROOT/"data/forecast_30_days.csv",parse_dates=["date"])
st.line_chart(f.set_index("date")["forecast_sales"])
