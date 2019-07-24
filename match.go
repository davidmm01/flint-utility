package main

import (
	"github.com/go-gorp/gorp"
)

// WIN constant representing a won match
const WIN = "WIN"

// LOSS constant representing a lost match
const LOSS = "LOSS"

// DRAW constant representing a drawn match
const DRAW = "DRAW"

func getWLDTally(db *gorp.DbMap, coach string, round int, year int) (int, int, int) {
	wins, losses, draws := 0, 0, 0
	opponents := getOpponents(db, coach)
	for _, opponent := range opponents {
		outcome := getMatchOutcome(db, coach, opponent.ID, round, year)
		if outcome == WIN {
			wins++
		} else if outcome == LOSS {
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
	coachTally, opponentTally := calculateScoreTallies(coachScores, opponentScores, scoreSettings)
	return getWinLossDrawStatus(coachTally, opponentTally)
}

func calculateScoreTallies(coachScores SaltyScores, opponentScores SaltyScores, scoreSettings scoreSettings) (int, int) {
	coachScoreTally := 0
	opponentScoreTally := 0

	if coachScores.Score > opponentScores.Score {
		coachScoreTally += scoreSettings.Score
	} else if coachScores.Score < opponentScores.Score {
		opponentScoreTally += scoreSettings.Score
	}

	if coachScores.Kicks > opponentScores.Kicks {
		coachScoreTally += scoreSettings.Kicks
	} else if coachScores.Kicks < opponentScores.Kicks {
		opponentScoreTally += scoreSettings.Kicks
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

	return coachScoreTally, opponentScoreTally
}

func getWinLossDrawStatus(coachScoreTally int, opponentScoreTally int) string {
	if coachScoreTally > opponentScoreTally {
		return WIN
	} else if coachScoreTally < opponentScoreTally {
		return LOSS
	} else {
		return DRAW
	}
}
