import datetime

import pandas as pd
import streamlit as st
from database import view_all_data, view_only_user_id, get_user, edit_user_data


def update():
    result = view_all_data()
    # st.write(result)
    df = pd.DataFrame(result, columns=['user_id','f_name','l_name','email'])
    with st.expander("Current Users"):
        st.dataframe(df)
    list_of_users = [i[0] for i in view_only_user_id()]
    selected_user = st.selectbox("User to Edit", list_of_users)
    selected_result = get_user(selected_user)
    # st.write(selected_result)
    if selected_result:
        user_id = selected_result[0][0]
        f_name = selected_result[0][1]
        l_name = selected_result[0][2]
        email = selected_result[0][3]
        # Destination = selected_result[0][4]
        # Availability = selected_result[0][5]

        # Layout of Create
        new_user_id = st.text_input("User ID:",user_id)
        col1, col2 = st.columns(2)
        with col1:
            new_f_name = st.text_input("First Name:",f_name)
            # new_Train_No = st.text_input("Train_No:", Train_No)
            # new_Name = st.text_input("Name:", Name)
            # new_Train_Type= st.selectbox(Train_Type, ["Superfast", "Fast", "Mail"])
        with col2:
            new_l_name = st.text_input("Last Name:",l_name)
            #  new_Source = st.text_input("Source:", Source)
            #  new_Destination = st.text_input("Destination:", Destination)
            #  new_Availability= st.selectbox(Availability, ["YES", "NO"])
        new_email=st.text_input("Email:",email)

        if st.button("Update User"):
            try:
                edit_user_data(new_user_id,new_f_name,new_l_name,new_email,user_id,f_name,l_name,email)
                st.success("Successfully updated:: {} to ::{}".format(f_name,new_f_name),icon="✅")
            except:
                st.error("Update failed !!")

    result2 = view_all_data()
    df2 = pd.DataFrame(result2, columns=['user_id','f_name','l_name','email'])
    with st.expander("Updated data"):
        st.dataframe(df2)
