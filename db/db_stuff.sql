CREATE TABLE 'bye_round' (
  'br_id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'br_round' INTEGER NOT NULL,
  'br_year' INTEGER NOT NULL
);
INSERT INTO 'bye_round' ('br_round', 'br_year') VALUES (12,2019),(13,2019),(14,2019),(12,2018),(13,2018),(14,2018),(11,2017),(12,2017),(13,2017),(13,2016),(14,2016),(15,2016);

CREATE TABLE 'lineup_settings' (
  'ls_year' INTEGER NOT NULL PRIMARY KEY,
  'ls_backs' INTEGER DEFAULT NULL,
  'ls_centres' INTEGER DEFAULT NULL,
  'ls_rucks' INTEGER DEFAULT NULL,
  'ls_forwards' INTEGER DEFAULT NULL,
  'ls_utilities' INTEGER DEFAULT NULL,
  'ls_backs_em' INTEGER DEFAULT NULL,
  'ls_centres_em' INTEGER DEFAULT NULL,
  'ls_rucks_em' INTEGER DEFAULT NULL,
  'ls_forwards_em' INTEGER DEFAULT NULL,
  'ls_utilities_em' INTEGER DEFAULT NULL,
  'ls_bench' INTEGER DEFAULT NULL
);
INSERT INTO 'lineup_settings' VALUES (2016,3,3,1,3,1,1,1,1,1,1,0),(2017,3,3,1,3,1,1,1,1,1,1,0),(2018,3,3,1,3,1,1,1,1,1,1,0),(2019,3,3,1,3,2,1,1,1,1,1,0),(2020,3,3,1,3,2,1,1,1,1,1,0);

CREATE TABLE 'coach' (
  'c_coach_id' VARCHAR(20) PRIMARY KEY,
  'c_real_name' VARCHAR(200) NOT NULL
);
INSERT INTO 'coach' ('c_coach_id', 'c_real_name') VALUES ("bark", "Marcus H"),("calv", "Lucas C"),("cost", "Nick C"),("davo", "David M"),("doe", "James W"),("fewy", "James F"),("frank", "Frank D"),("gab", "Gabriel V"),("jim", "James C"),("karl", "Karl S"),("kev", "Kevin H"),("milbs", "Andrew M"),("salc", "Chris S"),("sam", "Sam C"),("schlong", "Jack L"),("shust", "Luke S"),("staff", "James S"),("steve", "Steve C");

CREATE TABLE 'coach_season' (
  'cs_id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  'cs_coach' VARCHAR(20) NOT NULL,
  'season' INTEGER NOT NULL,
  FOREIGN KEY('cs_coach') REFERENCES coach('c_coach_id')
);
INSERT INTO 'coach_season' ('cs_coach', 'season') VALUES ("bark", 2016),("calv", 2016),("cost", 2016),("davo", 2016),("doe", 2016),("fewy", 2016),("frank", 2016),("gab", 2016),("jim", 2016),("karl", 2016),("kev", 2016),("milbs", 2016),("salc", 2016),("sam", 2016),("schlong", 2016),("shust", 2016),("staff", 2016),("steve", 2016),("bark", 2017),("calv", 2017),("cost", 2017),("davo", 2017),("doe", 2017),("fewy", 2017),("frank", 2017),("gab", 2017),("jim", 2017),("karl", 2017),("kev", 2017),("milbs", 2017),("salc", 2017),("sam", 2017),("schlong", 2017),("shust", 2017),("staff", 2017),("steve", 2017),("bark", 2018),("calv", 2018),("cost", 2018),("davo", 2018),("doe", 2018),("fewy", 2018),("frank", 2018),("gab", 2018),("jim", 2018),("karl", 2018),("kev", 2018),("milbs", 2018),("salc", 2018),("sam", 2018),("schlong", 2018),("shust", 2018),("staff", 2018),("steve", 2018),("bark", 2019),("calv", 2019),("cost", 2019),("davo", 2019),("doe", 2019),("fewy", 2019),("frank", 2019),("gab", 2019),("jim", 2019),("karl", 2019),("kev", 2019),("milbs", 2019),("salc", 2019),("sam", 2019),("schlong", 2019),("shust", 2019),("staff", 2019),("steve", 2019),("bark", 2020),("calv", 2020),("cost", 2020),("davo", 2020),("doe", 2020),("fewy", 2020),("frank", 2020),("gab", 2020),("jim", 2020),("karl", 2020),("kev", 2020),("milbs", 2020),("salc", 2020),("sam", 2020),("schlong", 2020),("shust", 2020),("staff", 2020),("steve", 2020),("bark", 2021),("calv", 2021),("cost", 2021),("davo", 2021),("doe", 2021),("fewy", 2021),("frank", 2021),("gab", 2021),("jim", 2021),("karl", 2021),("kev", 2021),("milbs", 2021),("salc", 2021),("sam", 2021),("schlong", 2021),("shust", 2021),("staff", 2021),("steve", 2021);

CREATE TABLE 'score_settings' (
  'ss_year' INTEGER PRIMARY KEY,
  'ss_score' INTEGER DEFAULT NULL,
  'ss_kicks' INTEGER DEFAULT NULL,
  'ss_handballs' INTEGER DEFAULT NULL,
  'ss_marks' INTEGER DEFAULT NULL,
  'ss_hitouts' INTEGER DEFAULT NULL,
  'ss_tackles' INTEGER DEFAULT NULL,
  'ss_disposal_efficiency' INTEGER DEFAULT NULL,
  'ss_contested_posessions' INTEGER DEFAULT NULL,
  'ss_rebound_50s' INTEGER DEFAULT NULL,
  'ss_clearances' INTEGER DEFAULT NULL,
  'ss_spoils' INTEGER DEFAULT NULL
);
INSERT INTO 'score_settings' VALUES (2016,9,6,6,4,3,4,2,2,1,2,2),(2017,8,6,6,4,3,4,1,2,2,1,2),(2018,7,6,6,4,3,4,2,2,1,1,3),(2019,8,6,6,4,3,4,3,2,1,1,3),(2020,8,6,6,4,3,4,3,2,1,1,3),(2021,8,6,6,4,3,4,3,2,1,1,3);

CREATE TABLE 'round_matchup' (
  'rm_id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'rm_year' INTEGER NOT NULL,
  'rm_round' INTEGER NOT NULL,
  'rm_game' INTEGER NOT NULL,
  'rm_c_coach_id_1' varchar(20) NOT NULL,
  'rm_c_coach_id_2' varchar(20) NOT NULL,
  FOREIGN KEY('rm_c_coach_id_1') REFERENCES coach('c_coach_id'),
  FOREIGN KEY('rm_c_coach_id_2') REFERENCES coach('c_coach_id')
);

CREATE TABLE 'round_score' (
  'rs_id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'rs_year' INTEGER NOT NULL,
  'rs_round' INTEGER NOT NULL,
  'rs_game' INTEGER NOT NULL,
  'rs_c_coach_id' VARCHAR(20) NOT NULL,
  'rs_score' INTEGER DEFAULT NULL,
  'rs_kicks' INTEGER DEFAULT NULL,
  'rs_handballs' INTEGER DEFAULT NULL,
  'rs_marks' INTEGER DEFAULT NULL,
  'rs_hitouts' INTEGER DEFAULT NULL,
  'rs_tackles' INTEGER DEFAULT NULL,
  'rs_disposal_efficiency' FLOAT(7,6) DEFAULT NULL,
  'rs_contested_posessions' INTEGER DEFAULT NULL,
  'rs_rebound_50s' INTEGER DEFAULT NULL,
  'rs_clearances' INTEGER DEFAULT NULL,
  'rs_spoils' INTEGER DEFAULT NULL,
  'rs_real_value' INTEGER DEFAULT NULL,
  FOREIGN KEY ('rs_c_coach_id') REFERENCES 'coach' ('c_coach_id') ON DELETE SET NULL
);

CREATE TABLE 'player_score' (
  'ps_id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'ps_year' INTEGER NOT NULL,
  'ps_round' INTEGER NOT NULL,
  'ps_game' INTEGER NOT NULL,
  'ps_c_coach_id' VARCHAR(20) NOT NULL,
  'ps_player' VARCHAR(200) NOT NULL,
  'ps_score' INTEGER DEFAULT NULL,
  'ps_kicks' INTEGER DEFAULT NULL,
  'ps_handballs' INTEGER DEFAULT NULL,
  'ps_marks' INTEGER DEFAULT NULL,
  'ps_hitouts' INTEGER DEFAULT NULL,
  'ps_tackles' INTEGER DEFAULT NULL,
  'ps_disposal_efficiency' FLOAT(7,6) DEFAULT NULL,
  'ps_contested_posessions' INTEGER DEFAULT NULL,
  'ps_rebound_50s' INTEGER DEFAULT NULL,
  'ps_clearances' INTEGER DEFAULT NULL,
  'ps_spoils' INTEGER DEFAULT NULL,
  FOREIGN KEY ('ps_c_coach_id') REFERENCES 'coach' ('c_coach_id') ON DELETE SET NULL
);










