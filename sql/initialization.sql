/* the next 5 lines are inserting default values into book */

insert into "book" (ISBN, book_name, price, number_of_pages, quantity, royalities, genre)
values('15151', 'Dune: Deluxe Edition', 32.22, 688, 10, 5, 'Sci-Fi');

insert into "book" (ISBN, book_name, price, number_of_pages, quantity, royalities, genre)
values('23232', 'Harry Potter and the Philosophers Stone', 23.76, 352, 11, 5, 'Fantasy');

insert into "book" (ISBN, book_name, price, number_of_pages, quantity, royalities, genre)
values('31342', 'Percy Jackson and the Olympians, Book One', 11.87, 416, 12, 3, 'Action');

insert into "book" (ISBN, book_name, price, number_of_pages, quantity, royalities, genre)
values('86412', 'Darkwing', 16.56, 254, 15, 6, 'Mystery');

insert into "book" (ISBN, book_name, price, number_of_pages, quantity, royalities, genre)
values('14528', 'Firewing', 14.56, 278, 15, 4.6, 'Mystery');

/* the next 5 lines are inserting default values into warehouse */

insert into "warehouse" (warehouse_id, "name", phone_number, "location", ISBN)
values( 1, 'torontohouse', 6478921414, 'toronto', '15151');

insert into "warehouse" (warehouse_id, "name", phone_number, "location", ISBN)
values(2, 'torontohouse', 6478921414, 'toronto', '23232');

insert into "warehouse" (warehouse_id, "name", phone_number, "location", ISBN)
values(3, 'torontohouse', 6478921414, 'toronto', '31342');

insert into "warehouse" (warehouse_id, "name", phone_number, "location", ISBN)
values(4, 'torontohouse', 6478921414, 'toronto', '86412');

insert into "warehouse" (warehouse_id, "name", phone_number, "location", ISBN)
values(5, 'torontohouse', 6478921414, 'toronto', '14528');

/* the next 3 lines are inserting default values into account_details */

insert into "account_details" (account_name, "password", account_type, first_name, last_name, email, phone_number)
values( 'admin', 'admin123', 'admin', 'John', 'Smith', 'john@gmail.com', 4169982134);

insert into "account_details" (account_name, "password", account_type, first_name, last_name, email, phone_number)
values( 'cale', 'cale123', 'regular', 'Cale', 'White', 'cale@gmail.com', 4169921234);

insert into "account_details" (account_name, "password", account_type, first_name, last_name, email, phone_number)
values( 'matt', 'matt123', 'regular', 'Matt', 'Patt', 'matt@gmail.com', 4165149990);

/* the next 8 lines are inserting default values into address */

insert into "address" (address_id, address_type, post_code, street_name, street_number, province)
values(1, 'shipping', 'M2X1G7', 'Dort dr.', '46', 'Ontario');

insert into "address" (address_id, address_type, post_code, street_name, street_number, province)
values( 2, 'billing', 'R2N6G7', 'Kiber st.', '42', 'Quebec');

insert into "address" (address_id, address_type, post_code, street_name, street_number, province)
values(3, 'shipping', 'R2N6L2', 'Tiber st.', '41', 'Quebec');

insert into "address" (address_id, address_type, post_code, street_name, street_number, province)
values(4, 'billing', 'V4B8NK', 'Bile dr.', '76', 'Ontario');

insert into "address" (address_id,address_type, post_code, street_name, street_number, province)
values( 5, 'shipping', 'B7Y1N2', 'Hunt St.', '87', 'Quebec');

insert into "address" (address_id,address_type, post_code, street_name, street_number, province)
values( 6, 'billing', 'V4B8NK', 'Woodly dr.', '12', 'Ontario');

insert into "address" (address_id,address_type, post_code, street_name, street_number, province)
values( 7, 'billing', 'B2T8J9', 'Berry dr.', '164', 'Ontario');

insert into "address" (address_id,address_type, post_code, street_name, street_number, province)
values( 8, 'billing', 'B1Z7U9', 'Vine st.', '15', 'Ontario');

/* the next 7 lines are inserting default values into banking_info */

insert into "banking_info" (card_number, exp_date, CVV_number)
values( 14156572, '2022-11-23', '123');

insert into "banking_info" (card_number, exp_date, CVV_number)
values( 15709742, '2032-12-10', '425');

insert into "banking_info" (card_number, exp_date, CVV_number)
values( 20003444, '2012-12-07', '513');

insert into "banking_info" (card_number, exp_date, CVV_number)
values( 56743125, '2042-07-11', '675');

insert into "banking_info" (card_number, exp_date, CVV_number)
values( 56743128, '2012-07-21', '608');

insert into "banking_info" (card_number, exp_date, CVV_number)
values( 67533128, '2016-02-01', '542');

insert into "banking_info" (card_number, exp_date, CVV_number)
values( 12345123, '2021-07-15', '175');

/* the next 5 lines are inserting default values into account_main */

insert into "account_main" (account_id, account_name, address_id, card_number)
values(1,'admin', 1, 20003444);

insert into "account_main" (account_id,account_name, address_id, card_number)
values(2,'cale', 3, 15709742);

insert into "account_main" (account_id,account_name, address_id, card_number)
values(3,'cale', 4, 15709742);

insert into "account_main" (account_id,account_name, address_id, card_number)
values(4,'matt', 5, 56743125);

insert into "account_main" (account_id,account_name, address_id, card_number)
values(5,'matt', 6, 56743128);

/* the next 3 lines are inserting default values into publisher_details */

insert into "publisher_details" (publisher_name, email, phone_number)
values('Scholastic', 'scholastic@gmail.com', 6479112032);

insert into "publisher_details" (publisher_name, email, phone_number)
values('BooksRUS', 'booksrus@gmail.com', 6471441213);

insert into "publisher_details" (publisher_name, email, phone_number)
values('BooksFan', 'booksfan@gmail.com', 4125461234);

/* the next 5 lines are inserting default values into publisher_books */

insert into "publisher_books" (publisher_id, publisher_name, address_id, card_number, ISBN)
values(1, 'Scholastic', 2, 14156572, '15151');

insert into "publisher_books" (publisher_id, publisher_name, address_id, card_number, ISBN)
values(2, 'Scholastic', 2, 14156572, '23232');

insert into "publisher_books" (publisher_id, publisher_name, address_id, card_number, ISBN)
values(3, 'BooksRUS', 7, 67533128, '86412');

insert into "publisher_books" (publisher_id, publisher_name, address_id, card_number, ISBN)
values(4, 'BooksRUS', 7, 67533128, '14528');

insert into "publisher_books" (publisher_id, publisher_name, address_id, card_number, ISBN)
values(5, 'BooksFan', 8, 12345123, '31342');

/* the next 4 lines are inserting default values into author */

insert into "author" (author_id, email, first_name, last_name, phone_number)
values(1, 'rick@gmail.com', 'Rick', 'Riordan', 6123519090);

insert into "author" (author_id, email, first_name, last_name, phone_number)
values(2, 'J.K.@gmail.com', 'J.K.', 'Rowling', 4120908967);

insert into "author" (author_id, email, first_name, last_name, phone_number)
values(3, 'frank@gmail.com', 'Frank', 'Herbert', 4160508667);

insert into "author" (author_id, email, first_name, last_name, phone_number)
values(4, 'kenneth@gmail.com', 'Kenneth', 'Oppel', 4160508667);

/* the next 5 lines are inserting default values into written_by */

insert into "written_by" (author_id, ISBN)
values(2, '23232');

insert into "written_by" (author_id, ISBN)
values(3, '15151');

insert into "written_by" (author_id, ISBN)
values(1, '31342');

insert into "written_by" (author_id, ISBN)
values(4, '14528');

insert into "written_by" (author_id, ISBN)
values(4, '86412');

/* the next 2 lines are inserting default values into basket_main */

insert into "basket_amount" (basket_owner, price, amount_added)
values((select account_name from account_main where account_id = 2), 32, 1);

insert into "basket_main" (account_basket, basket_owner, account_id, ISBN)
values( 1, (select account_name from account_main where account_id = 2), 2, '15151' );

/* the next line is inserting default values into orders */

insert into "orders" (order_id, address_id)
values('1', 3);

/* the next 2 lines are updating basket_amount and basket_main to now have an order showing on it */

UPDATE basket_main
SET order_id = '1'
WHERE order_id IS NULL and account_basket = 1;

UPDATE basket_amount
set amount_added = amount_added + 1
where basket_owner = 'cale';

/* the next 2 lines are inserting default values into tracking_details and tracking_main*/

insert into "tracking_details" (tracking_id,shipping_status,"location")
values(1,'On Route', 'Toronto' );

insert into "tracking_main" (tracking_id, order_id)
values(1, '1' );
