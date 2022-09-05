--Update and modify queries
update "service"
set cost = '$14,000'
where service_id = 2;

alter table car
RENAME column "fos sale" TO for_sale;

select * from car;

select * from service;

alter table "car"
alter column price Type INTEGER;

alter table "invoice"
alter column total_price Type NUMERIC(8,2);

alter table "invoice"
drop column "date";

alter table "service_invoice"
drop column "date";

ALTER TABLE invoice
ADD “date” DATE DEFAULT CURRENT_DATE;

ALTER TABLE service_invoice
ADD “date” DATE DEFAULT CURRENT_DATE;

alter table "part_invoice"
drop column "date";

ALTER TABLE part_invoice
ADD “date” DATE DEFAULT CURRENT_DATE;

select * from "invoice";
select * from "car";
select * from "customer";
select * from "service_ticket";
select * from "service_invoice";
select * from "staff";
select * from "service";
select * from "part_invoice";
select * from "parts_Inventory";



