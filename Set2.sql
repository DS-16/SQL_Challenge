Q51: SELECT name, population, area from world WHERE  area>=  3000000 OR population >=25000000 ; 

Q52: SELECT name FROM customer WHERE referee_id !=2;

Q53: SELECT name FROM (SELECT name,od.customer_id FROM order1 AS od RIGHT JOIN customer AS cs
					  ON od.customer_id=cs.id)ds1 WHERE customer_id IS NULL;

Q54: SELECT employee_id,count(team_id) OVER(PARTITION BY team_id ORDER BY team_id) AS Team_Size FROM Employee
     ORDER BY employee_id;
	 
Q55: 

Q56: SELECT player_id, device_id FROM 
		(SELECT player_id,device_id, row_nuber() OVER(PARTITION BY player_id ORDER BY event_date) AS login_time  FROM activity) ds  
     WHERE login_time =1;
	 
Q57: WITH order_ds1 AS
                    (SELECT MAX(order_count) AS max_order FROM (SELECT customer_number, COUNT(order_number) AS order_count FROM orders GROUP BY customer_number)sq1)
         SELECT sq1.customer_number FROM
                 (SELECT customer_number, COUNT(order_number) AS order_number FROM orders GROUP BY customer_number)sq1
                  JOIN  order_ds1 ON order_ds1.max_order=sq1.order_number;
				  
Q58: