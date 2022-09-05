insert into "car"
Values (
	1,
	'Tesla',
	'S',
	'2012',
	104990,
	TRUE
),
(
	2,
	'Audi',
	'R8',
	'2015',
	117150,
	TRUE
);


insert into "service"
VALUES (1, 'Tire Change', '$167'),
		(2, 'Battery Change', '14,000');
		
select * from service;
		
insert into "service_invoice" (service_invoice_id, car_id,service_id, customer_id, total_price)
VALUES (1, 1, 1, 1, 167),
		(2, 2, 2, 2, 100);
		
insert into "service_ticket" 
Values (1, 1, 1),
		(2, 2, 2);

insert into "staff"
Values (1, 'Jon', 'Snow', 'jonsnow@example.com', 'service'),
		(2, 'Arya', 'Stark', 'aryastark@example.com', 'service');

select * from car;

--customer table:
INSERT INTO "customer"(
	"customer_id",
	"first_name", 
	"last_name",
	"email",
	"phone"
) VALUES (
	1, 
	'Daenerys',
	'Targaryen',
	'dragonsRcool@dragons.net', 
	'123-555-4567'
),
(
	2, 
	'Cersei',
	'Lannister',
	'hot4bro@got.net', 
	'123-555-4567'
),
(
	3, 
	'Tyrion',
	'Lannister',
	NULL, 
	NULL
);

SELECT * FROM customer;

INSERT INTO "parts_Inventory"(
	"parts_id",
	"name", 
	"price",
	"total_quantity"
) VALUES (
	1, 
	'tire',
	70.99,
	80
),
(
	2, 
	'carburetor',
	130.99,
	20
);

INSERT INTO "part_invoice"(
	"parts_invoice_id",
	"parts_id",
	"quantity",
	"total_price",
	"service_invoice_id"
) VALUES (
	1, 
	1,
	2,
	141.98,
	2
),
(
	2, 
	1,
	4,
	250.96,
	1
);

INSERT INTO "invoice"(
	"invoice_id",
	"staff_id",
	"car_id",
	"customer_id",
	"total_price"
) VALUES (
	1, 
	1,
	1,
	2,
	30000.50
),
(
	2, 
	1,
	2,
	1,
	40000.50
);