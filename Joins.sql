/*The SELECT clause indicates which column(s) of data you'd like to see in the output (For Example, orders.* gives us all the columns in orders table in the output). 
The FROM clause indicates the first table from which we're pulling data, and the JOIN indicates the second table. 
The ON clause specifies the column on which you'd like to merge the two tables together. Try running this query yourself below.
-
La cláusula SELECT indica qué columna (s) de datos le gustaría ver en la salida (por ejemplo, orders. * Nos da todas las columnas en la tabla orders en la salida).
La cláusula FROM indica la primera tabla de la que estamos extrayendo datos y JOIN indica la segunda tabla.
La cláusula ON especifica la columna en la que le gustaría fusionar las dos tablas. Intente ejecutar esta consulta usted mismo a continuación.

Try pulling all the data from the accounts table, a

Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.nd all the data from the orders table.*/

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

/*Provide a table for all the for all web_events associated with account name of Walmart.
There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. 
Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
-
Proporcionar una tabla para todos los web_events asociados con el nombre de cuenta de Walmart.
Debe haber tres columnas. Asegúrese de incluir el primary_poc, la hora del evento y el canal de cada evento.
Además, puede optar por agregar una cuarta columna para asegurarse de que solo se eligieron los eventos de Walmart.
*/

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

/*Provide a table that provides the region for each sales_rep along with their associated accounts. 
Your final table should include three columns: the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) according to account name.
-
Proporcione una tabla que proporcione la región para cada sales_rep junto con sus cuentas asociadas.
Su tabla final debe incluir tres columnas: el nombre de la región, el nombre del representante de ventas y el nombre de la cuenta.
Ordene las cuentas alfabéticamente (A-Z) según el nombre de la cuenta
*/

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;


