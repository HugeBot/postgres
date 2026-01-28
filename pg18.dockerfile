FROM docker.io/postgres:18-trixie

ENV LEXO_URL=https://raw.githubusercontent.com/Blad3Mak3r/pg_lexo/main/install.sh

RUN apt-get update && \
    apt-get install -y curl postgresql-18-cron && \
    curl -sSL $LEXO_URL | sh -s 18 && \
    apt-get purge -y curl

RUN apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
