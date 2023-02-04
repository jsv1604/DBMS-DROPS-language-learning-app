-- ------------------
-- Database: 'DROPS'
-- ------------------

--
-- Table structure for table `user`
--

CREATE TABLE user (
    `user_id` VARCHAR(6) CHARACTER SET utf8,
    `f_name` VARCHAR(8) CHARACTER SET utf8 NOT NULL,
    `l_name` VARCHAR(9) CHARACTER SET utf8,
    `email` VARCHAR(18) CHARACTER SET utf8 NOT NULL
);
INSERT INTO user VALUES
    ('USR_01','Harinder','Symons','harinder@gmail.com'),
    ('USR_02','Davis','Jefferson','davis@gmail.com'),
    ('USR_03','Madelyn','Rakes','madelyn@gmail.com'),
    ('USR_04','Roslyn','Plank','roslyn@gmail.com'),
    ('USR_05','Prunella','Benson','prunella@gmail.com'),
    ('USR_06','Melvin','Taft','melvin@gmail.com'),
    ('USR_07','Oneida','Steele','oneida@gmail.com'),
    ('USR_08','Linda','Bell','linda@gmail.com'),
    ('USR_09','Jolie','Love','jolie@gmail.com'),
    ('USR_10','Miles','Willard','miles@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE language (
    `lang_id` VARCHAR(6) CHARACTER SET utf8,
    `language` VARCHAR(7) CHARACTER SET utf8
);
INSERT INTO language VALUES
    ('lang01','french'),
    ('lang02','german'),
    ('lang03','spanish');

-- --------------------------------------------------------

--
-- Table structure for table `topic_food`
--

CREATE TABLE topic_food (
    q_id VARCHAR(5) CHARACTER SET utf8,
    lang_id VARCHAR(6) CHARACTER SET utf8,
    food VARCHAR(12) CHARACTER SET utf8,
    english_meaning VARCHAR(6) CHARACTER SET utf8     
);
INSERT INTO topic_food VALUES
    ('q01_f','lang01','pain','bread'),
    ('q02_f','lang01','Beurre','butter'),
    ('q03_f','lang01','Le Lait','milk'),
    ('q04_f','lang01','citron','lemon'),
    ('q05_f','lang01','Patate','potato'),
    ('q01_f','lang02','brot','bread'),
    ('q02_f','lang02','Butter','butter'),
    ('q03_f','lang02','Milch','milk'),
    ('q04_f','lang02','Zitrone','lemon'),
    ('q05_f','lang02','Kartoffel','potato'),
    ('q01_f','lang03','pan de molde','bread'),
    ('q02_f','lang03','manteca','butter'),
    ('q03_f','lang03','Leche','milk'),
    ('q04_f','lang03','limón','lemon'),
    ('q05_f','lang03','papa','potato');



-- --------------------------------------------------------

--
-- Table structure for table `topic_travel_talk`
--

CREATE TABLE topic_travel_talk (
    `q_id` VARCHAR(5) CHARACTER SET utf8,
    `lang_id` VARCHAR(6) CHARACTER SET utf8,
    `travel_talk` VARCHAR(26) CHARACTER SET utf8,
    `english_meaning` VARCHAR(21) CHARACTER SET utf8
);
INSERT INTO topic_travel_talk VALUES
    ('q01_t','lang01','bonjour','hello'),
    ('q02_t','lang01','Comment ça va','how are you'),
    ('q03_t','lang01','Aidez-moi, s''il vous plaît','please help me'),
    ('q04_t','lang01','je vais bien','I am fine'),
    ('q05_t','lang01','où est l''hôpital','where is the hospital'),
    ('q01_t','lang02','hallo','hello'),
    ('q02_t','lang02','wie gehts','how are you'),
    ('q03_t','lang02','Bitte hilf mir','please help me'),
    ('q04_t','lang02','Mir geht''s gut','I am fine'),
    ('q05_t','lang02','wo ist das Krankenhaus','where is the hospital'),
    ('q01_t','lang03','Hola','hello'),
    ('q02_t','lang03','cómo estás','how are you'),
    ('q03_t','lang03','por favor, ayúdame','please help me'),
    ('q04_t','lang03','Estoy bien','I am fine'),
    ('q05_t','lang03','Dónde está el hospital','where is the hospital');


-- --------------------------------------------------------

--
-- Table structure for table `topic_relationship`
--

CREATE TABLE topic_relationship (
    `q_id` VARCHAR(5) CHARACTER SET utf8,
    `lang_id` VARCHAR(6) CHARACTER SET utf8,
    `relationship` VARCHAR(8) CHARACTER SET utf8,
    `english_meaning` VARCHAR(8) CHARACTER SET utf8
);
INSERT INTO topic_relationship VALUES
    ('q01_r','lang01','père','father'),
    ('q02_r','lang01','mère','mother'),
    ('q03_r','lang01','mari','husband'),
    ('q04_r','lang01','épouse','wife'),
    ('q05_r','lang01','fils','son'),
    ('q06_r','lang01','la fille','daughter'),
    ('q01_r','lang02','Vater','father'),
    ('q02_r','lang02','Mutter','mother'),
    ('q03_r','lang02','Ehemann','husband'),
    ('q04_r','lang02','Ehefrau','wife'),
    ('q05_r','lang02','Sohn','son'),
    ('q06_r','lang02','Tochter','daughter'),
    ('q01_r','lang03','padre','father'),
    ('q02_r','lang03','madre','mother'),
    ('q03_r','lang03','esposo','husband'),
    ('q04_r','lang03','esposa','wife'),
    ('q05_r','lang03','hijo','son'),
    ('q06_r','lang03','hija','daughter');



-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE quiz (
    `quiz_id` VARCHAR(5) CHARACTER SET utf8,
    `lang_id` VARCHAR(6) CHARACTER SET utf8,
    `question` VARCHAR(55) CHARACTER SET utf8,
    `answer` VARCHAR(22) CHARACTER SET utf8
);
INSERT INTO quiz VALUES
    ('q01_f','lang01','What is bread called in french?','pain'),
    ('q03_f','lang01','What is milk called in french?','Le Lait'),
    ('q02_t','lang01','How do you say-"How are you?" in French','Comment ça va'),
    ('q04_t','lang01','How do you say-"I am fine" in French','je vais bien'),
    ('q06_r','lang01','What is "son" in french?','fils'),
    ('q03_f','lang02','What is "milk" is German?','Milch'),
    ('q05_f','lang02','What is "potato" in German?','Kartoffel'),
    ('q03_t','lang02','How do you say "Please help me", in German?','Bitte hilf mir'),
    ('q05_t','lang02','How do you ask someone where the hospital is in German?','wo ist das Krankenhaus'),
    ('q01_r','lang02','What do you call your father in German?','Vater'),
    ('q04_f','lang03','What  do you call a lemon in Spanish?','limón'),
    ('q05_f','lang03','What do you call a potato in Spanish?','papa'),
    ('q03_t','lang03','How do you ask for help politely in Spanish?','por favor, ayúdame'),
    ('q01_t','lang03','How do you say Hello in Spanish?','Hola'),
    ('q03_r','lang03','What is the Spanish word for "Husband"?','esposo');


-- --------------------------------------------------------

--
-- Table structure for table `user_language`
--

CREATE TABLE user_lang (
    `user_id` VARCHAR(6) CHARACTER SET utf8,
    `lang_id` VARCHAR(6) CHARACTER SET utf8
);
INSERT INTO user_lang VALUES
    ('USR_01','lang01'),
    ('USR_01','lang02'),
    ('USR_03','lang01'),
    ('USR_02','lang01'),
    ('USR_06','lang01'),
    ('USR_04','lang03'),
    ('USR_05','lang02'),
    ('USR_07','lang01'),
    ('USR_09','lang03');


-- --------------------------------------------------------

--
-- Table structure for table `user_quiz_score`
--

CREATE TABLE user_quiz_score (
    `user_id` VARCHAR(6) CHARACTER SET utf8,
    `lang_id` VARCHAR(6) CHARACTER SET utf8,
    `score` INT
);
INSERT INTO user_quiz_score VALUES
    ('USR_01','lang01',8),
    ('USR_03','lang01',7),
    ('USR_04','lang03',10),
    ('USR_05','lang02',9),
    ('USR_07','lang01',8);


-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE notes (
    `user_id` VARCHAR(6) CHARACTER SET utf8,
    `note_id` VARCHAR(6) CHARACTER SET utf8,
    `date` DATE,
    `title` VARCHAR(12) CHARACTER SET utf8,
    `note` LONGTEXT
);
INSERT INTO notes VALUES
    ('USR_01','note01','2022-11-10 ','French day 1','revise the travel talk section once more'),
    ('USR_03','note01','2022-11-09 ','french quiz','improve on french scores in the quiz'),
    ('USR_01','note02','2022-11-12','reminder','remember to take the quiz on french tomoroow'),
    ('USR_01','note03','2022-11-13 ','reminder','brush up on french'),
    ('USR_07','note01','2022-11-14 ','test note','hey there, I am just exploring the app and I am lovin it!!!');


-- --------------------------------------------------------


--
-- Indexes for table `user`
--

ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `topic_food`
--

ALTER TABLE `topic_food`
  ADD PRIMARY KEY (`q_id`,`lang_id`);


--
-- Indexes for table `topic_relationship`
--

ALTER TABLE `topic_relationship`
  ADD PRIMARY KEY (`q_id`,`lang_id`);

--
-- Indexes for table `topic_travel_talk`
--

ALTER TABLE `topic_travel_talk`
  ADD PRIMARY KEY (`q_id`,`lang_id`);

--
-- Indexes for table `language`
--

ALTER TABLE `language`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `quiz`
--

ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`,`lang_id`);

--
-- Indexes for table `user_language`
--

ALTER TABLE `user_lang`
  ADD PRIMARY KEY (`user_id`,`lang_id`);

--
-- Indexes for table `user_quiz_score`
--

ALTER TABLE `user_quiz_score`
  ADD PRIMARY KEY (`user_id`,`lang_id`);

--
-- Indexes for table `notes`
--

ALTER TABLE `notes`
  ADD PRIMARY KEY (`user_id`,`note_id`);

-- ----------------------------------------------------------------------------------------
-- adding foreign key contraints on all tables

alter table topic_food add foreign key (lang_id) references language(lang_id);
alter table topic_relationship add foreign key (lang_id) references language(lang_id);
alter table topic_travel_talk add foreign key (lang_id) references language(lang_id);
alter table quiz add foreign key (lang_id) references language(lang_id);
alter table user_lang add foreign key (lang_id) references language(lang_id);
alter table user_lang add foreign key (user_id) references user(user_id);
alter table user_quiz_score add foreign key (lang_id) references language(lang_id);
alter table user_quiz_score add foreign key (user_id) references user(user_id);
alter table notes add foreign key (user_id) references user(user_id);



alter table user_quiz_score add constraint del_con1 foreign key(user_id) references user(user_id) on delete cascade;
alter table notes add constraint del_con2 foreign key(user_id) references user(user_id) on delete cascade;
alter table user_lang add constraint del_con3 foreign key(user_id) references user(user_id) on delete cascade;

alter table topic_food add constraint del_con4 foreign key(lang_id) references language(lang_id) on delete cascade;
alter table topic_relationship add constraint del_con5 foreign key(lang_id) references language(lang_id) on delete cascade;
alter table topic_travel_talk add constraint del_con6 foreign key(lang_id) references language(lang_id) on delete cascade;
alter table quiz add constraint del_con7 foreign key(lang_id) references language(lang_id) on delete cascade;
alter table user_lang add constraint del_con8 foreign key(lang_id) references language(lang_id) on delete cascade;
alter table user_quiz_score add constraint del_con9 foreign key(lang_id) references language(lang_id) on delete cascade;

