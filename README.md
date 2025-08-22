# 📌 Prueba Técnica - API Testing con Karate

Este proyecto contiene **tests automatizados con Karate** sobre la API pública [Restful-Booker](https://restful-booker.herokuapp.com).
---

## ⚙️ Requisitos

- **Java 11+**
- **Maven 3.6+**

---

## ▶️ Ejecución de los tests

### Ejecutar todos los tests
```bash
mvn test -Dtest=CreateTokenRunner

```
Luego se peuden ejecutar

```bash
mvn test -Dtest=CreateBookingRunner
mvn test -Dtest=GetBookingRunner
mvn test -Dtest=UpdateBookingRunner
```

## Reporte
target/karate-reports/karate-summary.html

