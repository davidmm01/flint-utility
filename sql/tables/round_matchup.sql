--creation
CREATE TABLE round_matchup (
    rm_id INT AUTO_INCREMENT PRIMARY KEY,   --auto incrementing id
    rm_round INT,
    rm_year INT,
    rm_c_coach_id_1 VARCHAR(20),
    FOREIGN KEY (rm_c_coach_id_1) REFERENCES coach(c_coach_id) ON DELETE SET NULL,  --foreign key to coach table 
    rm_c_coach_id_2 VARCHAR(20),
    FOREIGN KEY (rm_c_coach_id_2) REFERENCES coach(c_coach_id) ON DELETE SET NULL,  --foreign key to coach table 
);

-->>HAS BEEN RUN IN DB
CREATE TABLE round_matchup (rm_id INT AUTO_INCREMENT PRIMARY KEY, rm_round INT, rm_year INT, rm_c_coach_id_1 VARCHAR(20), FOREIGN KEY (rm_c_coach_id_1) REFERENCES coach(c_coach_id) ON DELETE SET NULL, rm_c_coach_id_2 VARCHAR(20), FOREIGN KEY (rm_c_coach_id_2) REFERENCES coach(c_coach_id) ON DELETE SET NULL);
--<<HAS BEEN RUN IN DB



--inserts for round_matchups table
-->>HAS BEEN RUN IN DB
--round 1 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'jim', 'gab');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'staff', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'schlong', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'kev', 'davo');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'doe', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'frank', 'sam');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'karl', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'milbs', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (1, 2019, 'salc', 'fewy');

--round 2 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'jim', 'davo');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'staff', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'schlong', 'kev');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'doe', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'frank', 'gab');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'karl', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'milbs', 'sam');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'salc', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (2, 2019, 'shust', 'fewy');

--round 3 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'jim', 'schlong');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'staff', 'doe');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'kev', 'frank');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'karl', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'milbs', 'davo');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'salc', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'gab', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'calv', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (3, 2019, 'sam', 'cost');

--round 4 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'jim', 'frank');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'gab', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'bark', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'davo', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'salc', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'kev', 'milbs');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'staff', 'karl');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'sam', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (4, 2019, 'schlong', 'doe');

--round 5 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'jim', 'milbs');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'davo', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'sam', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'gab', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'kev', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'staff', 'salc');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'shust', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'doe', 'karl');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (5, 2019, 'schlong', 'frank');

--round 6 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'schlong', 'karl');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'milbs', 'frank');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'doe', 'salc');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'jim', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'staff', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'kev', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'sam', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'davo', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (6, 2019, 'gab', 'bark');

--round 7 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'schlong', 'milbs');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'karl', 'salc');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'frank', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'doe', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'jim', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'staff', 'sam');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'kev', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'gab', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_c_coach_id_1, rm_c_coach_id_2) VALUES (7, 2019, 'davo', 'bark');
--<<HAS BEEN RUN IN DB

