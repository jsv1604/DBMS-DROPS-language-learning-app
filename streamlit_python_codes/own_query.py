import streamlit as st
import pandas as pd
import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    # password="password",
    database="drops_ddl_test"
)


def ownQuery():
    
    query = st.text_input("Write your own query!")
    if st.button("Run query"):
        c = mydb.cursor(buffered=True)
        c.execute(query)
        
        data = c.fetchall()
        columns = c.column_names
        df = pd.DataFrame(data,columns = columns)
        
        st.dataframe(df)
        st.write(data)
    