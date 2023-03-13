FROM golang:1.18.2-alpine
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go get -v -u

COPY *.go ./

RUN go build -o /docker-gs-ping

EXPOSE 8080

CMD [ "/docker-gs-ping" ]