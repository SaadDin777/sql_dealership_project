--Function for inserting data into car table
CREATE OR REPLACE FUNCTION add_car(_car_id INTEGER, _make VARCHAR, _model VARCHAR, 
								   _year VARCHAR, _price INTEGER, _for_sale boolean)
RETURNS void
LANGUAGE plpgsql 
AS $MAIN$ 
BEGIN
		INSERT INTO "car"
		VALUES(_car_id, _make, _model, _year, _price, _for_sale);
		
END;
$MAIN$

SELECT add_car(3, 'Nissan', 'Rogue', '2021', 27150, FALSE);
SELECT add_car(4, 'Toyota', 'Camry', '2020', 25420, FALSE);


select * from car;

--Function for inserting data into service table
CREATE OR REPLACE FUNCTION add_service(_service_id INTEGER, _name VARCHAR, _cost VARCHAR)
RETURNS void
LANGUAGE plpgsql 
AS $MAIN$ 
BEGIN
		INSERT INTO "service"
		VALUES(_service_id, _name, _cost);
		
END;
$MAIN$

SELECT add_service(3, 'Replace Air Filter', '$30');
SELECT add_service(4, 'Add Antifreeze', '$150');


select * from service;

--Function for inserting data into service_invoice table
CREATE OR REPLACE FUNCTION add_service_invoice(_service_invoice_id INTEGER, _car_id INTEGER, 
											   _service_id INTEGER, _customer_id INTEGER, 
											  _total_price INTEGER)
RETURNS void
LANGUAGE plpgsql 
AS $MAIN$ 
BEGIN
		INSERT INTO "service_invoice"
		VALUES(_service_invoice_id, _car_id, _service_id, _customer_id, _total_price);
		
END;
$MAIN$

SELECT add_service_invoice(3, 3, 3, 3, '30');
SELECT add_service_invoice(4, 4, 4, 4, 150);


select * from service_invoice;

--Function for inserting data into service_ticket table
CREATE OR REPLACE FUNCTION add_service_ticket(_ticket_id INTEGER, _service_invoice_id INTEGER, 
											   _staff_id INTEGER)
RETURNS void
LANGUAGE plpgsql 
AS $MAIN$ 
BEGIN
		INSERT INTO "service_ticket"
		VALUES(_ticket_id , _service_invoice_id, _staff_id);
		
END;
$MAIN$

SELECT add_service_ticket(3, 3, 3);
SELECT add_service_ticket(4, 4, 4);

select * from service_ticket;

--Function for inserting data into staff table
CREATE OR REPLACE FUNCTION add_staff(_staff_id INTEGER, _first_name VARCHAR, 
											   _last_name VARCHAR, _email VARCHAR, 
											  _staff_type VARCHAR)
RETURNS void
LANGUAGE plpgsql 
AS $MAIN$ 
BEGIN
		INSERT INTO "staff"
		VALUES(_staff_id , _first_name, _last_name, _email, _staff_type);
		
END;
$MAIN$

SELECT add_staff(3, 'Sansa', 'Stark', 'sansastarck@example.com', 'Sales');
SELECT add_staff(4, 'Bran', 'Stark', 'branstark@example.com', 'Sales');

select * from staff;

--Function for inserting data into customer table
CREATE OR REPLACE FUNCTION add_customer(_a INTEGER, _b VARCHAR, _c VARCHAR, _d VARCHAR, _e VARCHAR)
RETURNS void
LANGUAGE plpgsql
AS $MAIN$ 
BEGIN 
	INSERT INTO customer 
	VALUES(_a, _b, _c, _d, _e);
END;
$MAIN$

SELECT * from customer; 
SELECT add_customer(4, 'Khal', 'Drogo', 'drogo@got.net', '555-123-1234');
SELECT add_customer(5, 'Tywin', 'Lannister', 'tywin@got.net', '555-125-9814');


--FUNCTION TO ADD PARTS
CREATE OR REPLACE FUNCTION add_part(_a INTEGER, _b VARCHAR, _c NUMERIC(8,2), _d INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $MAIN$ 
BEGIN 
	INSERT INTO "parts_Inventory"
	VALUES(_a, _b, _c, _d);
END;
$MAIN$

SELECT * from "parts_Inventory";
SELECT add_part(3, 'battery', 99.99, 32);
SELECT add_part(4, 'wipers', 15.95, 120);
SELECT add_part(5, 'oil', 38.99, 17);

--FUNCTION TO ADD INVOICE
CREATE OR REPLACE FUNCTION add_invoice(i_id INTEGER, s_id INTEGER, c_id INTEGER, cu_id INTEGER, price NUMERIC(8,2))
RETURNS void
LANGUAGE plpgsql
AS $MAIN$ 
BEGIN 
	INSERT INTO "invoice"
	VALUES(i_id, s_id, c_id, cu_id, price);
END;
$MAIN$

SELECT * from "invoice";

SELECT add_invoice(3, 2, 1, 5, 20500.00);
SELECT add_invoice(4, 1, 1, 4, 30500.00);

CREATE OR REPLACE FUNCTION add_part_invoice(pi_id INTEGER, p_id INTEGER, quan INTEGER, i_id INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $MAIN$ 
BEGIN 
	INSERT INTO "part_invoice"
	VALUES(
		pi_id, 
		p_id, 
		quan, 
		NULL, 
		i_id);
	UPDATE "parts_Inventory"
	SET total_quantity = total_quantity - quan
	WHERE "parts_Inventory".parts_id = p_id;
END;
$MAIN$

SELECT * from "part_invoice";
SELECT add_part_invoice(3, 3, 1, 2);
SELECT add_part_invoice(4, 1, 4, 1);
SELECT add_part_invoice(5, 4, 2, 2);
SELECT add_part_invoice(6, 2, 1, 1);
SELECT add_part_invoice(7, 1, 1, 1);
SELECT add_part_invoice(8, 1, 1, 1);
SELECT add_part_invoice(9, 2, 1, 1);
SELECT add_part_invoice(10, 2, 1, 1);
SELECT add_part_invoice(11, 5, 2, 2);
SELECT add_part_invoice(12, 3, 2, 1);


CREATE OR REPLACE PROCEDURE update_part_price()
LANGUAGE plpgsql
AS $$
BEGIN 
	UPDATE part_invoice
	SET total_price = "parts_Inventory".price * part_invoice.quantity
	FROM "parts_Inventory"
	FULL JOIN part_invoice AS pi
	ON pi.parts_id = "parts_Inventory".parts_id;
	COMMIT;
END;
$$

CALL update_part_price();

--Procedure to add discount if a car is not for sale
CREATE OR REPLACE PROCEDURE discountPrice(
	discount INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE car
	SET price = car.price - discount
	WHERE car.for_sale = False;
	COMMIT;
END;
$$


Call discountPrice(3000);

select * from car;