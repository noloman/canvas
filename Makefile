.PHONY: build run cover start test test-integration

run:
	docker run -p 8081:8080 -e HOST="" canvas
	
build:
	docker build -t canvas .

cover:
	go tool cover -html=cover.out

start:
	go run cmd/server/*.go

test:
	go test -coverprofile=cover.out -short ./...

test-integration:
	go test -coverprofile=cover.out -p 1 ./...
