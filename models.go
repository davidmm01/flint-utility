package main

import "database/sql"

type testTable struct {
	ID    int
	Value string
}

type coach struct {
	ID            string         `db:"c_coach_id, primarykey"`
	TeamName      string         `db:"c_team_name"`
	FirstName     string         `db:"c_ult_first_name"`
	PastTeamNames sql.NullString `db:"c_past_team_names"`
	// only use sql.NullString when values likely to be null, doesn't play well with print/ln
}

type roundMatchup struct {
	ID     int    `db:"rm_id, primarykey, autoincrement"`
	Round  int    `db:"rm_round"`
	Year   int    `db:"rm_year"`
	Coach1 string `db:"rm_c_coach_id_1"`
	Coach2 string `db:"rm_c_coach_id_2"`
}

type roundScore struct {
	ID                  int     `db:"rs_id, primarykey, autoincrement"`
	Round               int     `db:"rs_round"`
	Year                int     `db:"rs_year"`
	Coach               string  `db:"rs_c_coach_id"`
	Score               int     `db:"rs_score"`
	Kicks               int     `db:"rs_kicks"`
	Handballs           int     `db:"rs_handballs"`
	Marks               int     `db:"rs_marks"`
	Hitouts             int     `db:"rs_hitouts"`
	Tackles             int     `db:"rs_tackles"`
	DisposalEfficiency  float64 `db:"rs_disposal_efficiency"`
	ContestedPosessions int     `db:"rs_contested_posessions"`
	Rebounds            int     `db:"rs_rebound_50s"`
	Clearances          int     `db:"rs_clearances"`
	Spoils              int     `db:"rs_spoils"`
}

type scoreSettings struct {
	Year                int `db:"ss_year, primarykey"`
	Score               int `db:"ss_score"`
	Kicks               int `db:"ss_kicks"`
	Handballs           int `db:"ss_handballs"`
	Marks               int `db:"ss_marks"`
	Hitouts             int `db:"ss_hitouts"`
	Tackles             int `db:"ss_tackles"`
	DisposalEfficiency  int `db:"ss_disposal_efficiency"`
	ContestedPosessions int `db:"ss_contested_posessions"`
	Rebounds            int `db:"ss_rebound_50s"`
	Clearances          int `db:"ss_clearances"`
	Spoils              int `db:"ss_spoils"`
}
