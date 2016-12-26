FROM alpine:3.4
MAINTAINER abazaglia@gmail.com
RUN \
  apk --update add openjdk8-jre curl && \
  curl -o /tmp/dynamo.tar.gz -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest && \
  tar xvzf /tmp/dynamo.tar.gz && \
  rm -rf third_party_licenses LICENSE.txt && \
  apk --purge del curl

EXPOSE 8000
CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "./DynamoDBLocal.jar", "-port", "8000"]
