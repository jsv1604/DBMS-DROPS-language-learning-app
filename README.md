# DBMS-DROPS-language-learning-app

Database project which is inspired from the DROPS app available on playstore <br>
**Front end** - streamlit <br>
**Back end DB** - MariaDB <br>

Steps to run the app and get your hands dirty with this project <br>
1. clone the repo
2. create a database 
3. populate the database using ddl commands using `DDL_drops.sql` inside the `SQL_queries` directory <br>
4. navigate to the `streamlit_python_codes` directory <br>
5. specify `host` , `user` , `password` and `database` in the mysql.connector.connect function in `app.py` and `database.py` <br>
5. use the command- `streamlit run app.py` to fire up the frontend
