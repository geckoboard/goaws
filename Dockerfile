FROM golang:1.15-alpine AS build-env

RUN apk add make bash git

WORKDIR /goaws 
ADD . .

RUN go build -o goaws app/cmd/goaws.go

FROM alpine:3.7
WORKDIR /app 

COPY --from=build-env /goaws/goaws /app/
CMD ["./goaws"]
