package main

import (
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {

	dbmap := initDb()
	e := echo.New()

	// CORS
	// Can probably introduce some security here, only allow the frontend to hit it
	e.Use(middleware.CORS())

	// health check
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello there mr frontend!")
	})

	// coach endpoints
	e.GET("/coaches", func(c echo.Context) error {
		// TODO: unit test for this endpoint
		coaches := getAllCoaches(dbmap)
		return c.JSON(http.StatusOK, coaches)
	})

	defer dbmap.Db.Close()
	e.Logger.Fatal(e.Start(":1323"))
}
