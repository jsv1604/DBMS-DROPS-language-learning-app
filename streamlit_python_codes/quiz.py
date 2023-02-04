import streamlit as st
import pandas as pd
import mysql.connector
from database import select_lang_id,view_only_user_id,questions,update_score
import random

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    # password="password",
    database="drops_ddl_test"
)
c = mydb.cursor()




def take_quiz():
    count =0
    # query = st.text_input("Write your own query!")
    # if st.button("Run query"):
    #     c = mydb.cursor()
    #     c.execute(query)
        
    #     data = c.fetchall()
    #     columns = c.column_names
    #     df = pd.DataFrame(data,columns = columns)
        
    #     st.dataframe(df)
    #     st.write(data)
    list_of_users = [i[0] for i in view_only_user_id()]
    list_of_languages=[i[0] for i in select_lang_id()]
    # st.write(view_only_user_id())
    user_id= st.selectbox("User ID", list_of_users)
    lang_id= st.selectbox("Language ID:",list_of_languages)
    quiz_questions = questions(lang_id)
    # st.write(quiz_questions)

    question =[]
    answer =[]
    
    for i in quiz_questions:
        question.append(i[0])
        answer.append(i[1])

    # st.write(question)
    # st.write(answer)
    # if st.button("Start quiz"):
    selected_answer=[]
    correct_answer = answer
    # random.shuffle(answer)
    selected_answer.append(st.selectbox(question[0], answer))
    # random.shuffle(answer)
    selected_answer.append(st.selectbox(question[1], answer))
    # random.shuffle(answer)
    selected_answer.append(st.selectbox(question[2], answer))
    # random.shuffle(answer)
    selected_answer.append(st.selectbox(question[3], answer))
    # random.shuffle(answer)
    selected_answer.append(st.selectbox(question[4], answer))

    if st.button("Submit solution"):
        try:
            # st.write(selected_answer)
            
            for i in range(len(selected_answer)):
                if(selected_answer[i] == answer[i]):
                    count+=2

            st.subheader("Your score is : {}".format(count))
            # st.write(user_id)
            # st.write(lang_id)
            # c.execute('SELECT *  FROM user_quiz_score WHERE user_id= "{}" and lang_id= "{}" '.format(user_id,lang_id) )
            # mydb.commit()
            # data=c.fetchall()
            # st.write(data)
            update_score(user_id,lang_id,count)

        except:
            pass
    


    
    