/*ORDER BY

Some practice using ORDER BY:

Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.


Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.


Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.

_

Algo de práctica usando ORDER BY:

Escriba una consulta para devolver los 10 primeros pedidos en la tabla de pedidos. Incluya la identificación, ocurrido_at y total_amt_usd.


Escriba una consulta para devolver los 5 pedidos principales en términos de total_amt_usd. Incluya el id, account_id y total_amt_usd.


Escriba una consulta para devolver los 20 pedidos más bajos en términos de total_amt_usd. Incluya el id, account_id y total_amt_usd.*/

SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

/*WHERE

Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.

Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.

-
Extrae las primeras 5 filas y todas las columnas de la tabla de pedidos que tienen un monto en dólares de gloss_amt_usd mayor o igual a 1000.

Extrae las primeras 10 filas y todas las columnas de la tabla de pedidos que tienen un total_amt_usd inferior a 500.
*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;


/*Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) just for the Exxon Mobil company in the accounts table.
-
Filtre la tabla de cuentas para incluir el nombre de la empresa, el sitio web y el punto de contacto principal (primary_poc) solo para la empresa Exxon Mobil en la tabla de cuentas.
*/

SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';


/* Operaciones Aritmeticas.

Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields
-
Cree una columna que divida el standard_amt_usd por el standard_qty para encontrar el precio unitario del papel estándar para cada pedido. Limite los resultados a los primeros 10 pedidos e incluya los campos id y account_id */

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

/*Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also. NOTE - you will receive an error with the correct solution to this question. This occurs because at least one of the values in the data creates a division by zero in your formula. You will learn later in the course how to fully handle this issue. For now, you can just limit your calculations to the first 10 orders, as we did in question #1, and you'll avoid that set of data that causes the problem.
-
Escriba una consulta que encuentre el porcentaje de ingresos que proviene del papel de póster para cada pedido. Deberá usar solo las columnas que terminan con _usd. (Intente hacer esto sin usar la columna total). Muestre también los campos id y account_id. NOTA: recibirá un error con la solución correcta a esta pregunta. Esto ocurre porque al menos uno de los valores en los datos crea una división por cero en su fórmula. Más adelante en el curso, aprenderá a manejar este problema por completo. Por ahora, puede limitar sus cálculos a los primeros 10 pedidos, como hicimos en la pregunta n. ° 1, y evitará ese conjunto de datos que causa el problema.*/

SELECT id, account_id, 
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;

/*Questions using the LIKE operator
Use the accounts table to find

All the companies whose names start with 'C'.

All companies whose names contain the string 'one' somewhere in the name.

All companies whose names end with 's'.*/

SELECT name
FROM accounts
WHERE name LIKE 'C%';

SELECT name
FROM accounts
WHERE name LIKE '%one%';

SELECT name
FROM accounts
WHERE name LIKE '%s';

/*Questions using IN operator.
The IN operator is useful for working with both numeric and text columns. This operator allows you to use an =, but for more than one item of that particular column. 

Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.


Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');


SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');


/*Questions using the NOT operator
We can pull all of the rows that were excluded from the queries in the previous two concepts with our new operator.

Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.

Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
-
Podemos extraer todas las filas que se excluyeron de las consultas en los dos conceptos anteriores con nuestro nuevo operador.

Utilice la tabla de cuentas para encontrar el nombre de la cuenta, el poc principal y la identificación del representante de ventas de todas las tiendas, excepto Walmart, Target y Nordstrom.

Utilice la tabla web_events para encontrar toda la información sobre las personas que fueron contactadas a través de cualquier método, excepto mediante métodos orgánicos o de AdWords.
*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');


/*All the companies whose names do not start with 'C'.

All companies whose names do not contain the string 'one' somewhere in the name.

All companies whose names do not end with 's'.

-
Todas las empresas cuyos nombres no comienzan con 'C'.

Todas las empresas cuyos nombres no contienen la cadena "uno" en algún lugar del nombre.

Todas las empresas cuyos nombres no terminen con 's'.*/

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

SELECT name
FROM accounts
WHERE name NOT LIKE '%s';

/*Solutions to AND and BETWEEN Questions
Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.*/

SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.

SELECT occurred_at, gloss_qty 
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

You should notice that there are a number of rows in the output of this query where the gloss_qty values are 24 or 29. So the answer to the question is that yes, the BETWEEN operator in SQL is inclusive; that is, the endpoint values are included. So the BETWEEN statement in this query is equivalent to having written "WHERE gloss_qty >= 24 AND gloss_qty <= 29."

You will notice that using BETWEEN is tricky for dates! While BETWEEN is generally inclusive of endpoints, it assumes the time is at 00:00:00 (i.e. midnight) for dates. This is the reason why we set the right-side endpoint of the period at '2017-01-01'.

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

/*Questions using the OR operator
Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.


Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.


Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.*/

SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');
