# Start from the official lightweight Go image
FROM golang:1.20-alpine

# Install git (needed for go get in some projects)
RUN apk add --no-cache git

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files (optional if using modules)
# COPY go.mod go.sum ./

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["./main"]
