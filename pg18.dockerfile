FROM docker.io/postgres:18-trixie

LABEL org.opencontainers.image.title="HugeBot PostgreSQL 18" \
      org.opencontainers.image.description="PostgreSQL 18 with pg_cron and pg_lexo extensions" \
      org.opencontainers.image.source="https://github.com/HugeBot/postgres" \
      org.opencontainers.image.version="18" \
      org.opencontainers.image.vendor="HugeBot" \
      org.opencontainers.image.licenses="MIT"

ENV LEXO_URL=https://raw.githubusercontent.com/Blad3Mak3r/pg_lexo/main/install.sh

RUN apt-get update && \
    apt-get install -y curl postgresql-18-cron && \
    curl -sSL $LEXO_URL | sh -s 18 && \
    apt-get purge -y curl

RUN apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
