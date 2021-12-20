/* this query was made on JDBC and it gets all the rows from the table account_details
that has an account_type of regular and account_name that matches the user*/

Select * from account_details 
where account_type = 'regular' AND account_name = "'" + username + "'"

/* this query was made on JDBC and it gets all the rows from the table account_details
that has an account_type of admin and account_name that matches the user*/

Select password from account_details 
where account_type = 'admin' AND account_name = "'" + username + "'"

/* this query was made on JDBC and it gets all the passwords in the column password
that have an account_type of admin and account_name that matches the user*/

Select password from account_details 
where account_type = 'admin' AND account_name ="'" + username + "'"

/* this query was made on JDBC and it natural joins the tables account_main with account_details
so that all the rows in column account_id can be found if the account_name matches the user*/

Select account_id from account_main natural join account_details
where account_name ="'" + username + "'"

/* this query was made on JDBC and it inserts data into
the table account_details using the values the user inputted*/

INSERT INTO account_details values('%s', '%s', '%s', '%s', '%s', '%s', '%s')

/* this query was made on JDBC and it inserts values into the table address
using the values the user inputted*/

INSERT INTO address values('%s', '%s', '%s', '%s', '%s', '%s')

/* this query was made on JDBC and it inserts values into the table
banking_info using the values the user inputted*/

INSERT INTO banking_info values('%s', '%s', '%s')

/* this query was made on JDBC and it inserts values into the table
account_main using the values the user inputted*/

INSERT INTO account_main values('%s', '%s', '%s', '%s')

/* this query was made on JDBC and it brings up all rows in the column book_name
in the table book when book_name equals the user's input for book name*/

Select book_name from book 
where book_name ="'" + name + "'"

/* this query was made on JDBC and it brings up all rows in the column book_name
in the table book when it natural joins written_by and natural joins author
when first_name and last_name equals the user's input for both names*/

Select book_name from book natural join written_by natural join author
where first_name="'" + first + "'" AND last_name = "'" + second + "'"

/* this query was made on JDBC and it brings up all rows in the column book_name
in the table book when isbn equals the user's input for isbn*/

Select book_name from book
where isbn ="'" + isbn + "'"

/* this query was made on JDBC and it brings up all rows in the table book when
book_name the user inputs matches the ones in the database*/

Select * from book 
where book_name ="'" + bookList.get(input-1) + "'"

/* this query was made on JDBC and it brings up all rows in the table book natural joins author and natural joins written_by
whenbook_name the user inputs matches the ones in the database. It will show
who wrote the book and their details*/

Select first_name, last_name from author natural join written_by natural join book 
where book_name ="'" + bookList.get(input-1) + "'"

/* this query was made on JDBC and it brings up all rows in the table publisher_name natural joins book
when book_name the user inputs matches the ones in the database. It will display
the publisher of the book*/

Select publisher_name from publisher_books natural join book 
where book_name ="'" + bookList.get(input-1) + "'"

/* this query was made on JDBC and it brings up all rows in the table basket_amount when
basket_owner matches the user*/

Select * from basket_amount 
where basket_owner ="'" + account_name + "'"

/* this query was made on JDBC and it updates the table basket_amount
with the price of the book the user added into basket*/

UPDATE basket_amount "" + "set price = " + price + 
where basket_owner = "'" + account_name + "'"

/* this query was made on JDBC and it updates the table basket_amount
with the quantity of the book the user added into basket. Essentially it adds
1 book to the preexisting total*/

UPDATE basket_amount "" + "set amount_added = " + amount + 
where basket_owner ="'" + account_name + "'"

/* this query was made on JDBC and it inserts values into the table
account_main using the values the user inputted*/

INSERT INTO account_main values('%s', '%s')

/* this query was made on JDBC and it inserts values into the table
book using the values the user inputted*/

INSERT INTO book values('%s', '%s', '%s', '%s', '%s', '%s', '%s')

/* this query was made on JDBC and it inserts values into the table
warehouse using the values the user inputted*/

INSERT INTO warehouse values('%s', '%s', '%s', '%s', '%s')

/* this query was made on JDBC and it inserts values into the table
author using the values the user inputted*/

INSERT INTO author values('%s', '%s', '%s', '%s', '%s')
