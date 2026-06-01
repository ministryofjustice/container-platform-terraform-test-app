FROM golang:1.26@sha256:91eda9776261207ea25fd06b5b7fed8d397dd2c0a283e77f2ab6e91bfa71079d

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./
COPY index.html.tmpl ./

RUN CGO_ENABLED=0 go build -o /hello

USER 1001:1001

CMD ["/hello"]
