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

-- round 1
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'steve', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'milbs', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'jim', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'cost', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'calv', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'karl', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'frank', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'fewy', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'doe', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'bark', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'kev', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'sam', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'salc', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'gab', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'davo', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'schlong', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'staff', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (1, 2019, 'shust', , , , , , , , , , , );

-- round 2
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'steve', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'milbs', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'jim', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'cost', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'calv', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'karl', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'frank', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'fewy', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'doe', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'bark', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'kev', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'sam', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'salc', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'gab', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'davo', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'schlong', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'staff', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (2, 2019, 'shust', , , , , , , , , , , );

-- round 3
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'steve', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'milbs', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'jim', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'cost', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'calv', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'karl', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'frank', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'fewy', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'doe', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'bark', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'kev', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'sam', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'salc', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'gab', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'davo', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'schlong', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'staff', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (3, 2019, 'shust', , , , , , , , , , , );

-- round 4
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'steve', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'milbs', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'jim', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'cost', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'calv', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'karl', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'frank', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'fewy', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'doe', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'bark', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'kev', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'sam', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'salc', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'gab', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'davo', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'schlong', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'staff', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (4, 2019, 'shust', , , , , , , , , , , );

-- round 5
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'steve', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'milbs', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'jim', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'cost', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'calv', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'karl', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'frank', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'fewy', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'doe', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'bark', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'kev', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'sam', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'salc', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'gab', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'davo', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'schlong', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'staff', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (5, 2019, 'shust', , , , , , , , , , , );

-- round 6
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'steve', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'milbs', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'jim', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'cost', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'calv', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'karl', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'frank', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'fewy', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'doe', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'bark', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'kev', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'sam', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'salc', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'gab', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'davo', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'schlong', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'staff', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (6, 2019, 'shust', , , , , , , , , , , );

-- round 7
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'steve', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'milbs', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'jim', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'cost', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'calv', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'karl', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'frank', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'fewy', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'doe', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'bark', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'kev', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'sam', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'salc', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'gab', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'davo', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'schlong', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'staff', , , , , , , , , , , );
INSERT INTO round_score (rs_round, rs_year, rs_c_coach_id, rs_score, rs_kicks, rs_handballs, rs_marks, rs_hitouts, rs_tackles, rs_disposal_efficiency, rs_contested_posessions, rs_rebound_50s, rs_clearances, rs_spoils
) VALUES (7, 2019, 'shust', , , , , , , , , , , );



CREATE TABLE round_matchup (
    rm_round INT,
    rm_year INT,
    rm_c_coach_id_1 VARCHAR(20), --what to link to on coach? need to decide on PK
    rm_c_coach_id_2 VARCHAR(20)
    rm_type VARCHAR(20) --takes types 'normal', 'bye',
);

--round 1
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'jim', 'gab', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'staff', 'bark', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'schlong', 'steve', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'kev', 'davo', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'doe', 'calv', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'frank', 'sam', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'karl', 'cost', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'milbs', 'shust', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (1, 2019, 'salc', 'fewy', 'normal');

--round 2
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'jim', 'davo', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'staff', 'steve', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'schlong', 'kev', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'doe', 'bark', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'frank', 'gab', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'karl', 'calv', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'milbs', 'sam', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'salc', 'cost', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (2, 2019, 'shust', 'fewy', 'normal');

--round 3
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'jim', 'schlong', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'staff', 'doe', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'kev', 'frank', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'karl', 'steve', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'milbs', 'davo', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'salc', 'bark', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'gab', 'fewy', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'calv', 'shust', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (3, 2019, 'sam', 'cost', 'normal');

--round 4
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'jim', 'frank', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'gab', 'cost', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'bark', 'shust', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'davo', 'fewy', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'salc', 'steve', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'kev', 'milbs', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'staff', 'karl', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'sam', 'calv', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (4, 2019, 'schlong', 'doe', 'normal');

--round 5
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'jim', 'milbs', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'davo', 'cost', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'sam', 'bark', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'gab', 'calv', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'kev', 'fewy', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'staff', 'salc', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'shust', 'steve', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'doe', 'karl', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (5, 2019, 'schlong', 'frank', 'normal');

--round 6
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'schlong', 'karl', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'milbs', 'frank', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'doe', 'salc', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'jim', 'fewy', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'staff', 'shust', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'kev', 'cost', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'sam', 'steve', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'davo', 'calv', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (6, 2019, 'gab', 'bark', 'normal');

--round 7
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'schlong', 'milbs', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'karl', 'salc', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'frank', 'fewy', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'doe', 'shust', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'jim', 'cost', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'staff', 'sam', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'kev', 'calv', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'gab', 'steve', 'normal');
INSERT INTO round_matchup (rm_round, rm_year, rm_coach_1, rm_coach_2) VALUES (7, 2019, 'davo', 'bark', 'normal');



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


