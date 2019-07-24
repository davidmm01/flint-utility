package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetTotalRounds(t *testing.T) {
	// TODO: create some proper test data so that this test isn't so fragile... or wait till end of the year lol
	dbmap := initDb()
	assert.Equal(t, 10, getTotalRounds(dbmap, 2019))
}
