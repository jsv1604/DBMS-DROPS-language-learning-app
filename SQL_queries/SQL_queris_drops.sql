-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JOIN

--1 display details of user's along with the notes they have written (using natural join)

select * 
from user natural join notes;

--2 extract user_id , first name email and score of users who have got scores greater than 6 so that you can mail them their language certificates

select u.user_id,f_name,email,lang_id,score 
from user u
join
user_quiz_score q 
on u.user_id = q.user_id 
where score >6;

--3 retrieve user_id and names of users who have signed up but are yet to select a language to learn (nested +correlated)
select u.user_id, f_name 
from user u  
where not exists 
(select * 
from user_lang l 
where l.user_id = u.user_id);

--4 retrieve topics in travel talk of german language which are not included in the quiz table (nested + correlated)
select * 
from topic_travel_talk t 
where not exists (select * 
			from quiz 
			where quiz_id like "%t" and quiz_id = t.q_id and lang_id = (select lang_id 
													from language 
													where language="german"))
and lang_id =(select lang_id from language where language="german");

--5 retrieve names of users  who chose their language as spanish ( used correlated queries)

select u.user_id, f_name,l_name 
from user u 
where exists (select *  
		  from user_lang l  
		   where l.user_id = u.user_id and l.lang_id = (select lang_id 
										from language 
										where language="spanish"));

--6 retrieve all user id's , names and scores of users who have taken french if they have taken the quiz or not ( left join)
select u.user_id, p.f_name, u.lang_id, q.score 
from (user_lang u join user p on u.user_id = p.user_id)  
left join user_quiz_score q on u.user_id = q.user_id 
where u.lang_id =(select lang_id from language where language = "french");

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- aggregate operations

--1 calculate averge score of each language 
select lang_id , avg(score) 
from user_quiz_score group by lang_id;

--2 retrieve user_id, first name,language id, language and score of the user with highest score from all three languages
 select u.user_id, u.f_name,q.lang_id,l.language,q.score from language l,user u, user_quiz_score q where u.user_id = q.user_id and l.lang_id = q.lang_id and q.score in (select max(score) from user_quiz_score);

--3 find number of user's per language 
select lang_id, count(*) as users_per_lang from user_lang group by lang_id;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SET operations

--1 retrieve all words and their English meanings of all topics from the french language

select q_id, food as french_meaning, english_meaning
from topic_food
where lang_id = (select lang_id from language where language = "french") 
union 
select q_id,relationship as french_meaning,english_meaning 
from topic_relationship 
where lang_id =(select lang_id from language where language = "french") 
union 
select q_id, travel_talk as french_meaning, english_meaning 
from topic_travel_talk 
where lang_id = (select lang_id from language where language = "french");

--2 retrieve user id's of users who have opted to learn more than one language
(select user_id 
from user_lang 
where lang_id like"%1" 
intersect (select user_id 
            from user_lang 
            where lang_id like "%2")) 
union 
(select user_id 
from user_lang 
where lang_id like"%1" 
intersect (select user_id 
            from user_lang 
            where lang_id like "%3")) 
union 
(select user_id 
from user_lang 
where lang_id like "%2" 
intersect (select user_id 
            from user_lang 
            where lang_id like "%3"));

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--trigger

DELIMITER $$
CREATE or replace TRIGGER before_update_score 
BEFORE UPDATE  
ON user_quiz_score FOR EACH ROW  
BEGIN  
    DECLARE useri varchar(6);
    DECLARE langi varchar(6);
    DECLARE new_score int;
    DECLARE max_score int;
    
    set useri = new.user_id;
    set langi = new.lang_id;
    set new_score = new.score;
    
    set max_score = update_score(useri,langi,new_score);
    
    set new.score = max_score;
     
END; $$   
DELIMITER ;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- write a function to select the best score given new score 

DELIMITER $$
CREATE FUNCTION update_score(useri varchar(6), langi varchar(6), new_score int)
RETURNS int
 BEGIN 
    DECLARE max_score int;
    DECLARE current_score int;
    select q.score into current_score from user_quiz_score q where q.user_id = useri and q.lang_id = langi;
	IF  current_score>=new_score then
	   SET max_score = current_score;	    	
	ELSE 
	   SET max_score = new_score;	   
    END IF;
	return max_score;	
END; $$
DELIMITER ;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- VIEW - create a new question bannk for the quiz section for spanish by selecting 5 records randomly ( using views):

create view spanish_words as 
select q_id, food as spanish_meaning, english_meaning
from topic_food
where lang_id = (select lang_id from language where language = "spanish") 
union 
select q_id,relationship as spanish_meaning,english_meaning 
from topic_relationship 
where lang_id =(select lang_id from language where language = "spanish") 
union 
select q_id, travel_talk as spanish_meaning, english_meaning 
from topic_travel_talk 
where lang_id = (select lang_id from language where language = "spanish");

select * from spanish_words;
select * from spanish_words order by RAND() LIMIT 5;


