-- round_score table creation
CREATE TABLE round_score (
    rs_id INT AUTO_INCREMENT PRIMARY KEY,   --auto incrementing id
    rs_round INT,
    rs_year INT,
    rs_c_coach_id VARCHAR(20), --coach of the score
    FOREIGN KEY (rs_c_coach_id) REFERENCES coach(c_coach_id) ON DELETE SET NULL,  --foreign key to coach table 
    rs_score INT, --score, being goals*6 + behinds.  NOT the total score for the round (i.e. score+kicks+hb+...)
    rs_kicks INT,
    rs_handballs INT, 
    rs_marks INT, 
    rs_hitouts INT, 
    rs_tackles INT, 
    rs_disposal_efficiency FLOAT(7,6), --6 digits of precision, probably only need 3 or 4
    rs_contested_posessions INT, 
    rs_rebound_50s INT, 
    rs_clearances INT, 
    rs_spoils INT
);
-->>HAS BEEN RUN IN DB
CREATE TABLE round_score (rs_id INT AUTO_INCREMENT PRIMARY KEY, rs_round INT, rs_year INT, rs_c_coach_id VARCHAR(20), FOREIGN KEY (rs_c_coach_id) REFERENCES coach(c_coach_id) ON DELETE SET NULL, rs_score INT, rs_kicks INT, rs_handballs INT, rs_marks INT, rs_hitouts INT, rs_tackles INT, rs_disposal_efficiency FLOAT(7,6), rs_contested_posessions INT, rs_rebound_50s INT, rs_clearances INT, rs_spoils INT);
--<<HAS BEEN RUN IN DB

--inserts automatically performed by formatter.py script
