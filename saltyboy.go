package main

import (
	"fmt"

	"github.com/go-gorp/gorp"
)

type SaltyMeta struct {
	Year  int
	Round int
}

type SaltyCoach struct {
	Coach          string
	ActualOutcome  string
	ActualOpponent string
	PossibleWins   int
	PossibleLosses int
	PossibleDraws  int
	SaltyScores    SaltyScores
}

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

type SaltyOpponent struct {
	Opponent    string
	Outcome     string
	SaltyScores SaltyScores
}

type SaltyboyPayload struct {
	SaltyMeta      SaltyMeta
	SaltyCoach     SaltyCoach
	SaltyOpponents []SaltyOpponent
}

func getSaltyboyRound(db *gorp.DbMap, coach string, round int, year int) SaltyboyPayload {
	saltyMeta := SaltyMeta{
		Year:  year,
		Round: round,
	}
	saltyCoach := getSaltyCoach(db, coach, round, year)
	saltyOpponents := getSaltyOpponents(db, coach, round, year)

	return SaltyboyPayload{
		SaltyMeta:      saltyMeta,
		SaltyCoach:     saltyCoach,
		SaltyOpponents: saltyOpponents,
	}
}

func getSaltyScores(db *gorp.DbMap, coach string, round int, year int) SaltyScores {
	var roundScoreRow roundScore
	query := fmt.Sprintf("SELECT * FROM round_score WHERE rs_c_coach_id='%s' AND rs_round=%d AND rs_year=%d;", coach, round, year)
	db.SelectOne(&roundScoreRow, query)
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

func getSaltyOpponents(db *gorp.DbMap, coach string, round int, year int) []SaltyOpponent {
	var saltyOpponents []SaltyOpponent

	opponents := getOpponents(db, coach)
	for _, opponent := range opponents {
		opponentScores := getSaltyScores(db, opponent.ID, round, year)
		outcome := getMatchOutcome(db, coach, opponent.ID, round, year)
		saltyOpponent := SaltyOpponent{
			Opponent:    opponent.ID,
			Outcome:     outcome,
			SaltyScores: opponentScores,
		}
		saltyOpponents = append(saltyOpponents, saltyOpponent)
	}

	return saltyOpponents
}

func getSaltyCoach(db *gorp.DbMap, coach string, round int, year int) SaltyCoach {
	wins, losses, draws := getWLDTally(db, coach, round, year)
	opponent := getRoundOpponent(db, coach, round, year)
	return SaltyCoach{
		Coach:          coach,
		ActualOutcome:  getMatchOutcome(db, coach, opponent, round, year),
		ActualOpponent: opponent,
		PossibleWins:   wins,
		PossibleLosses: losses,
		PossibleDraws:  draws,
		SaltyScores:    getSaltyScores(db, coach, round, year),
	}
}
