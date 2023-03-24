
# Stage 1: Build the application
FROM golang:1.19-alpine AS build
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o /main

# Stage 2: Create a lightweight image with only the necessary files
FROM alpine:latest
COPY --from=build /main /main
RUN adduser -D ralf 
USER ralf
ENTRYPOINT [ "/main" ]
CMD [ "serve" ]