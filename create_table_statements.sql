CREATE TABLE "car" (
  "car_id" SERIAL,
  "make" VARCHAR(30),
  "model" VARCHAR(30),
  "year" VARCHAR(30),
  "price" numeric(6,2),
  "fos sale" BOOL,
  PRIMARY KEY ("car_id")
);

CREATE TABLE "service" (
  "service_id" SERIAL,
  "name" VARCHAR(50),
  "cost" VARCHAR(50),
  PRIMARY KEY ("service_id")
);

CREATE TABLE "parts_Inventory" (
  "parts_id" SERIAL,
  "name" VARCHAR(50),
  "price" NUMERIC(6,2),
  "total_quantity" INTEGER,
  PRIMARY KEY ("parts_id")
);

CREATE TABLE "part_invoice" (
  "parts_invoice_id" SERIAL,
  "parts_id" INTEGER, 
  "date" TIMESTAMP WITHOUT TIME ZONE,
  "quantity" INTEGER,
  "total_price" numeric(6,2),
  "service_invoice_id" INTEGER,
  PRIMARY KEY ("parts_invoice_id"),
  CONSTRAINT "FK_part_invoice.parts_id"
    FOREIGN KEY ("parts_id")
      REFERENCES "parts_Inventory"("parts_id"),
	 CONSTRAINT "FK_part_invoice.service_invoice_id"
	FOREIGN KEY ("service_invoice_id")
      REFERENCES "service_invoice"("service_invoice_id")
);


CREATE TABLE "service_invoice" (
  "service_invoice_id" SERIAL,
  "car_id" INTEGER,
  "service_id" INTEGER,
  "customer_id" INTEGER,
  "date" TIMESTAMP WITHOUT TIME ZONE,
  "total_price" numeric(6,2),
  PRIMARY KEY ("service_invoice_id"),
  CONSTRAINT "FK_service_invoice.service_id"
    FOREIGN KEY ("service_id")
      REFERENCES "service"("service_id"),
  CONSTRAINT "FK_service_invoice.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "car"("car_id"),
  CONSTRAINT "FK_service_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id")
    
);

CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(30),
  "last_name" VARCHAR(30),
  "email" VARCHAR(60),
  "phone" VARCHAR(30),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "service_ticket" (
  "ticket_id" SERIAL,
  "service_invoice_id" INTEGER,
  "staff_id" INTEGER,
  PRIMARY KEY ("ticket_id"),
  CONSTRAINT "FK_service_ticket.service_invoice_id"
    FOREIGN KEY ("service_invoice_id")
      REFERENCES "service_invoice"("service_invoice_id"),
  CONSTRAINT "FK_service_ticket.staff_id"
	 FOREIGN KEY ("staff_id")
	   REFERENCES "staff"("staff_id")
	);

CREATE TABLE "staff" (
  "staff_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "email" VARCHAR(70),
  "staff_type" VARCHAR(50),
  PRIMARY KEY ("staff_id")
 
);

CREATE TABLE "invoice" (
  "invoice_id" SERIAL,
  "staff_id" INTEGER,
  "car_id" INTEGER,
  "customer_id" INTEGER,
  "date" TIMESTAMP WITHOUT TIME ZONE,
  "total_price" numeric(6,2),
  PRIMARY KEY ("invoice_id"),
  CONSTRAINT "FK_invoice.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id"),
  CONSTRAINT "FK_invoice.staff_id"
    FOREIGN KEY ("staff_id")
      REFERENCES "staff"("staff_id"),
  CONSTRAINT "FK_invoice.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "car"("car_id")
);