Q1. SELECT ID, NAME, COUNTRYCODE, DISTRICT, POPULATION FROM CITY WHERE POPULATION > 100000 AND COUNTRYCODE ='USA';

Q2. SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUNTRYCODE ='USA';

Q3: SELECT * FROM CITY;

Q4: SELECT * FROM CITY WHERE ID = 1661;

Q5: SELECT * FROM CITY WHERE COUNTRYCODE='JPN';

Q6: SELECT DISTINCT CITY FROM CITY WHERE COUNTRYCODE='JPN';

Q7: SELECT DISTINCT STATE,CITY FROM station;

Q8: SELECT DISTINCT CITY FROM station WHERE ID%2=0;

Q9: SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS Difference_City_Entries FROM station;

Q10: SELECT city, LENGTH(city) AS shortest_name FROM station GROUP BY city ORDER BY LENGTH(city) ASC limit 1;
     SELECT city, LENGTH(city) AS longest_name FROM station GROUP BY city ORDER BY LENGTH(city) DESC limit 1;
	 
Q11: SELECT DISTINCT CITY FROM station WHERE CITY REGEXP '^[aeiouAEIOU]';

Q12: SELECT DISTINCT CITY FROM station WHERE CITY REGEXP '[aeiouAEIOU]$';

Q13: SELECT DISTINCT CITY FROM station WHERE CITY NOT REGEXP '^[aeiouAEIOU]';

Q14: SELECT DISTINCT CITY FROM station WHERE CITY NOT REGEXP '[aeiouAEIOU]$';

Q15: SELECT DISTINCT CITY FROM station WHERE CITY NOT REGEXP '^[aeiouAEIOU]' OR CITY NOT REGEXP '[aeiouAEIOU]$'; 

Q16: SELECT DISTINCT CITY FROM station WHERE CITY NOT REGEXP '^[aeiouAEIOU]' AND CITY NOT REGEXP '[aeiouAEIOU]$';  

Q17: SELECT * FROM 
			 (SELECT s.product_id, p.product_name, MAX(sale_date) AS sale_date FROM product AS p INNER JOIN sales AS s 
					 ON p.product_id=s.product_id
					 GROUP BY s.product_id, p.product_name)ds1
	 WHERE EXTRACT(quarter FROM sale_date) <= 3;

Q18: SELECT DISTINCT s.author_id FROM views s 
			JOIN views v 
			ON s.author_id=v.viewer_id
	 ORDER BY s.author_id;
	
Q19: SELECT (immediate_delivery/total_delivery)*100 FROM
			(SELECT COUNT(delivery_id) total_delivery,
			SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END) AS immediate_delivery 
	 FROM delivery)ds;

Q20: SELECT ad_id,COALESCE(ROUND((ad_total_clicks/(ad_total_clicks + ad_total_views)) *100,2),0) AS CTR FROM
			(SELECT ad_id
				   ,SUM(CASE WHEN lower(action) in ('clicked') then 1 else 0 END) AS ad_total_clicks
				   ,SUM(CASE WHEN lower(action) in ('viewed') then 1 else 0 END) AS ad_total_views
			FROM ads GROUP BY ad_id)ds
      ORDER BY CTR DESC ,ad_id ASC;

Q21: SELECT employee_id,count(team_id) OVER(PARTITION BY team_id ORDER BY team_id) AS Team_Size FROM Employee
     ORDER BY employee_id;

Q22: WITH avg_temperature AS
       (SELECT country_name, AVG(weather_state) AS average_weather 
         FROM countries c JOIN weather w 
         ON c.country_id = w.country_id
         WHERE EXTRACT(month from w.day)= 11
         GROUP BY country_name)
     SELECT country_name
         ,CASE WHEN round(average_weather) <= 15 THEN 'Cold'
               WHEN round(average_weather) >=25 THEN 'Hot'
               ELSE 'Warm'
          END AS weather_type
     FROM avg_temperature;

Q23: 

Q24: SELECT player_id,MIN(event_date) FROM activity GROUP BY player_id;

Q25: SELECT player_id,device_id FROM activity WHERE event_date in (SELECT MIN(event_date) FROM activity GROUP BY player_id);

Q26: WITH feb_orders AS(SELECT p.product_name,SUM(o.unit) AS total_unit FROM orders AS o 
						JOIN product AS p 
                       ON o.product_id=p.product_id
                   WHERE EXTRACT(month from o.order_date)=2 
                   GROUP BY p.product_name)
     SELECT * from feb_orders WHERE total_unit >=100;

Q27: SELECT * FROM users WHERE mail LIKE '%@leetcode.com%' AND mail REGEXP '^[a-zA-Z]' AND mail NOT REGEXP '[#]';

Q28: WITH monthly_spent AS (SELECT o.order_date,o.product_id,o.quantity,o.customer_id,p.price,c.name,
			    CASE WHEN EXTRACT(month from o.order_date)=6 then (p.price * o.quantity) END AS June_Spent ,
				CASE WHEN EXTRACT(month from o.order_date)=7 then (p.price * o.quantity) END AS July_Spent
			FROM orders AS o 
			JOIN  products AS p ON o.product_id=p.product_id
			JOIN customers AS c ON c.customer_id=o.customer_id
			WHERE EXTRACT(month from o.order_date) in (6,7) and o.customer_id=1)

     SELECT customer_id,name FROM
	(SELECT customer_id,name,sum(June_Spent) AS June_Spent,sum(July_Spent) AS July_Spent
	FROM monthly_spent group by customer_id,name)ds WHERE June_Spent >=100 and July_Spent>=100;

Q29: 

Q30:





