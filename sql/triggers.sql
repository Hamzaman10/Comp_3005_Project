/*trigger based on lectures. This trigger activates when a book falls below a quantity of 10, and will be refilled until there are 15 books. 
The trigger below also does the same thing*/
create trigger restock after update of quantity on book
	referencing new row as nrow
	referencing old row as orow
	for each row
	when nrow.quantity < 10 
	and orow.quantity >= 10
	begin atomic
		update book 
		set quantity = 15
		where quantity < 10
	end; 

/* I used the create trigger and trigger function of pgadmin since the code above wasn't working */

/*inside trigger, created using the pgadmin create button*/
CREATE TRIGGER restock
    AFTER UPDATE OF quantity
    ON public.book
    FOR EACH ROW
    EXECUTE FUNCTION public.refill();

/*inside trigger function, created using the pgadmin create button */
BEGIN
	update book 
	set quantity = 15
	where quantity < 10;
	return new;
END;


