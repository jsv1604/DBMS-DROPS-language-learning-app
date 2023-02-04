# Importing pakages
import streamlit as st
import mysql.connector

from create import create
from database import create_table
from delete import delete
from read import read
from update import update
from own_query import ownQuery
from quiz import take_quiz

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    # password="pes1ug20cs651",
    # database="pes1ug20cs651_railway_lab4"
    database="drops_ddl_test"
)
c = mydb.cursor(buffered=True)

# c.execute("CREATE DATABASE ebike")


def main():
    st.title("DROPS! Come learn a new Language")
    st.subheader("-Jeffrey S V \t PES1UG20CS651")
    menu = ["Add", "View", "Update", "Remove","Quiz","Query"]
    choice = st.sidebar.selectbox("Menu", menu)

    create_table()
    if choice == "Add":
        st.subheader("Enter User Details:")
        create()

    elif choice == "View":
        st.subheader("View User  details")
        read()

    elif choice == "Update":
        st.subheader("Update User  details")
        update()

    elif choice == "Remove":
        st.subheader("Delete User  details")
        delete()
    elif choice == "Quiz":
        st.subheader("It's quizzz timeeee- good luck!")
        take_quiz()
    elif choice == "Query":
        st.subheader("Hey, looks like you wanna go deeper into the db")
        ownQuery()

    else:
        st.subheader("About User ")


if __name__ == '__main__':
    main()
