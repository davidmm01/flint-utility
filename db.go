package main

import (
	"database/sql"
	"log"

	"github.com/go-gorp/gorp"
)

func initDb() *gorp.DbMap {
	db, err := sql.Open("mysql", "devbox:123@/FLINT")
	// in order for the above to work, had to link my user 'devbox' to the password '123', follow instructions here:
	// https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost

	checkErr(err, "sql.Open failed")

	// construct a gorp DbMap
	dbmap := &gorp.DbMap{Db: db, Dialect: gorp.SqliteDialect{}}

	return dbmap
}

func checkErr(err error, msg string) {
	if err != nil {
		log.Fatalln(msg, err)
	}
}
