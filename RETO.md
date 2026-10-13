# 🚀 Sideproject — Pipeline diario del banco

**Repositorio:** `sideproject-pipeline-banco` · **Tipo:** ETL orquestado · **Tiempo:** 8–10 h · **Después de:** lecciones 1 a 3 de esta sección

> Reglas, README y lista de cierre: [`SIDEPROJECTS.md`](docs/REGLAS.md). **No hay solución: el diseño es tuyo.**

## El caso

El reporte de compras en dólares se ha vuelto diario. Ya no vale ejecutarlo a mano: hace falta un pipeline que extraiga, limpie, cargue en PostgreSQL y se programe solo. Y que se pueda relanzar sin miedo.

## Qué practicas

| Lección | Dónde aparece |
|---|---|
| ETL y ELT | La decisión de dónde transformar |
| Carga y monitoreo | Idempotencia, validación antes de cargar, logging |
| Airflow | El DAG diario y el backfill |

## Hitos

**Hito 1 — Diseño.** Antes de escribir código: un diagrama con fuentes, capas (raw, limpia, analítica), tablas y tareas.
*Comprueba:* alguien que no conoce el proyecto lo entiende con el diagrama.

**Hito 2 — Un día, a mano.** `python -m pipeline --fecha 2026-08-15` extrae, limpia y carga dos tablas en el esquema `analitica`:
`gasto_diario_categoria` (fecha, categoría, nº de compras, total MXN, total USD) y `resumen_cliente` (cliente, segmento, nº de cuentas, total gastado, ticket promedio, última compra).
*Comprueba:* las dos tablas cuadran con una consulta SQL escrita por ti.

**Hito 3 — Relanzable.** La carga es idempotente (borrar e insertar, o UPSERT: decide y justifícalo).
*Comprueba:* tres ejecuciones del mismo día dejan las mismas filas que una.

**Hito 4 — No cargar basura.** Si una validación falla, el pipeline se detiene **antes** de cargar y lo deja en el log.
*Comprueba:* con un archivo roto, las tablas quedan como estaban.

**Hito 5 — Orquestado.** Un DAG diario de Airflow con una tarea por etapa, reintentos y dependencias explícitas.
*Comprueba:* un backfill de 7 días de agosto de 2026 deja 7 días de datos; repetirlo deja los mismos.

**Hito 6 — Probado.** Las transformaciones tienen tests con datos pequeños y sin base de datos.
*Comprueba:* `pytest` pasa con PostgreSQL apagado.

## Preguntas para defenderlo

- ¿ETL o ELT? ¿Dónde ocurre aquí la transformación y por qué?
- ¿Qué pasa si el tipo de cambio de hoy todavía no está publicado?
- Si detienes PostgreSQL a mitad de una ejecución, ¿qué queda cargado? ¿Cómo lo sabes?
- ¿Qué parte no escalaría a 100 millones de filas al día?

## Súbelo de nivel

- Zona raw en S3 sobre **Floci**.
- La transformación en PySpark, comparada con la de pandas (`06_spark`).
