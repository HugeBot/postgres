# Huge PostgreSQL 18

Imagen Docker de PostgreSQL 18 personalizada para el bot HUGE en producción.

## Descripción

Esta imagen Docker está diseñada específicamente para su uso en producción con [HUGE Bot](https://huge.bot). Contiene PostgreSQL 18 con extensiones adicionales necesarias para el funcionamiento del bot.

## Contenido de la Imagen

- **Base**: PostgreSQL 18 (basado en Debian Trixie)
- **Extensiones incluidas**:
  - `pg_cron`: Programador de tareas cron nativo de PostgreSQL
  - `pg_lexo`: Extensión personalizada para ordenamiento lexicográfico

## Uso en Producción

Esta imagen está configurada y optimizada para el entorno de producción de HUGE Bot. Se utiliza como la base de datos principal del sistema.

### Pull de la Imagen

```bash
docker pull ghcr.io/hugebot/postgres:18
```

### Ejecución

```bash
docker run -d \
  --name hugebot-postgres \
  -e POSTGRES_PASSWORD=<CAMBIA_ESTO_POR_UNA_CONTRASEÑA_SEGURA> \
  -e POSTGRES_DB=hugebot \
  -v postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  ghcr.io/hugebot/postgres:18
```

> **⚠️ IMPORTANTE**: Reemplaza `<CAMBIA_ESTO_POR_UNA_CONTRASEÑA_SEGURA>` con una contraseña segura antes de usar en producción.

## Construcción

Para construir la imagen localmente:

```bash
docker build -f pg18.dockerfile -t hugebot/postgres:18 .
```

## Más Información

- [HUGE Bot](https://huge.bot)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/18/)
- [pg_cron Extension](https://github.com/citusdata/pg_cron)
- [pg_lexo Extension](https://github.com/Blad3Mak3r/pg_lexo)
