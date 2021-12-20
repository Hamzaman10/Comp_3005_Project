(inside trigger)
CREATE TRIGGER restock
    AFTER UPDATE OF quantity
    ON public.book
    FOR EACH ROW
    EXECUTE FUNCTION public.refill();

(inside trigger function )
BEGIN
	update book 
	set quantity = 15
	where quantity < 10;
	return new;
END;


