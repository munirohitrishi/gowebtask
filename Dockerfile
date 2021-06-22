FROM golang:latest
RUN git clone https://github.com/munirohitrishi/gowebtask.git

WORKDIR gowebtask

CMD go run gowebfinal.go
EXPOSE 8080
