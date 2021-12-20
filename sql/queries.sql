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

/* */

INSERT INTO banking_info values('%s', '%s', '%s')

/* */

INSERT INTO account_main values('%s', '%s', '%s', '%s')

/* */

Select book_name from book 
where book_name ="'" + name + "'"

/* */

Select book_name from book natural join written_by natural join author
where first_name="'" + first + "'" AND last_name = "'" + second + "'"

/* */

Select book_name from book
where isbn ="'" + isbn + "'"

/* */

Select * from book 
where book_name ="'" + bookList.get(input-1) + "'"

/* */

Select first_name, last_name from author natural join written_by natural join book 
where book_name ="'" + bookList.get(input-1) + "'"

/* */

Select publisher_name from publisher_books natural join book 
where book_name ="'" + bookList.get(input-1) + "'"

/* */

Select * from book 
where book_name ="'" + bookList.get(input-1) + "'"

/* */

Select * from basket_amount 
where basket_owner ="'" + account_name + "'"

/* */

UPDATE basket_amount "" + "set price = " + price + 
where basket_owner = "'" + account_name + "'"

/* */

UPDATE basket_amount "" + "set amount_added = " + amount + 
where basket_owner ="'" + account_name + "'"

/* */

INSERT INTO account_main values('%s', '%s')

/* */

INSERT INTO book values('%s', '%s', '%s', '%s', '%s', '%s', '%s')

/* */

INSERT INTO warehouse values('%s', '%s', '%s', '%s', '%s')

/* */

INSERT INTO author values('%s', '%s', '%s', '%s', '%s')
