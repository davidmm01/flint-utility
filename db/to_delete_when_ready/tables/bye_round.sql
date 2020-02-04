--creation 
CREATE TABLE bye_round (
    br_id INT AUTO_INCREMENT PRIMARY KEY,   --auto incrementing id
    br_round INT, --first name on ult footy as displayed
    br_year INT, --year of bye round
);

-->>HAS BEEN RUN IN DB
CREATE TABLE bye_round (br_id INT AUTO_INCREMENT PRIMARY KEY, br_round INT, br_year INT);
--<<HAS BEEN RUN IN DB

-->>HAS BEEN RUN IN DB
INSERT INTO bye_round (br_round, br_year) VALUES (12, 2019);
INSERT INTO bye_round (br_round, br_year) VALUES (13, 2019);
INSERT INTO bye_round (br_round, br_year) VALUES (14, 2019);
--<<HAS BEEN RUN IN DB
