# API Testing con Karate DSL

Este proyecto prueba el API de **FakeStore** usando **Karate + JUnit5**.

## Requisitos
- Java 11+
- Maven
- IntelliJ IDEA (opcional)

## Ejecutar
```bash
mvn test
```

El reporte se genera en:
```
target/karate-reports/karate-summary.html
```

## Escenarios cubiertos
- Listar productos por categoría (electronics, jewelery, men's clothing, women's clothing)
- Consultar producto específico (id=1)
- Crear producto y actualizar imagen
- Listar todos los productos