ARG base_image=golang:alpine
ARG alpine_image=alpine:edge
FROM ${base_image} as builder
COPY . /go/src/github.com/steve-sienk/gcs-resource
ENV CGO_ENABLED 0
ENV GO111MODULE off
RUN go build -o /assets/in github.com/steve-sienk/gcs-resource/cmd/in
RUN go build -o /assets/out github.com/steve-sienk/gcs-resource/cmd/out
RUN go build -o /assets/check github.com/steve-sienk/gcs-resource/cmd/check

FROM ${alpine_image} AS resource
RUN apk add --no-cache bash tzdata ca-certificates unzip zip gzip tar
COPY --from=builder assets/ /opt/resource/
RUN chmod +x /opt/resource/*

FROM resource
