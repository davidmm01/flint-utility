package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetTotalRounds(t *testing.T) {
	// TODO: create some proper test data so that this test isn't so fragile... or wait till end of the year lol
	assert.Equal(t, 18, getTotalRounds(2019))
}
