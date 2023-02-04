import pandas as pd
import streamlit as st
# import plotly.express as px
from database import view_all_data


def read():
    result = view_all_data()
    df = pd.DataFrame(result, columns=['user_id','f_name','l_name','email'])
    
    st.dataframe(df)
    # df = pd.DataFrame(result, columns=['Train_No', 'Name', 'Train_Type', 'Source', 'Destination' , 'Availability'])
    # with st.expander("View all Train"):
    #     st.dataframe(df)
    # with st.expander("Dealer Location"):
    #     task_df = df['Dealer City'].value_counts().to_frame()
    #     task_df = task_df.reset_index()
    #     st.dataframe(task_df)
    #     p1 = px.pie(task_df, names='index', values='Dealer City')
    #     # st.plotly_chart(p1)


