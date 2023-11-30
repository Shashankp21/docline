FROM alpine:latest

# Set the working directory in the image
WORKDIR /app

# Copy the files from the host file system to the image file system
COPY . /app

# Install the necessary packages
RUN apk update && apk add --no-cache openjdk17

# Set environment variables
ENV NAME World

RUN javac app.java

# Run a command to start the application
CMD ["java", "app"]
