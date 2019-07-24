package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetWLDTally(t *testing.T) {
	// TODO: fix this test, its based off caluclations that had bugs in them!
	// TODO: choose a diff round, maybe one where we know there is atleast a draw
	dbmap := initDb()
	expectedWins, expectedLosses, expectedDraws := 5, 10, 2
	wins, losses, draws := getWLDTally(dbmap, "schlong", 8, 2019)
	assert.Equal(t, expectedWins, wins, "getWLDTally number of wins wrong")
	assert.Equal(t, expectedLosses, losses, "getWLDTally number of losses wrong")
	assert.Equal(t, expectedDraws, draws, "getWLDTally number of draws wrong")
}

func TestGetMatchOutcome(t *testing.T) {
	// r1 2019, kev beats dave, milbs looses to shust
	// r8 2019, schlong v gab draw
	dbmap := initDb()
	winOutcome := getMatchOutcome(dbmap, "kev", "davo", 1, 2019)
	lossOutcome := getMatchOutcome(dbmap, "milbs", "shust", 1, 2019)
	drawOutcome := getMatchOutcome(dbmap, "staff", "gab", 8, 2019)
	assert.Equal(t, winOutcome, "WIN", "getMatchOutcome didn't return the expected WIN")
	assert.Equal(t, lossOutcome, "LOSS", "getMatchOutcome didn't return the expected LOSS")
	assert.Equal(t, drawOutcome, "DRAW", "getMatchOutcome didn't return the expected DRAW")
}

func TestCalculateScoreTallies(t *testing.T) {
	dbmap := initDb()
	scoreSettings := getScoreSettings(dbmap, 2019)

	// actual round 8 2019 results

	// karl 28 vs 12 shust
	karlScore, shustScore := calculateScoreTallies(
		getSaltyScores(dbmap, "karl", 8, 2019), getSaltyScores(dbmap, "shust", 8, 2019), scoreSettings)
	assert.Equal(t, 28, karlScore, "karl's score should be 28")
	assert.Equal(t, 12, shustScore, "shust's score should be 12")

	// milbs 22 19 fewy
	milbsScore, fewyScore := calculateScoreTallies(
		getSaltyScores(dbmap, "milbs", 8, 2019), getSaltyScores(dbmap, "fewy", 8, 2019), scoreSettings)
	assert.Equal(t, 22, milbsScore, "milbs's score should be 22")
	assert.Equal(t, 19, fewyScore, "fewy's score should be 19")

	// schlong 17  24 salc
	schlongScore, salcScore := calculateScoreTallies(
		getSaltyScores(dbmap, "schlong", 8, 2019), getSaltyScores(dbmap, "salc", 8, 2019), scoreSettings)
	assert.Equal(t, 17, schlongScore, "schlong's score should be 17")
	assert.Equal(t, 24, salcScore, "salc's score should be 24")

	// frank 28 vs 13 cost
	frankScore, costScore := calculateScoreTallies(
		getSaltyScores(dbmap, "frank", 8, 2019), getSaltyScores(dbmap, "cost", 8, 2019), scoreSettings)
	assert.Equal(t, 28, frankScore, "frank's score should be 28")
	assert.Equal(t, 13, costScore, "cost's score should be 13")

	// doe 30 vs 11 sam
	doeScore, samScore := calculateScoreTallies(
		getSaltyScores(dbmap, "doe", 8, 2019), getSaltyScores(dbmap, "sam", 8, 2019), scoreSettings)
	assert.Equal(t, 30, doeScore, "doe's score should be 30")
	assert.Equal(t, 11, samScore, "sam's score should be 11")

	// jim 24 vs 13 calv
	// TODO: fix the data so this test passes, ult footy actually has jim winning disposal efficiency
	// (not a draw) as it appears
	// TODO: go through all round data so far and make sure there aren't any other occurances of drawn
	// disposal efficiency
	jimScore, calvScore := calculateScoreTallies(
		getSaltyScores(dbmap, "jim", 8, 2019), getSaltyScores(dbmap, "calv", 8, 2019), scoreSettings)
	assert.Equal(t, 24, jimScore, "jim's score should be 24")
	assert.Equal(t, 13, calvScore, "calv's score should be 13")

	// staff 19 vs 19 gab
	staffScore, gabScore := calculateScoreTallies(
		getSaltyScores(dbmap, "staff", 8, 2019), getSaltyScores(dbmap, "gab", 8, 2019), scoreSettings)
	assert.Equal(t, 19, staffScore, "staff's score should be 19")
	assert.Equal(t, 19, gabScore, "gab's score should be 19")

	// kev 21 vs 20 bark
	kevScore, barkScore := calculateScoreTallies(
		getSaltyScores(dbmap, "kev", 8, 2019), getSaltyScores(dbmap, "bark", 8, 2019), scoreSettings)
	assert.Equal(t, 21, kevScore, "kev's score should be 21")
	assert.Equal(t, 20, barkScore, "bark's score should be 20")

	// davo 11 vs 30 steve
	davoScore, steveScore := calculateScoreTallies(
		getSaltyScores(dbmap, "davo", 8, 2019), getSaltyScores(dbmap, "steve", 8, 2019), scoreSettings)
	assert.Equal(t, 11, davoScore, "davo's score should be 11")
	assert.Equal(t, 30, steveScore, "steve's score should be 30")
}

func TestGetWinLossDrawStatus(t *testing.T) {
	assert.Equal(t, WIN, getWinLossDrawStatus(1, 0), "didn't evaluate score tallies to WIN")
	assert.Equal(t, LOSS, getWinLossDrawStatus(0, 1), "didn't evaluate score tallies to LOSS")
	assert.Equal(t, DRAW, getWinLossDrawStatus(1, 1), "didn't evaluate score tallies to DRAW")
}
