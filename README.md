# 📊 Proyecto SQL para Gestión de Base de Datos - Fast Food

---

## 🧠 Descripción del proyecto

Este proyecto consistió en la creación, diseño y explotación de una base de datos para la cadena de comida rápida ficticia **Fast Food**. Su objetivo fue transformar registros dispersos en hojas de cálculo en una solución centralizada, escalable y analíticamente potente, mediante SQL Server y buenas prácticas de modelado relacional.

---

## 🛠️ Stack y herramientas

- SQL Server
- Lenguaje SQL (DDL & DML)
- Diagramación relacional
- Consultas multitabla con JOINs
- Funciones de agregación, filtrado y ordenamiento
- Inteligencia de negocio aplicada

---

## 🧩 Modelo de datos

### Tablas creadas

- `Productos`
- `Categorías`
- `Sucursales`
- `Empleados`
- `Clientes`
- `Órdenes`
- `DetallesOrdenes`
- `Mensajeros`
- `OrigenesOrden`
- `TiposPago`

Se establecieron relaciones mediante claves primarias y foráneas, asegurando integridad referencial y normalización avanzada.

---

## 📌 Consultas destacadas

Se desarrollaron consultas para resolver requerimientos reales del negocio. Algunas de las más relevantes:

### 📈 Operaciones CRUD avanzadas

- Aumentar precios por categoría (`UPDATE`)
- Reasignar empleados por departamento
- Actualizar direcciones de sucursales
- Eliminar órdenes o productos (con validación de claves foráneas)

### 🧮 Métricas clave del negocio

- Total de órdenes y ventas globales
- Distribución de ventas por método de pago y canal
- Ingresos promedio por sucursal y por empleado
- Productos más vendidos por categoría y sucursal

### ⏱️ Indicadores operativos

- Tiempo promedio de entrega por mensajero
- Horario con mayor cantidad de ventas
- Evolución de ventas mensuales (tendencia)

### 🔗 JOINs complejos

- Detalle completo de órdenes (cliente, empleado, mensajero)
- Productos sin categoría asignada
- Preferencias de producto por región

---

## 📍 Hallazgos clave

- ✔️ Todos los productos tienen categoría asignada (buena normalización)
- ✔️ Correcta asignación de empleados a sucursales
- ⚠️ Algunas órdenes sin mensajero asignado (posibles recogidas en tienda)
- 🎯 Preferencias de consumo por ubicación
- 🔁 Identificación de clientes frecuentes para programas de lealtad

---

## ⚙️ Estrategias de optimización

- Creación de índices en campos críticos
- Vistas consolidadas para reporting
- Validaciones para evitar nulos y errores lógicos
- Escalabilidad para nuevos módulos (promociones, reseñas, etc.)

---

## 💡 Desafíos enfrentados

| Desafío | Solución aplicada |
|--------|-------------------|
| Registros incompletos | Validaciones + valores predeterminados |
| Restricciones de claves foráneas | Eliminación en cascada y respaldos |
| Consultas JOIN complejas | Uso de alias + estructura legible |
| Lentas respuestas de consultas | Indexación + filtros adecuados |

---

## 🧠 Reflexión personal

> "Este proyecto fue un parteaguas en mi formación como analista de datos. Comprendí que modelar no es solo estructurar, sino anticipar cómo se usará la información. Aprendí a convertir datos en decisiones y a utilizar la IA como aliada para depurar, optimizar y validar estrategias analíticas. Estoy lista para enfrentar entornos reales donde la información cuenta historias que impactan el negocio."

---

## 🌟 Extra Credit (Consultas avanzadas)

- Ventas totales por mes
- Productos más vendidos y más rentables por categoría
- Órdenes gestionadas y promedio de ventas por empleado
- Comparativas de ventas por canal, año, mes y tipo de pago

---

## 👩‍💻 Autor

- **Nombre:** Martha Flor Salinas Guadarrama  
- 📧 **Email:** [marthaflorsg@gmail.com](mailto:marthaflorsg@gmail.com)  
- 🔗 **LinkedIn:** [Martha Flor Salinas G.](https://www.linkedin.com/in/mflor-salinas-g)  
- 🎓 **Perfil:** Analista de Datos | Ingeniera Civil
---

