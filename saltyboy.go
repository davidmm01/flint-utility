package main

import (
	"fmt"
)

// SaltyMeta contains metadata of the round, returned by saltyboy round endpoint
type SaltyMeta struct {
	Year  int
	Round int
}

// SaltyCoach contains data on the coach that is being queried by saltyboy endpoint
type SaltyCoach struct {
	Coach          string
	ActualOutcome  string
	ActualOpponent string
	PossibleWins   int
	PossibleLosses int
	PossibleDraws  int
	SaltyScores    SaltyScores
}

// SaltyScores are an exported version of the roundScore model, with only required fields
type SaltyScores struct {
	Score               int
	Kicks               int
	Handballs           int
	Marks               int
	Hitouts             int
	Tackles             int
	DisposalEfficiency  float64
	ContestedPosessions int
	Rebounds            int
	Clearances          int
	Spoils              int
}

// SaltyOpponent represents an opponent of the salty coach, returned by saltyboy endpoint
type SaltyOpponent struct {
	Opponent    string
	Outcome     string
	SaltyScores SaltyScores
}

// SaltyboyPayload is the top level of the structure returned by saltyboy round endpoint
type SaltyboyPayload struct {
	SaltyMeta      SaltyMeta
	SaltyCoach     SaltyCoach
	SaltyOpponents []SaltyOpponent
}

func getSaltyboyRound(coach string, round int, year int) SaltyboyPayload {
	saltyMeta := SaltyMeta{
		Year:  year,
		Round: round,
	}
	saltyCoach := getSaltyCoach(coach, round, year)
	saltyOpponents := getSaltyOpponents(coach, round, year)

	return SaltyboyPayload{
		SaltyMeta:      saltyMeta,
		SaltyCoach:     saltyCoach,
		SaltyOpponents: saltyOpponents,
	}
}

func getSaltyScores(coach string, round int, year int) SaltyScores {
	var roundScoreRow roundScore

	db := initDb()
	query := fmt.Sprintf("SELECT * FROM round_score WHERE rs_c_coach_id='%s' AND rs_round=%d AND rs_year=%d;", coach, round, year)
	db.SelectOne(&roundScoreRow, query)
	defer db.Db.Close()

	scores := SaltyScores{
		Score:               roundScoreRow.Score,
		Kicks:               roundScoreRow.Kicks,
		Handballs:           roundScoreRow.Handballs,
		Marks:               roundScoreRow.Marks,
		Hitouts:             roundScoreRow.Hitouts,
		Tackles:             roundScoreRow.Tackles,
		DisposalEfficiency:  roundScoreRow.DisposalEfficiency,
		ContestedPosessions: roundScoreRow.ContestedPosessions,
		Rebounds:            roundScoreRow.Rebounds,
		Clearances:          roundScoreRow.Clearances,
		Spoils:              roundScoreRow.Spoils,
	}
	return scores
}

func getSaltyOpponents(coach string, round int, year int) []SaltyOpponent {
	var saltyOpponents []SaltyOpponent

	opponents := getOpponents(coach, year)
	for _, opponent := range opponents {
		opponentScores := getSaltyScores(opponent.ID, round, year)
		outcome, _, _ := getMatchOutcome(coach, opponent.ID, round, year)
		saltyOpponent := SaltyOpponent{
			Opponent:    opponent.ID,
			Outcome:     outcome,
			SaltyScores: opponentScores,
		}
		saltyOpponents = append(saltyOpponents, saltyOpponent)
	}

	return saltyOpponents
}

func getSaltyCoach(coach string, round int, year int) SaltyCoach {
	wins, losses, draws := getWLDTally(coach, round, year)
	opponent := getRoundOpponentID(coach, round, year)
	outcome, _, _ := getMatchOutcome(coach, opponent, round, year)
	return SaltyCoach{
		Coach:          coach,
		ActualOutcome:  outcome,
		ActualOpponent: opponent,
		PossibleWins:   wins,
		PossibleLosses: losses,
		PossibleDraws:  draws,
		SaltyScores:    getSaltyScores(coach, round, year),
	}
}
