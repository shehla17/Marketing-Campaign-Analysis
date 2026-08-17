In this checkpoint, SQL queries were developed to extract and aggregate the data required to evaluate the defined business question: “How effective are the marketing campaigns, and how has their performance changed over time?”

The Excel dataset was first loaded using Python and Pandas in Jupyter Notebook. The required marketing_events sheet was read using pandas.read_excel() and converted into a SQLite table using DataFrame.to_sql(). This SQLite database was then used for SQL-based analysis in DB Browser for SQLite.

The analysis started with an overall aggregation of sessions, conversions, marketing spend, and revenue to establish the overall performance baseline. Performance was then analyzed by marketing channel to identify differences in traffic, conversions, spending, and revenue between channels.

ROAS (Return on Ad Spend) was calculated for each channel using the formula Revenue / Spend to evaluate how efficiently marketing spend generated revenue. This provides a more meaningful measure of channel effectiveness than revenue alone.

The data was also aggregated by channel and region to examine whether channel performance varies across different geographical segments. This aggregation provides the basis for identifying potential regional differences and investigating possible root causes in the next checkpoint.

Finally, the data was aggregated by month to analyze changes in marketing performance over time. Monthly Conversion Rate, calculated as Conversions / Sessions × 100, was also included to evaluate how effectively marketing traffic was converted into successful outcomes over time.

These SQL aggregations provide the analytical foundation for the next stage, where the results will be segmented by channel, region, and time to identify performance differences, investigate potential root causes, and support data-driven recommendations.
