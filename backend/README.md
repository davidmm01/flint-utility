# TODO: this readme

### Start the backend:

`go build -o main .`

`./main`

runs on port 1323


### Run the backend tests

   `go test -v`


### Go Packages

flint-utility itself only contains main so far (consider creating a models or a database package if they grow complex)

Externals include gorp (db orm), echo (minimal framework), go-sql-driver/mysql, stretchr/testify (nice asserts/testing support)

Need dgrijalva/jwt-go for cors middleware
