--creation
-->>HAS BEEN RUN IN DB
CREATE TABLE score_settings (
    ss_year INT NOT NULL PRIMARY KEY,
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
--<<HAS BEEN RUN IN DB

--inserts
-->>HAS BEEN RUN IN DB
INSERT INTO score_settings (
    ss_year, ss_score, ss_kicks, ss_handballs, ss_marks, ss_hitouts, ss_tackles, ss_disposal_efficiency, 
    ss_contested_posessions, ss_rebound_50s, ss_clearances, ss_spoils
    ) VALUES (2019, 8, 6, 6, 4, 3, 4, 3, 2, 1, 1, 3);

INSERT INTO score_settings (ss_year, ss_score, ss_kicks, ss_handballs, ss_marks, ss_hitouts, ss_tackles, ss_disposal_efficiency, ss_contested_posessions, ss_rebound_50s, ss_clearances, ss_spoils) VALUES (2020, 8, 6, 6, 4, 3, 4, 3, 2, 1, 1, 3);
INSERT INTO score_settings (ss_year, ss_score, ss_kicks, ss_handballs, ss_marks, ss_hitouts, ss_tackles, ss_disposal_efficiency, ss_contested_posessions, ss_rebound_50s, ss_clearances, ss_spoils) VALUES (2018, 7, 6, 6, 4, 3, 4, 2, 2, 1, 1, 3);
INSERT INTO score_settings (ss_year, ss_score, ss_kicks, ss_handballs, ss_marks, ss_hitouts, ss_tackles, ss_disposal_efficiency, ss_contested_posessions, ss_rebound_50s, ss_clearances, ss_spoils) VALUES (2017, 8, 6, 6, 4, 3, 4, 1, 2, 2, 1, 2);
INSERT INTO score_settings (ss_year, ss_score, ss_kicks, ss_handballs, ss_marks, ss_hitouts, ss_tackles, ss_disposal_efficiency, ss_contested_posessions, ss_rebound_50s, ss_clearances, ss_spoils) VALUES (2016, 9, 6, 6, 4, 3, 4, 2, 2, 1, 2, 2);
--<<HAS BEEN RUN IN DB
