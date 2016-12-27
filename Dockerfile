FROM openjdk:7
MAINTAINER Andre Bazaglia <abazaglia@gmail.com>

# Create our main application folder.
RUN mkdir -p opt/dynamodb
WORKDIR /opt/dynamodb

# Download and unpack dynamodb.
RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz -q -O - | tar -xz
  
# The entrypoint is the dynamodb jar. Default port is 8000.
EXPOSE 8000
ENTRYPOINT ["java", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-inMemory", "true"]
