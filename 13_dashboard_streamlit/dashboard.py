import streamlit as st
from connect_data_warehouse import query_job_listings
import pandas as pd

st.set_page_config(page_title="HR Dashboard", layout="wide")

st.title("HR Dashboard - Job Listings")

# Hämta data från Snowflake
df = query_job_listings()

if df.empty:
	st.warning("Ingen data hittades.")
else:
	# KPI:er
	col1, col2, col3 = st.columns(3)
	col1.metric("Antal annonser", len(df))
	col2.metric("Totalt antal lediga tjänster", int(df["VACANCIES"].sum()))
	col3.metric("Unika yrken", df["OCCUPATION"].nunique())

	st.markdown("---")

	# Populäraste yrken
	top_jobs = df["OCCUPATION"].value_counts().head(10)
	st.subheader("Topp 10 mest efterfrågade yrken")
	st.bar_chart(top_jobs)

	# Gruppnivå
	st.subheader("Fördelning per yrkesgrupp")
	group_counts = df["OCCUPATION_GROUP"].value_counts()
	st.bar_chart(group_counts)

	# Fält-nivå
	st.subheader("Fördelning per yrkesfält")
	field_counts = df["OCCUPATION_FIELD"].value_counts()
	st.bar_chart(field_counts)

	# Ansökningsdeadline
	st.subheader("Kommande ansökningsdeadlines")
	df_deadline = df[["OCCUPATION", "APPLICATION_DEADLINE"]].sort_values("APPLICATION_DEADLINE").head(10)
	st.dataframe(df_deadline)

	st.markdown("---")
	st.subheader("Fullständig tabell")
	st.dataframe(df)

