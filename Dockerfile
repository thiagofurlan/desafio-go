FROM golang:1.16-alpine as builder

WORKDIR /app 

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags netgo -ldflags '-s -w' -o desafio-go

FROM scratch

COPY --from=builder /app/desafio-go /app/desafio-go

ENTRYPOINT ["/app/desafio-go"]