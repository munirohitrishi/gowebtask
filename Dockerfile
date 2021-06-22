FROM bitnami/golang:latest as builder
COPY gotime.go /
RUN go build /gotime.go

FROM bitnami/minideb:stretch
RUN mkdir -p /test
WORKDIR /test
COPY --from=builder /go/gotime.go .
COPY time.html .
RUN useradd -r -u 1001 -g root nonroot
RUN chown -R nonroot /test
USER nonroot
ENV PORT=8080
EXPOSE 8080
CMD /test/gotime

