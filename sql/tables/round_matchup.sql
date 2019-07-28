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


--inserts automatically performed by formatter.py script
