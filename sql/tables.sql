/* the function below creates the table author*/

create table author(
	 author_id		integer, 
	 email			varchar(50), 
	 first_name		varchar(20),
	 last_name		varchar(20),
	 phone_number 	numeric(10,0),
	 primary key (author_id)
);

/* the function below creates the table book*/

create table book(
	 ISBN			varchar(5), 
	 book_name		varchar(50), 
	 price			numeric(4,0),
	 number_of_pages numeric(4,0),
	 quantity 		numeric(3,0),
	 royalities 	numeric(4,0),
	 genre 			varchar(20),
	 primary key (ISBN)
);

/* the function below creates the table address*/

create table address(
	 address_id		integer, 
	 address_type	varchar(10), 
	 post_code		varchar(10),
	 street_name   	varchar(20),
	 street_number 	numeric(10,0),
	 province 		varchar(20),
	 primary key (address_id)
);

/* the function below creates the table written_by*/

create table written_by(
	 author_id 		integer, 
	 ISBN			varchar(5),
	 primary key (ISBN),
	 foreign key (author_id) references author (author_id),
	 foreign key (ISBN) references book (ISBN)
);

/* the function below creates the table warehouse*/

create table warehouse(
	 warehouse_id 	integer, 
	 name			varchar(15),
	 phone_number	numeric(10,0),
	 location 		varchar(20),
	 ISBN			varchar(5),
	 primary key (warehouse_id),
	 foreign key (ISBN) references book (ISBN)
);

/* the function below creates the table banking_info*/

create table banking_info(
	 card_number 	numeric(8,0), 
	 exp_date		varchar(10),
	 CVV_number		numeric(3,0),
	 primary key (card_number)
);

/* the function below creates the account_details*/

create table account_details(
	 account_name 	varchar(20), 
	 password		varchar(20),
	 account_type	varchar(10),
	 first_name		varchar(15),
	 last_name		varchar(15),
	 email			varchar(50),
	 phone_number	numeric(10,0),
	 primary key (account_name)
);

/* the function below creates the table account_main*/

create table account_main(
	 account_id 	serial,
	 account_name 	varchar(20), 
	 address_id	integer,
	 card_number	numeric(15,0),
	 primary key (account_id),
	 foreign key (account_name) references account_details (account_name),
	 foreign key (card_number) references banking_info (card_number)
);

/* the function below creates the table orders*/

create table "orders"(
	 order_id 		varchar(5), 
	 address_id		integer,
	 primary key (order_id),
	 foreign key (address_id) references address (address_id)
);

/* the function below creates the table tracking_details*/

create table tracking_details(
	 tracking_id 		serial, 
	 shipping_status 	varchar(20),
	 "location"			varchar(20),
	 primary key (tracking_id)
);

/* the function below creates the table tracking_main*/

create table tracking_main(
	 tracking_id 		integer, 
	 order_id		varchar(5),
	 primary key (tracking_id),
	 foreign key (order_id) references "orders" (order_id),
	 foreign key (tracking_id) references tracking_details (tracking_id)
);

/* the function below creates the table basket_amount*/

create table basket_amount(
	 basket_owner			varchar(20),
	 price				numeric(10,0),
	 amount_added		numeric(10,0),
	 primary key (basket_owner)
);

/* the function below creates the table basket_main*/

create table basket_main(
	 account_basket			integer, 
	 basket_owner			varchar(20),
	 account_id		 	integer,
	 order_id 			varchar(5),
	 ISBN 				varchar(5),
	 primary key (account_basket),
	 foreign key (order_id) references "orders" (order_id),
	 foreign key (account_id) references account_main (account_id),
	 foreign key (ISBN) references book (ISBN),
	 foreign key (basket_owner) references basket_amount (basket_owner)
);

/* the function below creates the table publisher_details*/

create table publisher_details(
	 publisher_name 	varchar(20), 
	 email			varchar(50),
	 phone_number	numeric(10,0),
	 primary key (publisher_name)
);

/* the function below creates the table publisher_books*/

create table publisher_books(
	 publisher_id 	integer,
	 publisher_name varchar(20), 
	 address_id		integer,
	 card_number	numeric(15,0),
	 ISBN			varchar(5),
	 primary key (publisher_id),
	 foreign key (publisher_name) references publisher_details (publisher_name),
	 foreign key (card_number) references banking_info (card_number),
	 foreign key (ISBN) references book (ISBN)
);

