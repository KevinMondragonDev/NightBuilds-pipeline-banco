# sideproject-pipeline-banco

> Pipeline diario que extrae, limpia y carga en PostgreSQL de forma idempotente, orquestado con Airflow.

**Estado:** 🚧 sin empezar · **Tipo:** ETL orquestado · **Módulo del programa:** 05/04 · Pipelines

## La problemática

El reporte de compras en dólares se volvió diario y ya no vale ejecutarlo a mano. Hace falta un pipeline que se programe solo, que no cargue datos malos y que se pueda relanzar cualquier día sin duplicar nada.

## Los datos

| Dónde | Qué es |
|---|---|
| `datos/movimientos.csv` | 400 movimientos bancarios limpios, julio a septiembre de 2026 |
| `datos/transacciones_sucias.csv` | 1,560 transacciones con defectos, enero a septiembre de 2026 |
| `datos/banco.sql` | Script de PostgreSQL con las tablas `clientes` y `cuentas` (base `banco_python`) |
| <https://api.frankfurter.dev/v1/2026-01-01..2026-09-30?base=USD&symbols=MXN> | API pública de tipos de cambio USD→MXN, sin clave (enero a septiembre de 2026) |

Los archivos de `datos/` son **sintéticos**, generados para practicar: no corresponden a personas ni a operaciones reales.

## Qué hay que construir

El enunciado completo, con sus hitos y cómo comprobar cada uno, está en [`RETO.md`](RETO.md). No trae solución: el diseño es tuyo.

- [`docs/REGLAS.md`](docs/REGLAS.md): cómo se trabaja un sideproject y qué debe tener este README al terminar.
- [`docs/RUBRICA.md`](docs/RUBRICA.md): con qué criterios se evalúa.

## Cómo se ejecuta

*Pendiente: se escribe al cerrar el primer hito. Los comandos exactos, desde `git clone`.*

## Decisiones

*Pendiente: tres decisiones técnicas y la alternativa que se descartó en cada una.*

## Qué aprendí

*Pendiente.*

---

Reto del programa de Python e ingeniería de datos: [UNIR_Python_Certification](https://github.com/KevinMondragonDev/UNIR_Python_Certification).
