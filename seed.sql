INSERT INTO clientes (nombre, email) VALUES
('Ana Pérez', 'ana.perez@email.com'),
('Juan Soto', 'juan.soto@email.com'),
('Camila Rojas', 'camila.rojas@email.com'),
('Diego Muñoz', 'diego.munoz@email.com'),
('Valentina Torres', 'valentina.torres@email.com');

INSERT INTO productos (nombre, precio) VALUES
('Notebook Lenovo', 650000.00),
('Mouse Logitech', 19990.00),
('Teclado Redragon', 35990.00),
('Monitor Samsung 24"', 129990.00),
('Audífonos JBL', 45990.00),
('Silla Gamer', 189990.00),
('Webcam HD', 54990.00);

INSERT INTO ventas (fecha, id_cliente) VALUES
('2026-04-01', 1),
('2026-04-02', 2),
('2026-04-02', 1),
('2026-04-03', 3),
('2026-04-05', 4),
('2026-04-05', 2),
('2026-04-06', 5);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 5, 1),
(3, 2, 1),
(3, 4, 1),
(4, 5, 2),
(4, 7, 1),
(5, 3, 1),
(5, 4, 2),
(6, 2, 3),
(6, 6, 1),
(7, 7, 2);
