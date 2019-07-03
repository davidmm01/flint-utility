package main

import (
	"github.com/go-gorp/gorp"
)

func getWLDTally(db *gorp.DbMap, coach string, round int, year int) (int, int, int) {
	wins, losses, draws := 0, 0, 0
	opponents := getOpponents(db, coach)
	for _, opponent := range opponents {
		outcome := getMatchOutcome(db, coach, opponent.ID, round, year)
		if outcome == "WIN" {
			wins++
		} else if outcome == "LOSS" {
			losses++
		} else {
			draws++
		}
	}
	return wins, losses, draws
}

func getMatchOutcome(db *gorp.DbMap, coach string, opponent string, round int, year int) string {
	coachScores := getSaltyScores(db, coach, round, year)
	opponentScores := getSaltyScores(db, opponent, round, year)
	scoreSettings := getScoreSettings(db, year)
	return calculateOutcome(coachScores, opponentScores, scoreSettings)
}

func calculateOutcome(coachScores SaltyScores, opponentScores SaltyScores, scoreSettings scoreSettings) string {
	coachScoreTally := 0
	opponentScoreTally := 0

	if coachScores.Kicks > opponentScores.Kicks {
		coachScoreTally += scoreSettings.Score
	} else if coachScores.Kicks < opponentScores.Kicks {
		opponentScoreTally += scoreSettings.Score
	}

	if coachScores.Handballs > opponentScores.Handballs {
		coachScoreTally += scoreSettings.Handballs
	} else if coachScores.Handballs < opponentScores.Handballs {
		opponentScoreTally += scoreSettings.Handballs
	}

	if coachScores.Marks > opponentScores.Marks {
		coachScoreTally += scoreSettings.Marks
	} else if coachScores.Marks < opponentScores.Marks {
		opponentScoreTally += scoreSettings.Marks
	}

	if coachScores.Hitouts > opponentScores.Hitouts {
		coachScoreTally += scoreSettings.Hitouts
	} else if coachScores.Hitouts < opponentScores.Hitouts {
		opponentScoreTally += scoreSettings.Hitouts
	}

	if coachScores.Tackles > opponentScores.Tackles {
		coachScoreTally += scoreSettings.Tackles
	} else if coachScores.Tackles < opponentScores.Tackles {
		opponentScoreTally += scoreSettings.Tackles
	}

	if coachScores.DisposalEfficiency > opponentScores.DisposalEfficiency {
		coachScoreTally += scoreSettings.DisposalEfficiency
	} else if coachScores.DisposalEfficiency < opponentScores.DisposalEfficiency {
		opponentScoreTally += scoreSettings.DisposalEfficiency
	}

	if coachScores.ContestedPosessions > opponentScores.ContestedPosessions {
		coachScoreTally += scoreSettings.ContestedPosessions
	} else if coachScores.ContestedPosessions < opponentScores.ContestedPosessions {
		opponentScoreTally += scoreSettings.ContestedPosessions
	}

	if coachScores.Rebounds > opponentScores.Rebounds {
		coachScoreTally += scoreSettings.Rebounds
	} else if coachScores.Rebounds < opponentScores.Rebounds {
		opponentScoreTally += scoreSettings.Rebounds
	}

	if coachScores.Clearances > opponentScores.Clearances {
		coachScoreTally += scoreSettings.Clearances
	} else if coachScores.Clearances < opponentScores.Clearances {
		opponentScoreTally += scoreSettings.Clearances
	}

	if coachScores.Spoils > opponentScores.Spoils {
		coachScoreTally += scoreSettings.Spoils
	} else if coachScores.Spoils < opponentScores.Spoils {
		opponentScoreTally += scoreSettings.Spoils
	}

	// TODO: these return values should be refactored to a table or at least some global constant
	if coachScoreTally > opponentScoreTally {
		return "WIN"
	} else if coachScoreTally < opponentScoreTally {
		return "LOSS"
	} else {
		return "DRAW"
	}

}
