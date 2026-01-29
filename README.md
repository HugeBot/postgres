# HUGE PostgreSQL 18

Custom PostgreSQL 18 Docker image for HUGE production environments.

## Description

This Docker image is specifically designed for production use with [HUGE](https://huge.bot). It contains PostgreSQL 18 with additional extensions required for the bot's operation.

## Image Contents

- **Base**: PostgreSQL 18 (based on Debian Trixie)
- **Included Extensions**:
  - `pg_cron`: Native PostgreSQL cron job scheduler
  - `pg_lexo`: Custom extension for lexicographic ordering

## Production Usage

This image is configured and optimized for HUGE's production environment. It serves as the main database system.

### Pull the Image

```bash
docker pull ghcr.io/hugebot/postgres:18
```

### Running

```bash
docker run -d \
  --name hugebot-postgres \
  -e POSTGRES_PASSWORD=<CHANGE_THIS_TO_A_SECURE_PASSWORD> \
  -e POSTGRES_DB=hugebot \
  -v postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  ghcr.io/hugebot/postgres:18
```

> **⚠️ IMPORTANT**: Replace `<CHANGE_THIS_TO_A_SECURE_PASSWORD>` with a secure password before using in production.

## Building

To build the image locally:

```bash
docker build -f pg18.dockerfile -t hugebot/postgres:18 .
```

## More Information

- [HUGE](https://huge.bot)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/18/)
- [pg_cron Extension](https://github.com/citusdata/pg_cron)
- [pg_lexo Extension](https://github.com/Blad3Mak3r/pg_lexo)
