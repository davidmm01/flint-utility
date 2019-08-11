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
	assert.Equal(t, "davo", rowOfCoachTable.ID, "get c_coach_id failed")
	assert.Equal(t, "flamingos", rowOfCoachTable.TeamName, "get c_team_name failed")
	assert.Equal(t, "The Swarm", rowOfCoachTable.FirstName, "get c_ult_first_name failed")
	assert.Equal(t, "", rowOfCoachTable.PastTeamNames.String, "get c_coach_id failed")
	assert.Equal(t, false, rowOfCoachTable.PastTeamNames.Valid, "get c_coach_id failed")
	defer dbmap.Db.Close()
}

func TestRoundMatchup(t *testing.T) {
	dbmap := initDb()
	var rowOfRounchMatchupTable roundMatchup
	err := dbmap.SelectOne(&rowOfRounchMatchupTable, "select * from round_matchup where rm_id='1';")
	assert.NoError(t, err, "select from table round_matchup failed")
	assert.Equal(t, 1, rowOfRounchMatchupTable.ID, "get rm_id failed")
	assert.Equal(t, 2019, rowOfRounchMatchupTable.Year, "get rm_year failed")
	assert.Equal(t, 1, rowOfRounchMatchupTable.Round, "get rm_round failed")
	assert.Equal(t, "jim", rowOfRounchMatchupTable.Coach1, "get rm_c_coach_id_1 failed")
	assert.Equal(t, "gab", rowOfRounchMatchupTable.Coach2, "get rm_c_coach_id_2 failed")
}

func TestRoundScore(t *testing.T) {
	dbmap := initDb()
	var rowOfRoundScoreTable roundScore
	err := dbmap.SelectOne(&rowOfRoundScoreTable, "select * from round_score where rs_id='1';")
	assert.NoError(t, err, "select from table round_score failed")
	assert.Equal(t, 1, rowOfRoundScoreTable.ID, "get rs_id failed")
	assert.Equal(t, 1, rowOfRoundScoreTable.Round, "get rs_round failed")
	assert.Equal(t, 2019, rowOfRoundScoreTable.Year, "get rs_year failed")
	assert.Equal(t, "jim", rowOfRoundScoreTable.Coach, "get rs_c_coach_id failed")
	assert.Equal(t, 64, rowOfRoundScoreTable.Score, "get rs_score failed")
	assert.Equal(t, 139, rowOfRoundScoreTable.Kicks, "get rs_kicks failed")
	assert.Equal(t, 78, rowOfRoundScoreTable.Handballs, "get rs_handballs failed")
	assert.Equal(t, 55, rowOfRoundScoreTable.Marks, "get rs_marks failed")
	assert.Equal(t, 16, rowOfRoundScoreTable.Hitouts, "get rs_hitouts failed")
	assert.Equal(t, 37, rowOfRoundScoreTable.Tackles, "get rs_tackles failed")
	assert.Equal(t, 0.673000, rowOfRoundScoreTable.DisposalEfficiency, "get rs_disposal_efficiency failed")
	assert.Equal(t, 79, rowOfRoundScoreTable.ContestedPosessions, "get rs_contested_posessions failed")
	assert.Equal(t, 36, rowOfRoundScoreTable.Rebounds, "get rs_rebound_50s failed")
	assert.Equal(t, 26, rowOfRoundScoreTable.Clearances, "get rs_clearances failed")
	assert.Equal(t, 43, rowOfRoundScoreTable.Spoils, "get rs_spoils failed")
}

func TestScoreSettings(t *testing.T) {
	dbmap := initDb()
	var rowOfScoreSettings scoreSettings
	err := dbmap.SelectOne(&rowOfScoreSettings, "select * from score_settings where ss_year=2019;")
	assert.NoError(t, err, "select from table score_settings failed")
	assert.Equal(t, 2019, rowOfScoreSettings.Year, "get ss_year failed")
	assert.Equal(t, 8, rowOfScoreSettings.Score, "get ss_score failed")
	assert.Equal(t, 6, rowOfScoreSettings.Kicks, "get ss_kicks failed")
	assert.Equal(t, 6, rowOfScoreSettings.Handballs, "get ss_handballs failed")
	assert.Equal(t, 4, rowOfScoreSettings.Marks, "get ss_marks failed")
	assert.Equal(t, 3, rowOfScoreSettings.Hitouts, "get ss_hitouts failed")
	assert.Equal(t, 4, rowOfScoreSettings.Tackles, "get ss_tackles failed")
	assert.Equal(t, 3, rowOfScoreSettings.DisposalEfficiency, "get ss_disposal_efficiency failed")
	assert.Equal(t, 2, rowOfScoreSettings.ContestedPosessions, "get ss_contested_posessions failed")
	assert.Equal(t, 1, rowOfScoreSettings.Rebounds, "get ss_rebound_50s failed")
	assert.Equal(t, 1, rowOfScoreSettings.Clearances, "get ss_clearances failed")
	assert.Equal(t, 3, rowOfScoreSettings.Spoils, "get ss_spoils failed")
}

func TestByeRound(t *testing.T) {
	dbmap := initDb()
	var rowOfByeRound byeRound
	err := dbmap.SelectOne(&rowOfByeRound, "select * from bye_round where br_year=2019 and br_round=13;")
	assert.NoError(t, err, "select from table bye_round failed")
	assert.Equal(t, 2019, rowOfByeRound.Year, "get br_year failed")
	assert.Equal(t, 13, rowOfByeRound.Round, "get br_round failed")
}
