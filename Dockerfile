FROM golang:1.19-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN go mod download && go mod verify

RUN go build -v -o /usr/local/bin/app ./

CMD ["app"]

FROM hello-world

COPY --from=builder /usr/local/bin/app /usr/local/bin/app

CMD ["app"]