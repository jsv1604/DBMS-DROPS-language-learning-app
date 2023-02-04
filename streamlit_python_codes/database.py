# pip install mysql-connector-python
import mysql.connector
import streamlit as st

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    # password="password",
    database="drops_ddl_test"
)
c = mydb.cursor()
d=mydb.cursor()


def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS user(user_id varchar(6),f_name varchar(8),l_name varchar(9),email varchar(30))')
    mydb.commit()


def add_data(user_id,f_name,l_name,email):
    c.execute('INSERT INTO user(user_id,f_name,l_name,email) VALUES (%s,%s,%s,'
              '%s)',
              (user_id,f_name,l_name,email))
    mydb.commit()


def view_all_data():
    c.execute('SELECT * FROM user')
    data = c.fetchall()
    return data

def questions(lang_id):
    c.execute('SELECT question,answer from quiz where lang_id="{}"'.format(lang_id))
    data=c.fetchall()
    return data


def view_only_user_id():
    c.execute('SELECT user_id FROM user')
    data = c.fetchall()
    return data

def select_lang_id():
    c.execute('SELECT lang_id from language')
    data = c.fetchall()
    return data


def get_user(user_id):
    c.execute('SELECT * FROM user WHERE user_id="{}"'.format(user_id))
    data = c.fetchall()
    return data


def edit_user_data(new_user_id,new_f_name,new_l_name,new_email,user_id,f_name,l_name,email):
    c.execute("UPDATE user SET user_id=%s, f_name=%s, l_name=%s, email=%s WHERE "
              "user_id=%s and f_name=%s and l_name=%s and email=%s", (new_user_id,new_f_name,new_l_name,new_email,user_id,f_name,l_name,email))
    mydb.commit()
    data = c.fetchall()
    return data


def delete_data(user_id):
    c.execute('DELETE FROM user WHERE user_id="{}"'.format(user_id))
    mydb.commit()

def update_score(user_id,lang_id,score):
    # st.success("ab")
    c.execute('SELECT *  FROM user_quiz_score WHERE user_id= "{}" and lang_id= "{}" '.format(user_id,lang_id) )
    # mydb.commit()
    data=c.fetchall()
    # st.write(len(data))
    try:
        if(len(data) == 0):
            c.execute('INSERT into user_quiz_score values("{}","{}",{})'.format(user_id,lang_id,score))
            mydb.commit()
        else:
            c.execute('UPDATE user_quiz_score set score = {} where user_id ="{}" and lang_id= "{}"'.format(score,user_id,lang_id))
            mydb.commit()
        # mydb.commit()
    except:
        st.error("exceot block")    


    # if(c.execute('SELECT * from user_quiz_score where user_id = "{}"'.format(user_id) )):
    
    # else:
    #     
    