import pandas as pd
import streamlit as st
from database import view_all_data, view_only_user_id, delete_data


def delete():
    result = view_all_data()
    df = pd.DataFrame(result, columns=['user_id','f_name','l_name','email'])
    with st.expander("Current data"):
        st.dataframe(df)

    list_of_users = [i[0] for i in view_only_user_id()]
    selected_user = st.selectbox("User to Delete", list_of_users)
    st.warning("Do you want to delete ::{}".format(selected_user))
    if st.button("Delete User"):
        try:
            delete_data(selected_user)
            st.success("User has been deleted successfully",icon="✅")
        except:
            st.error("Delete failed")
    new_result = view_all_data()
    df2 = pd.DataFrame(new_result, columns=['user_id','f_name','l_name','email'])
    with st.expander("Updated data"):
        st.dataframe(df2)