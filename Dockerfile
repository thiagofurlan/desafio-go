FROM golang:1.16-alpine as builder

WORKDIR /go/src/app 

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /go/src/app

COPY --from=builder /go/src/app .

ENTRYPOINT ["./main"]