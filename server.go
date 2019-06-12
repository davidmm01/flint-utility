package main

import (
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

// TODO: need to learn about packages and break main up a bit, a lot of files already

func main() {
	dbmap := initDb()
	e := echo.New()

	// CORS Middleware
	// TODO: Can probably introduce some security here, only allow the frontend to hit it
	e.Use(middleware.CORS())

	// health check
	e.GET("/", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		return c.String(http.StatusOK, "Hello there mr frontend!")
	})

	// season endpoints
	e.GET("/seasons/current", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		return c.JSON(http.StatusOK, getCurrentSeason())
	})

	// coach endpoints
	e.GET("/coaches", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		coaches := getAllCoaches(dbmap)
		return c.JSON(http.StatusOK, coaches)
	})

	// saltyboy endpoints
	e.GET("/saltyboy/:coach", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		coach := c.Param("coach")
		opponents := getOpponents(dbmap, coach)
		year := getCurrentSeason()
		totalRounds := int(getTotalRounds(dbmap, year))
		for currentRound := 1; currentRound <= totalRounds; currentRound++ {
			for _, opponent := range opponents {
				// now we gotta get all the scores etc so far in a big blob
				// and let the frontend display it nice for the saltyboy feature.
				// is this getting too detailed?  should this be lots of little endpoints?
				// sleep on it...
				println(opponent.ID)
			}
		}

		return c.JSON(http.StatusOK, opponents)
	})

	defer dbmap.Db.Close()
	e.Logger.Fatal(e.Start(":1323"))
}
