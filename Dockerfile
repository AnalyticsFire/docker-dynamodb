FROM openjdk:8

RUN mkdir /dynamodb
WORKDIR /dynamodb

RUN wget -O /dynamodb/dynamodb.tgz http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar xfz /dynamodb/dynamodb.tgz && \
    rm -f /dynamodb/dynamodb.tgz

CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-inMemory"]
