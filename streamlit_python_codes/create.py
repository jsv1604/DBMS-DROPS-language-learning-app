import streamlit as st
from database import add_data


def create():
    user_id = st.text_input("User ID:")
    col1, col2 = st.columns(2)
    
    with col1:
        
        f_name = st.text_input("First Name:")
        # Train_Type= st.selectbox("Train_Type", ["Superfast", "Fast", "Mail"])
    with col2:
        l_name = st.text_input("Last Name:")
        # Source = st.text_input("Source:")
        # Destination = st.text_input("Destination:")
        # Availability = st.selectbox("Availability", ["YES", "NO"])
    email= st.text_input("Email:")
        
    if st.button("Add new User"):
        try:
            add_data(user_id,f_name,l_name,email)
            st.success("Successfully added user: {}".format(f_name),icon="✅")
        except:
            st.error("Insert failed as primary key Constraint have been Violated, please check!!")
