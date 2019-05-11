# Welcome to flint-utility

A web app for generating and collating statistics and insights to the flint ult footy fantasy league.
This is a hacktastic project, made with go and react by someone who has never used either of them.  Its just as much about learning these techs as it is about making something awesome!


### Start the backend:

   go run *.go

running on port 1323


### Start the frontend:

   cd frontend
   npm start

running on port 3000


### Run the tests

   go test


### Stack

Backend: echo (minimalist microservice framework for golang)
Frontend: react (javascript library/framework)
Database: mysql


### Go Packages

flint-utility itself only contains main so far (consider creating a models or a database package if they grow complex)
Externals include gorp (db orm), echo (minimal framework), go-sql-driver/mysql, stretchr/testify (nice asserts/testing support)


### Code Layout

Directory sql contains history of the data pushed in
