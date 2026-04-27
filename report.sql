-- =====================================
-- REPORTE SQL - CHALLENGER SISTEMA VENTAS
-- =====================================

-- 1. Mostrar todos los clientes registrados
SELECT * FROM clientes;

-- 2. Mostrar todos los productos disponibles
SELECT * FROM productos;

-- 3. Mostrar todas las ventas realizadas
SELECT * FROM ventas;

-- 4. Mostrar solo nombre y email de clientes
SELECT nombre, email FROM clientes;

-- 5. Mostrar solo nombre y precio de productos
SELECT nombre, precio FROM productos;

-- 6. Productos con precio mayor a 50000
SELECT *FROM productos
WHERE precio > 50000;

-- 7. Ventas realizadas el 2026-04-02
SELECT *FROM ventas
WHERE fecha = '2026-04-02';

-- 8. Productos ordenados de mayor a menor precio

SELECT * FROM productos
ORDER BY precio DESC;

-- 9. Clientes ordenados por nombre
SELECT *FROM clientes
ORDER BY nombre ASC;

-- 10. Detalles de venta con cantidad >= 2
SELECT *
FROM detalle_venta
WHERE cantidad >= 2;

-- 11. Total de clientes
SELECT COUNT(*) AS total_clientes
FROM clientes;

-- 12. Total de productos
SELECT COUNT(*) AS total_productos
FROM productos;

-- 13. Total de ventas
SELECT COUNT(*) AS total_ventas
FROM ventas;

-- 14. Precio promedio de productos
SELECT AVG(precio) AS precio_promedio
FROM productos;

-- 15. Suma total de precios de productos:
SELECT SUM(precio) AS suma_total_precios
FROM productos;

-- 16. Mostrar venta + nombre del cliente + fecha

SELECT v.id_venta, 
    c.nombre AS nombre_cliente, 
    v.fecha
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente


-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad

SELECT dv.id_venta, 
    p.nombre AS nombre_producto, 
    dv.cantidad
FROM detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto


-- 18. Mostrar nombre del cliente + id de venta + fecha

SELECT c.nombre AS nombre_cliente,
	v.id_venta,
	v.fecha, 
FROM ventas v
JOIN clientes c  ON v.id_cliente = c.id_cliente 


-- 19. Mostrar nombre del producto + cantidad vendida + id de venta

SELECT p.nombre AS nombre_producto,
	dv.cantidad,
	dv.id_venta
FROM detalle_venta dv 
JOIN productos p  ON dv.id_producto = p.id_producto 


-- 20. Mostrar cuántas ventas ha realizado cada cliente

SELECT c.nombre AS nombre_cliente,
	COUNT(v.id_venta)  AS cantidad_ventas
FROM clientes c 
LEFT JOIN ventas v ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente,
	c.nombre


-- 21. Mostrar solo los clientes con más de una venta


-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta


-- 23. Mostrar solo los productos que aparecen más de una vez


-- 24. Mostrar las ventas que tienen más de un producto asociado


-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2


-- 26. Consulta trampa que no devuelva resultados
SELECT
  c.nombre AS cliente,
  SUM(dv.cantidad) AS cantidad_productos_comprados
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente
JOIN detalle_venta dv
ON v.id_venta = dv.id_venta
GROUP BY c.nombre
HAVING SUM(dv.cantidad) > 6;

--Por que el total de cantidades totales en productos comprado por clientes
--durante el pediodo del 01/04/2026 al 06/04/2026 
--tiene un maximo de 6 productos 
--y el signo corresponde a un numero mayor a 6

-- BONUS 1: Producto más caro
SELECT nombre, precio
FROM productos
WHERE precio = (SELECT MAX(precio)
                FROM productos);

-- BONUS 2: Cliente con más ventas
SELECT
  c.nombre,
  COUNT(v.id_venta) AS total_ventas
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nombre
HAVING COUNT(v.id_venta) = (SELECT MAX(conteo)
                            FROM (SELECT COUNT(id_venta) AS conteo
                            FROM ventas
                             GROUP BY id_cliente) AS sub);

-- BONUS 3: Fecha con más ventas
SELECT
  fecha,
  COUNT(id_venta) AS total_ventas
FROM ventas
GROUP BY fecha
HAVING COUNT(id_venta) = (SELECT MAX(conteo)
                            FROM (SELECT COUNT(id_venta) AS conteo
                                    FROM ventas
                                    GROUP BY fecha) AS sub);
