drop table if exists dim_addresses, dim_customer, dim_product, dim_seller, dim_store, dim_supplie, dim_person, facts_sale cascade;

create table if not exists dim_addresses (
    id SERIAL primary key,
    country varchar(50) null,
	postal_code varchar(50) null,
	store_location varchar(50) null,
	city varchar(50) null,
	store_state varchar(50) null,
	supplier_address varchar(50) null
);

create table if not exists dim_person (
    id SERIAL primary key,
    first_name varchar(50) null,
	last_name varchar(50) null,
	customer_age int4 null,
	email varchar(50) null
);


create table if not exists dim_customer (
    id SERIAL primary key,
	customer_pet_type varchar(50) null,
	customer_pet_name varchar(50) null,
	customer_pet_breed varchar(50) null,
	addresses_id Integer not null references dim_addresses(id),
	person_id Integer not null references dim_person(id)
);

create table if not exists dim_seller (
    id SERIAL primary key,
	addresses_id Integer not null references dim_addresses(id),
	person_id Integer not null references dim_person(id)
);


create table if not exists dim_product (
    id SERIAL primary key,
	product_name varchar(50) null,
	product_category varchar(50) null,
	product_price float4 null,
	product_quantity int4 null,
	pet_category varchar(50) null,
	product_weight float4 null,
	product_color varchar(50) null,
	product_size varchar(50) null,
	product_brand varchar(50) null,
	product_material varchar(50) null,
	product_description varchar(1024) null,
	product_rating float4 null,
	product_reviews int4 null,
	product_release_date varchar(50) null,
	product_expiry_date varchar(50) null
);

create table if not exists dim_store (
    id SERIAL primary key,
	store_name varchar(50) null,
	store_phone varchar(50) null,
	store_email varchar(50) null,
	addresses_id Integer not null references dim_addresses(id),
	person_id Integer not null references dim_person(id)
);

create table if not exists dim_supplier (
    id SERIAL primary key,
	supplier_name varchar(50) null,
	supplier_phone varchar(50) null,
	addresses_id Integer not null references dim_addresses(id),
	person_id Integer not null references dim_person(id)
);

create table if not exists facts_sale (
    id SERIAL primary key,
	sale_date varchar(50) null,
	sale_quantity int4 null,
	sale_total_price float4 null,
	customer_id Integer not null references dim_customer(id),
	seller_id Integer not null references dim_seller(id),
	product_id Integer not null references dim_product(id),
	store_id Integer not null references dim_store(id),
	supplier_id Integer not null references dim_supplier(id)
);