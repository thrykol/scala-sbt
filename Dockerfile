FROM openjdk:jdk-alpine
MAINTAINER Shane Perry <thrykol@gmail.com>

RUN apk --update add bash openssl curl tar gzip docker
RUN rm -rf /var/cache/apk/*

RUN curl -sL "http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz" | tar -xz -C /usr/local
RUN curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/0.13.13/sbt-0.13.13.tgz" | tar -xz -C /usr/local

EXPOSE 9000

RUN ln -s /usr/local/sbt-launcher-packaging-0.13.13/bin/sbt /usr/bin/sbt
RUN ln -s /usr/local/scala-2.11.8/bin/scala /usr/bin/scala

RUN sbt about

CMD ["sbt"]
