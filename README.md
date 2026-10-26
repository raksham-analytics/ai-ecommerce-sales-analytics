# AI-Powered E-Commerce Sales Analytics & Forecasting

**Portfolio demonstration using fully SYNTHETIC, randomly generated sales data (2023–2025).** Do not present as a real business engagement.

## Deliverables
- `data/orders_synthetic.csv`: 10,933 generated order records
- `data/daily_sales.csv`: daily aggregated sales
- `data/forecast_30_days.csv`: recursive 30-day demonstration forecast
- `sql/analysis_mysql.sql`: MySQL table definition and analytical queries
- `models/sales_forecast.joblib`: trained random forest model (load only from trusted files)
- `src/dashboard.py`: interactive Streamlit dashboard
- `powerbi/DAX_measures.txt`: Power BI dashboard building guide and measures
- `reports/project_report.pdf`: methodology and evaluation
- `reports/metrics.txt`: model accuracy on holdout

## Tech Stack
Python, Pandas, scikit-learn, MySQL, Streamlit, Power BI (DAX)

## Run dashboard
```bash
python -m pip install -r requirements.txt
streamlit run src/dashboard.py
```

## Forecast method
RandomForestRegressor predicts daily sales using calendar features, previous 1/7/14/28-day sales and 7/28-day rolling means. Train dates through 2025-06-30; chronological holdout July–December 2025. **One-step holdout metrics use observed past sales**, whereas future predictions are recursive. Metrics: MAE ₹19,090.47, RMSE ₹24,023.97, MAPE 84.28%. These results are not evidence of production accuracy. Since the data is randomly generated and has no real demand pattern, accuracy is limited. The focus of this project is the end-to-end pipeline: data, SQL analysis, ML model and dashboard.

## Power BI
No `.pbix` is included (requires Power BI Desktop). Follow `powerbi/DAX_measures.txt` to build the report using the supplied CSV.



## Future improvements
Replace synthetic data with a properly licensed real dataset, add holiday and marketing features, compare seasonal-naive and gradient-boosting baselines, implement backtesting, and build a Power BI `.pbix`.
