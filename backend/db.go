package main

import (
	"database/sql"
	"log"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/go-gorp/gorp"
)

// changing the name of the db user to "flintuser" in the Dockerfile, will need to adjust below!
// but lets not change anything just yet ;)s
func initDb() *gorp.DbMap {
	db, err := sql.Open("mysql", "root:123@tcp(db:3306)/FLINT")
	checkErr(err, "sql.Open failed")

	// construct a gorp DbMap
	dbmap := &gorp.DbMap{Db: db, Dialect: gorp.SqliteDialect{}}

	return dbmap
}

func checkErr(err error, msg string) {
	if err != nil {
		fmt.Println(err)
		log.Fatalln(msg, err)
	}
}
