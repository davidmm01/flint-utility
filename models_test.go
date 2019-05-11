package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

// these tests are too fragile in their current state...

func TestCoach(t *testing.T) {
	dbmap := initDb()
	var rowOfCoachTable coach
	err := dbmap.SelectOne(&rowOfCoachTable, "SELECT * FROM coach where c_coach_id='davo';")
	assert.NoError(t, err, "select from table coach failed")
	assert.Equal(t, rowOfCoachTable.ID, "davo", "get c_coach_id failed")
	assert.Equal(t, rowOfCoachTable.TeamName, "flamingos", "get c_team_name failed")
	assert.Equal(t, rowOfCoachTable.FirstName, "The Swarm", "get c_ult_first_name failed")
	assert.Equal(t, rowOfCoachTable.PastTeamNames.String, "", "get c_coach_id failed")
	assert.Equal(t, rowOfCoachTable.PastTeamNames.Valid, false, "get c_coach_id failed")
	defer dbmap.Db.Close()
}

func TestRoundMatchup(t *testing.T) {
	dbmap := initDb()
	var rowOfRounchMatchupTable roundMatchup
	err := dbmap.SelectOne(&rowOfRounchMatchupTable, "select * from round_matchup where rm_id='1';")
	assert.NoError(t, err, "select from table round_matchup failed")
	assert.Equal(t, rowOfRounchMatchupTable.ID, 1, "get rm_id failed")
	assert.Equal(t, rowOfRounchMatchupTable.Year, 2019, "get rm_year failed")
	assert.Equal(t, rowOfRounchMatchupTable.Round, 1, "get rm_round failed")
	assert.Equal(t, rowOfRounchMatchupTable.Coach1, "jim", "get rm_c_coach_id_1 failed")
	assert.Equal(t, rowOfRounchMatchupTable.Coach2, "gab", "get rm_c_coach_id_2 failed")
}

func TestRoundScore(t *testing.T) {
	dbmap := initDb()
	var rowOfRoundScoreTable roundScore
	err := dbmap.SelectOne(&rowOfRoundScoreTable, "select * from round_score where rs_id='1';")
	assert.NoError(t, err, "select from table round_score failed")
	assert.Equal(t, rowOfRoundScoreTable.ID, 1, "get rs_id failed")
	assert.Equal(t, rowOfRoundScoreTable.Round, 1, "get rs_round failed")
	assert.Equal(t, rowOfRoundScoreTable.Year, 2019, "get rs_year failed")
	assert.Equal(t, rowOfRoundScoreTable.Coach, "jim", "get rs_c_coach_id failed")
	assert.Equal(t, rowOfRoundScoreTable.Score, 64, "get rs_score failed")
	assert.Equal(t, rowOfRoundScoreTable.Kicks, 139, "get rs_kicks failed")
	assert.Equal(t, rowOfRoundScoreTable.Handballs, 78, "get rs_handballs failed")
	assert.Equal(t, rowOfRoundScoreTable.Marks, 55, "get rs_marks failed")
	assert.Equal(t, rowOfRoundScoreTable.Hitouts, 16, "get rs_hitouts failed")
	assert.Equal(t, rowOfRoundScoreTable.Tackles, 37, "get rs_tackles failed")
	assert.Equal(t, rowOfRoundScoreTable.DisposalEfficiency, 0.673000, "get rs_disposal_efficiency failed")
	assert.Equal(t, rowOfRoundScoreTable.ContestedPosessions, 79, "get rs_contested_posessions failed")
	assert.Equal(t, rowOfRoundScoreTable.Rebounds, 36, "get rs_rebound_50s failed")
	assert.Equal(t, rowOfRoundScoreTable.Clearances, 26, "get rs_clearances failed")
	assert.Equal(t, rowOfRoundScoreTable.Spoils, 43, "get rs_spoils failed")
}

func TestScoreSettings(t *testing.T) {
	dbmap := initDb()
	var rowOfScoreSettings scoreSettings
	err := dbmap.SelectOne(&rowOfScoreSettings, "select * from score_settings where ss_year=2019;")
	assert.NoError(t, err, "select from table score_settings failed")
	assert.Equal(t, rowOfScoreSettings.Year, 2019, "get ss_year failed")
	assert.Equal(t, rowOfScoreSettings.Score, 8, "get ss_score failed")
	assert.Equal(t, rowOfScoreSettings.Kicks, 6, "get ss_kicks failed")
	assert.Equal(t, rowOfScoreSettings.Handballs, 6, "get ss_handballs failed")
	assert.Equal(t, rowOfScoreSettings.Marks, 4, "get ss_marks failed")
	assert.Equal(t, rowOfScoreSettings.Hitouts, 3, "get ss_hitouts failed")
	assert.Equal(t, rowOfScoreSettings.Tackles, 4, "get ss_tackles failed")
	assert.Equal(t, rowOfScoreSettings.DisposalEfficiency, 3, "get ss_disposal_efficiency failed")
	assert.Equal(t, rowOfScoreSettings.ContestedPosessions, 2, "get ss_contested_posessions failed")
	assert.Equal(t, rowOfScoreSettings.Rebounds, 1, "get ss_rebound_50s failed")
	assert.Equal(t, rowOfScoreSettings.Clearances, 1, "get ss_clearances failed")
	assert.Equal(t, rowOfScoreSettings.Spoils, 3, "get ss_spoils failed")
}
