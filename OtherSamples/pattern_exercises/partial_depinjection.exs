# Partial application and dependency injection

# type get_customer = customer_id -> customer
## ✓this is persistance ignorant
# get_customer_from_db = fn connection, customer_id ->
#   from connection
#   select customer
#   where customer_id == customer_id
# end
## The type of get_customer_from_db is: db_conn -> customer_id -> customer
## The following pipe keeps customer_id -> customer interface 
# get_customer.(customer_id)
# |> get_customer_from_db()
# |> IO.puts()
# "Niara"
#
#
#
