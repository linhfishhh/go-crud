FROM golang:1.18.2-alpine
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN  go build -a -installsuffix cgo -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]