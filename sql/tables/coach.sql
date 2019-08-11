--creation 
CREATE TABLE coach (
    c_coach_id VARCHAR(20) NOT NULL PRIMARY KEY, --my identifier for the coach
    c_team_name VARCHAR(200), --current team name
    c_ult_first_name VARCHAR(200), --first name on ult footy as displayed
    c_past_team_names BLOB --comma separated blob of previous team names
);

-- TODO: this coach table is bad, it needs to have a c_year on it too, allowing for different coaches across year (unlikely to be an issue for a few years atleast) 
--       regardless, fixing this is still high priority as refactor after alot of work is done will be annoying
--       also might remove the c_past_team_names, i don't care about it, should really be a separate table for coach aliases or something

-->>HAS BEEN RUN IN DB
CREATE TABLE coach (c_coach_id VARCHAR(20) NOT NULL PRIMARY KEY, c_team_name VARCHAR(200), c_ult_first_name VARCHAR(200), c_past_team_names BLOB);
--<<HAS BEEN RUN IN DB


--inserts
-- >>HAS BEEN RUN IN DB
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
--<<HAS BEEN RUN IN DB
