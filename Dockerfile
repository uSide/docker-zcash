FROM debian:stretch

RUN apt-get update && apt-get install -y apt-transport-https wget gnupg2
RUN wget -qO - https://apt.z.cash/zcash.asc | apt-key add -
RUN echo "deb [arch=amd64] https://apt.z.cash/ jessie main" | tee /etc/apt/sources.list.d/zcash.list
RUN apt-get update && apt-get install -y zcash
RUN mkdir /zcash && touch /zcash/zcash.conf
RUN zcash-fetch-params

ENTRYPOINT ["/usr/bin/zcashd"]
