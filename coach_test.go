package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func coachSetup() (coach, coach, coach) {
	coach1 := coach{ID: "davo", TeamName: "flamingos", FirstName: "David", Year: 2019}
	coach2 := coach{ID: "jim", TeamName: "Stand By Crouch", FirstName: "jermes", Year: 2019}
	coach3 := coach{ID: "bark", TeamName: "PASSWORD IS BAYSIDE", FirstName: "Marcus", Year: 2019}
	return coach1, coach2, coach3
}

func TestGetAllCoaches(t *testing.T) {
	dbmap := initDb()
	_, _, coach := coachSetup()
	allCoaches := getAllCoaches(dbmap)
	assert.Equal(t, 18, len(allCoaches), "getAllCoaches didn't return 18 coaches")
	// TODO: find a way of doing Contains instead of Equal with array access, since its not robust
	// using assert.Contains() doesn't seem to work for structs, only basic types???
	assert.Equal(t, coach, allCoaches[0], "getAllCoaches didn't return coach "+coach.ID)
}

func TestGetOpponents(t *testing.T) {
	dbmap := initDb()
	coach, opponent1, opponent2 := coachSetup()
	opponents := getOpponents(dbmap, coach.ID)
	assert.Equal(t, 17, len(opponents), "getOpponents didn't return 17 coaches")
	assert.Equal(t, opponent2, opponents[0], "getAllCoaches didn't return coach "+opponent2.ID)
	assert.Equal(t, opponent1, opponents[7], "getAllCoaches didn't return coach "+opponent1.ID)
}

func TestGetOpponentsIDs(t *testing.T) {
	dbmap := initDb()
	coach, opponent1, opponent2 := coachSetup()
	opponents := getOpponentsIDs(dbmap, coach.ID)
	assert.NotContains(t, opponents, coach.ID, "getOpponentsIDs returned the target coach "+coach.ID)
	assert.Contains(t, opponents, opponent1.ID, "getOpponentsIDs didn't return "+opponent1.ID)
	assert.Contains(t, opponents, opponent2.ID, "getOpponentsIDs didn't return "+opponent2.ID)
}

func TestGetRoundOpponentId(t *testing.T) {
	dbmap := initDb()
	coach, expectedOpponent, _ := coachSetup() // davo and jim played round 2 2019
	actualOpponentID := getRoundOpponentID(dbmap, coach.ID, 2, 2019)
	assert.Equal(t, expectedOpponent.ID, actualOpponentID, "getRoundOpponentId failed")
}
