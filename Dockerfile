FROM golang:1.20-alpine

# Install git (required for go modules that use GitHub or others)
RUN apk add --no-cache git

# Create working directory
WORKDIR /app

# Copy go.mod and go.sum first (for layer caching)
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the application
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port (change if needed)
EXPOSE 8080

# Run the binary
CMD ["./main"]
