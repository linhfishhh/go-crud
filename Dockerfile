FROM golang:1.18.2-alpine
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]