FROM golang:alpine as builder

RUN apk update && apk upgrade && apk add git

RUN mkdir /build
ADD . /build/
WORKDIR /build

RUN go get -v github.com/go-gorp/gorp github.com/go-sql-driver/mysql github.com/labstack/echo github.com/dgrijalva/jwt-go

RUN go build -o main .

FROM alpine
COPY --from=builder /build/main/ app/
WORKDIR /app
CMD ["./main"]
