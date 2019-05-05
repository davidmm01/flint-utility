-- initial table creation and data population

CREATE TABLE coach (
    c_coach_id VARCHAR(20) NOT NULL PRIMARY KEY, --my identifier for the coach
    c_team_name VARCHAR(200), --current team name
    c_ult_first_name VARCHAR(200), --first name on ult footy as displayed
    c_past_team_names BLOB --comma separated blob of previous team names
);

INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('steve', 'Ardern''s Army', 'Steve', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('milbs', 'TOOMUCHDOG', 'Andrew', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('jim', 'Stand By Crouch', 'jermes', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('cost', 'CostaWhyte', 'Andy', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('calv', 'The Spreadsheet', 'Lucas', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('karl', 'Bayside City Council', 'Karl', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('frank', 'The Bev Temples', 'Franco', null); 
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('fewy', 'The Dow Jones', 'James', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('doe', 'Mushroom Alfredo', 'James', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('bark', 'PASSWORD IS BAYSIDE', 'Marcus', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('kev', 'Derry Boys', 'Kevin', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('sam', 'Trunk', 'Sam', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('salc', '_thebiggerboi_', 'Chris', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('gab', 'Shrooms are great', 'Gabriel', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('davo', 'flamingos', 'The Swarm', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('schlong', 'Green Heinekens', 'Jack', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('staff', 'Costa''s Shroom Caps ', 'staffa', null);
INSERT INTO coach (c_coach_id, c_team_name, c_ult_first_name, c_past_team_names) VALUES ('shust', 'The Faceless Men', 'shuster', null);



CREATE TABLE round_score (
    rs_round INT, --round number
    rs_year INT, --year
    rs_c_coach_id VARCHAR(20) FOREIGN KEY, --link to coach table
    rs_score INT,
    rs_kicks INT,
    rs_handballs INT,
    rs_marks INT,
    rs_hitouts INT,
    rs_tackles INT,
    rs_disposal_efficiency FLOAT,
    rs_contested_posessions INT,
    rs_rebound_50s INT,
    rs_clearances INT,
    rs_spoils INT
);

--inserts for round_score table
--round 1 2019
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'jim', 64, 139, 78, 55, 16, 37, 0.673, 79, 36, 26, 43);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'gab', 23, 128, 108, 48, 18, 44, 0.725, 80, 24, 21, 13);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'staff', 40, 124, 71, 44, 35, 34, 0.718, 71, 21, 22, 10);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'bark', 65, 171, 83, 47, 34, 45, 0.677, 97, 35, 32, 15);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'schlong', 32, 138, 102, 48, 16, 31, 0.725, 103, 25, 35, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'steve', 54, 141, 121, 49, 34, 40, 0.725, 107, 22, 40, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'kev', 47, 133, 90, 49, 45, 29, 0.717, 80, 24, 17, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'davo', 45, 127, 101, 45, 16, 34, 0.750, 100, 34, 26, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'doe', 57, 162, 106, 52, 6, 41, 0.716, 112, 22, 43, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'calv', 23, 134, 125, 45, 20, 42, 0.703, 113, 28, 32, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'frank', 26, 135, 107, 39, 16, 39, 0.756, 110, 29, 27, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'sam', 25, 150, 116, 54, 32, 37, 0.703, 108, 37, 35, 20);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'karl', 39, 120, 109, 40, 25, 45, 0.690, 91, 26, 26, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'cost', 51, 120, 94, 50, 36, 33, 0.706, 80, 30, 17, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'milbs', 31, 160, 79, 64, 21, 28, 0.686, 75, 45, 12, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'shust', 45, 126, 87, 41, 41, 34, 0.718, 94, 28, 31, 9);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'salc', 35, 133, 102, 54, 23, 25, 0.745, 84, 20, 30, 21);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (1, 2019, 'fewy', 99, 142, 66, 63, 0, 35, 0.692, 86, 21, 15, 15);

--round 2 2019
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'jim', 66, 154, 75, 57, 38, 30, 0.633, 83, 26, 21, 31);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'davo', 61, 127, 101, 45, 14, 49, 0.724, 83, 25, 24, 19);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'staff', 38, 156, 81, 54, 37, 27, 0.684, 102, 25, 37, 9);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'steve', 41, 158, 120, 64, 34, 36, 0.705, 125, 34, 39, 10);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'schlong', 37, 140, 105, 60, 44, 43, 0.657, 98, 20, 30, 9);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'kev', 53, 127, 83, 40, 23, 35, 0.733, 83, 25, 19, 21);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'doe', 30, 151, 112, 64, 11, 30, 0.707, 110, 21, 50, 15);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'bark', 35, 137, 108, 49, 23, 40, 0.682, 108, 17, 44, 13);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'frank', 51, 167, 138, 54, 34, 40, 0.725, 120, 25, 53, 15);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'gab', 43, 151, 96, 62, 25, 33, 0.814, 74, 21, 20, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'karl', 44, 138, 105, 54, 15, 51, 0.733, 101, 28, 33, 20);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'calv', 36, 140, 111, 57, 20, 44, 0.709, 109, 18, 42, 13);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'milbs', 84, 170, 71, 67, 53, 31, 0.730, 84, 38, 25, 21);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'sam', 64, 149, 89, 64, 40, 32, 0.735, 74, 30, 24, 11);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'salc', 62, 137, 104, 45, 32, 46, 0.730, 101, 19, 25, 28);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'cost', 50, 132, 80, 42, 33, 32, 0.726, 85, 32, 22, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'shust', 30, 137, 104, 55, 33, 31, 0.734, 89, 32, 33, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (2, 2019, 'fewy', 62, 99, 64, 42, 0, 30, 0.632, 61, 19, 20, 17);

--round 3 2019
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'jim', 97, 131, 77, 41, 52, 41, 0.663, 85, 16, 26, 20);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'schlong', 75, 130, 109, 44, 24, 38, 0.715, 105, 15, 34, 21);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'staff', 72, 145, 70, 67, 38, 32, 0.684, 77, 19, 14, 18);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'doe', 91, 154, 128, 48, 28, 39, 0.734, 111, 31, 37, 11);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'kev', 51, 129, 99, 60, 40, 36, 0.750, 91, 20, 24, 15);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'frank', 49, 173, 134, 60, 19, 26, 0.720, 123, 33, 47, 10);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'karl', 24, 133, 95, 51, 17, 31, 0.693, 90, 15, 28, 18);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'steve', 56, 163, 109, 64, 28, 37, 0.739, 98, 26, 38, 13);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'milbs', 60, 118, 66, 60, 43, 20, 0.772, 60, 28, 18, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'davo', 36, 112, 132, 38, 17, 34, 0.758, 122, 24, 39, 22);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'salc', 75, 150, 81, 62, 22, 45, 0.710, 90, 15, 30, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'bark', 27, 144, 111, 37, 22, 46, 0.722, 93, 17, 39, 16);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'gab', 41, 137, 68, 57, 24, 22, 0.722, 75, 31, 24, 19);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'fewy', 94, 150, 94, 57, 0, 33, 0.713, 93, 26, 19, 22);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'calv', 69, 163, 105, 55, 7, 39, 0.728, 116, 39, 48, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'shust', 37, 133, 101, 54, 42, 30, 0.714, 88, 19, 37, 19);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'sam', 37, 145, 95, 61, 11, 40, 0.746, 84, 24, 26, 13);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (3, 2019, 'cost', 63, 139, 103, 45, 33, 44, 0.698, 92, 24, 29, 11);

--round 4 2019
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'jim', 80, 138, 75, 64, 50, 32, 0.714, 75, 21, 14, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'frank', 30, 140, 120, 65, 22, 32, 0.692, 95, 27, 33, 11);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'gab', 37, 130, 93, 64, 29, 43, 0.803, 71, 22, 28, 19);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'cost', 47, 140, 89, 68, 41, 36, 0.721, 86, 20, 24, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'bark', 16, 148, 106, 45, 18, 47, 0.689, 102, 32, 42, 13);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'shust', 45, 134, 81, 57, 60, 45, 0.712, 99, 17, 28, 13);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'davo', 79, 152, 101, 60, 28, 32, 0.688, 113, 25, 31, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'fewy', 28, 152, 99, 84, 0, 33, 0.757, 81, 20, 17, 23);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'salc', 26, 122, 102, 52, 40, 40, 0.750, 84, 23, 24, 19);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'steve', 55, 152, 129, 67, 24, 32, 0.790, 107, 28, 37, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'kev', 37, 153, 88, 84, 11, 25, 0.722, 72, 32, 17, 18);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'milbs', 48, 161, 67, 61, 57, 16, 0.719, 74, 34, 18, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'staff', 45, 136, 74, 66, 37, 38, 0.724, 71, 22, 16, 28);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'karl', 33, 149, 117, 68, 6, 42, 0.756, 104, 35, 33, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'sam', 40, 145, 78, 62, 20, 30, 0.812, 81, 26, 21, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'calv', 27, 139, 100, 54, 21, 41, 0.703, 92, 21, 27, 18);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'schlong', 70, 154, 87, 64, 22, 26, 0.734, 94, 19, 27, 16);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (4, 2019, 'doe', 42, 154, 116, 49, 23, 41, 0.696, 111, 17, 36, 15);

--round 5 2019
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'jim', 46, 127, 92, 61, 47, 31, 0.689, 83, 15, 17, 23);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'milbs', 36, 135, 91, 62, 32, 25, 0.770, 71, 25, 15, 19);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'davo', 82, 144, 111, 55, 13, 36, 0.769, 98, 33, 36, 28);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'cost', 60, 156, 96, 65, 43, 41, 0.702, 95, 32, 32, 7);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'sam', 70, 165, 97, 62, 26, 25, 0.756, 97, 26, 29, 16);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'bark', 38, 138, 139, 64, 21, 40, 0.762, 86, 25, 29, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'gab', 32, 134, 101, 62, 14, 36, 0.770, 79, 24, 28, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'calv', 10, 117, 126, 44, 17, 35, 0.724, 86, 18, 34, 18);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'kev', 66, 122, 116, 49, 24, 26, 0.773, 84, 21, 26, 23);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'fewy', 63, 146, 75, 53, 0, 35, 0.751, 72, 28, 16, 10);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'staff', 106, 164, 70, 68, 35, 31, 0.748, 93, 24, 21, 23);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'salc', 60, 134, 105, 50, 37, 24, 0.749, 91, 20, 22, 23);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'shust', 42, 129, 82, 59, 36, 27, 0.701, 68, 15, 20, 9);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'steve', 46, 153, 119, 61, 25, 40, 0.779, 102, 24, 33, 10);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'doe', 31, 134, 134, 49, 23, 29, 0.728, 109, 13, 43, 9);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'karl', 34, 143, 117, 64, 25, 33, 0.750, 88, 22, 30, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'schlong', 41, 121, 88, 57, 25, 34, 0.694, 78, 16, 21, 24);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (5, 2019, 'frank', 20, 144, 122, 70, 27, 23, 0.692, 85, 29, 29, 12);

--round 6 2019
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'schlong', 58, 136, 87, 53, 21, 35, 0.650, 89, 17, 26, 33);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'karl', 43, 139, 100, 57, 30, 39, 0.665, 108, 22, 36, 21);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'milbs', 68, 162, 85, 69, 50, 28, 0.721, 80, 31, 23, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'frank', 40, 150, 121, 61, 25, 38, 0.723, 100, 24, 23, 4);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'doe', 62, 132, 112, 51, 31, 40, 0.664, 114, 10, 30, 8);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'salc', 19, 143, 97, 55, 41, 40, 0.733, 83, 19, 36, 16);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'jim', 40, 144, 81, 56, 43, 42, 0.627, 94, 31, 27, 30);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'fewy', 49, 152, 95, 69, 0, 44, 0.789, 95, 29, 22, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'staff', 60, 141, 101, 76, 55, 39, 0.736, 111, 23, 30, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'shust', 28, 123, 101, 48, 44, 33, 0.723, 86, 23, 26, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'kev', 25, 144, 103, 44, 28, 29, 0.745, 87, 32, 25, 22);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'cost', 48, 137, 103, 46, 53, 35, 0.663, 104, 19, 30, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'sam', 65, 117, 110, 42, 40, 32, 0.709, 99, 25, 25, 12);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'steve', 40, 144, 113, 59, 33, 49, 0.704, 86, 24, 29, 14);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'davo', 54, 117, 106, 45, 0, 43, 0.695, 99, 26, 39, 17);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'calv', 15, 161, 125, 63, 32, 48, 0.734, 104, 32, 40, 25);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'gab', 39, 151, 106, 58, 26, 42, 0.778, 91, 31, 36, 19);
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils) VALUES (6, 2019, 'bark', 64, 144, 97, 47, 27, 38, 0.651, 87, 17, 29, 19);


CREATE TABLE round_matchup (
    rm_round INT,
    rm_year INT,
    rm_c_coach_id_1 VARCHAR(20), --what to link to on coach? need to decide on PK
    rm_c_coach_id_2 VARCHAR(20)
);

--inserts for round_matchups table
--round 1 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'jim', 'gab');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'staff', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'schlong', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'kev', 'davo');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'doe', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'frank', 'sam');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'karl', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'milbs', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'salc', 'fewy');

--round 2 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'jim', 'davo');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'staff', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'schlong', 'kev');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'doe', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'frank', 'gab');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'karl', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'milbs', 'sam');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'salc', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'shust', 'fewy');

--round 3 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'jim', 'schlong');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'staff', 'doe');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'kev', 'frank');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'karl', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'milbs', 'davo');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'salc', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'gab', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'calv', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'sam', 'cost');

--round 4 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'jim', 'frank');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'gab', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'bark', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'davo', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'salc', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'kev', 'milbs');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'staff', 'karl');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'sam', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'schlong', 'doe');

--round 5 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'jim', 'milbs');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'davo', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'sam', 'bark');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'gab', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'kev', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'staff', 'salc');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'shust', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'doe', 'karl');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'schlong', 'frank');

--round 6 2019
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'schlong', 'karl');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'milbs', 'frank');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'doe', 'salc');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'jim', 'fewy');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'staff', 'shust');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'kev', 'cost');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'sam', 'steve');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'davo', 'calv');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'gab', 'bark');



CREATE TABLE score_settings (
    ss_year INT,
    ss_score INT,
    ss_kicks INT,
    ss_handballs INT,
    ss_marks INT,
    ss_hitouts INT,
    ss_tackles INT,
    ss_disposal_efficiency INT,
    ss_contested_posessions INT,
    ss_rebound_50s INT,
    ss_clearances INT,
    ss_spoils INT
);

INSERT INTO score_settings (
    ss_year, ss_score, ss_kicks, ss_handballs, ss_marks, ss_hitouts, ss_tackles, 
    ss_disposal_efficiency, ss_contested_posessions, ss_rebound_50s,
    ss_clearances, ss_spoils
) VALUES (2019, 8, 6, 6, 4, 3, 4, 3, 2, 1, 1, 3);


