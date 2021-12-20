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
