FROM docker.io/postgres:18-trixie

LABEL org.opencontainers.image.title="HugeBot PostgreSQL 18" \
      org.opencontainers.image.description="PostgreSQL 18 with pg_cron, pg_lexo and pgvector extensions" \
      org.opencontainers.image.source="https://github.com/HugeBot/postgres" \
      org.opencontainers.image.version="18" \
      org.opencontainers.image.vendor="HugeBot" \
      org.opencontainers.image.licenses="MIT"

ENV PGVECTOR_VERSION=v0.8.2
ENV PG_LEXO_VERSION=v0.6.1

RUN apt-get update && \
    apt-get install -y curl git build-essential postgresql-server-dev-18 postgresql-18-cron && \
    curl -sSLf -o /tmp/pg_lexo.deb "https://github.com/Blad3Mak3r/pg_lexo/releases/download/${PG_LEXO_VERSION}/pg_lexo-${PG_LEXO_VERSION#v}-pg18-linux-amd64.deb" && \
    apt-get install -y /tmp/pg_lexo.deb && \
    rm /tmp/pg_lexo.deb && \
    git clone --branch $PGVECTOR_VERSION --depth 1 https://github.com/pgvector/pgvector.git /tmp/pgvector && \
    cd /tmp/pgvector && \
    make OPTFLAGS="" && \
    make install && \
    cd / && rm -rf /tmp/pgvector && \
    apt-get purge -y curl git build-essential postgresql-server-dev-18

RUN apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
