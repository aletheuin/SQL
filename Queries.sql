/*Some practice using ORDER BY:

Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.


Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.


Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.

_

Algo de práctica usando ORDER BY:

Escriba una consulta para devolver los 10 primeros pedidos en la tabla de pedidos. Incluya la identificación, ocurrido_at y total_amt_usd.


Escriba una consulta para devolver los 5 pedidos principales en términos de total_amt_usd. Incluya el id, account_id y total_amt_usd.


Escriba una consulta para devolver los 20 pedidos más bajos en términos del menor total_amt_usd. Incluya el id, account_id y total_amt_usd.*/

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
