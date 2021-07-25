The SELECT clause indicates which column(s) of data you'd like to see in the output (For Example, orders.* gives us all the columns in orders table in the output). 
The FROM clause indicates the first table from which we're pulling data, and the JOIN indicates the second table. 
The ON clause specifies the column on which you'd like to merge the two tables together. Try running this query yourself below.
-
La cláusula SELECT indica qué columna (s) de datos le gustaría ver en la salida (por ejemplo, orders. * Nos da todas las columnas en la tabla orders en la salida).
La cláusula FROM indica la primera tabla de la que estamos extrayendo datos y JOIN indica la segunda tabla.
La cláusula ON especifica la columna en la que le gustaría fusionar las dos tablas. Intente ejecutar esta consulta usted mismo a continuación.

Try pulling all the data from the accounts table, and all the data from the orders table.

SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.

SELECT orders.standard_qty, orders.gloss_qty, 
       orders.poster_qty,  accounts.website, 
       accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id

Notice that we need to specify every table a column comes from in the SELECT statement.


