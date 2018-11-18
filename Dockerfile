#
# Build AdguardHome for raspberry pi 2/3
#
FROM arm32v7/debian:8-slim as build
LABEL maintainer='Paulo Costa <coostax@gmail.com>'

ARG ADGUARD_VERSION=v0.9-hotfix1

RUN apt-get update && apt-get install -y wget tar \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://github.com/AdguardTeam/AdGuardHome/releases/download/${ADGUARD_VERSION}/AdGuardHome_${ADGUARD_VERSION}_linux_arm.tar.gz \
  && tar -xf AdGuardHome_${ADGUARD_VERSION}_linux_arm.tar.gz

FROM arm32v7/debian:8-slim
LABEL maintainer='Paulo Costa <coostax@gmail.com>'

ARG WEBPORT=3000

RUN apt-get update && apt-get install -y ca-certificates \
  && rm -rf /var/lib/apt/lists/*

COPY --from=build /AdGuardHome /AdGuardHome

EXPOSE ${WEBPORT}
EXPOSE 53

WORKDIR /AdGuardHome
COPY config/AdGuardHome.yaml .
CMD ["/AdGuardHome/AdGuardHome"]
