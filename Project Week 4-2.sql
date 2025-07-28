SELECT userid
, min(rating) AS lowest_rating
FROM reviews
GROUP BY userid;

SELECT
a.email
, b.question
, b.answer
FROM
usersupport a
, securityquestion b
WHERE
a.userid = b.userid;

SELECT
firstname
, email
, walletfunds
FROM
wishlist a
, userbase b
WHERE
productcode IS NULL;

SELECT
a.username
,count(b.productcode) AS number_of_products_ordered
FROM
userbase a
, orders b
GROUP BY
a.username
ORDER BY
a.username;

SELECT
a.userid
, TRUNC(MONTHS_BETWEEN(SYSDATE, a.birthday) / 12) AS AGE
FROM
userbase a,
orders b
WHERE 
a.userid = b.userid
AND
b.purchasedate >= add_months(sysdate, -6)
GROUP BY
a.userid, a.birthday
ORDER BY
a.userid;

SELECT username
, BIRTHDAY
FROM 
userbase
WHERE 
userid = (SELECT 
userid
FROM 
(SELECT userid, count(*) AS friend_count
FROM
friendslist
GROUP BY
userid
ORDER BY
friend_count DESC)
WHERE 
ROWNUM = 1);

SELECT a.productname
, a.releasedate
, a.price
, a.description
FROM productlist a
JOIN wishlist b ON a.productcode = b.productcode;

SELECT a.productname
, max(b.rating) AS highest_rating
,count(b.userid) AS number_of_reviews
FROM productlist a
JOIN reviews b ON a.productcode = b.productcode
GROUP BY a.productname
ORDER BY highest_rating DESC;

CREATE VIEW min_max_rating_view AS
SELECT a.productname
, a.genre
, b.rating
FROM productlist a
JOIN reviews b ON a.productcode = b.productcode
WHERE b.rating IN (1, 5)
ORDER BY b.rating ASC;

SELECT a.genre
, count(b.orderid) AS num_orders
FROM orders b
JOIN productlist a ON b.productcode = a.productcode
GROUP BY a.genre
ORDER BY a.genre;

CREATE VIEW publisher_stats_view AS
SELECT a.publisher
, avg(a.price) AS avg_price
, sum(b.hoursplayed) AS total_hours
FROM productlist a
, userlibrary b
GROUP BY a.publisher;

SELECT a.publisher 
, sum(b.price) AS total_spent
FROM productlist a 
JOIN orders b ON b.productcode = a.productcode
GROUP BY a.publisher
ORDER BY total_spent DESC;

SELECT a.ticketid
, b.username
, b.email
, a.issue
FROM usersupport a
JOIN userbase b ON a.userid = b.userid
WHERE a.status IN (LIKE '%NEW%', '%IN PROGRESS%')
ORDER BY a.dateupdated DESC;

SELECT 
a.username
, count(b.ticketid) AS ticket_count
FROM userbase a
JOIN usersupport b ON a.userid = b.userid
GROUP BY a.username;

SELECT DISTINCT a.userid
, a.email
FROM userbase a
JOIN usersupport b ON a.userid = b.userid
WHERE upper(a.email) LIKE '%' || upper(a.firstname) || '%'
OR upper(a.email) LIKE '%' || upper(a.lastname) || '%'
OR upper(a.email) LIKE '%' || upper(a.firstname || a.lastname) || '%';

SELECT DISTINCT a.email
FROM usersupport a
WHERE a.status IN ('%NEW%', '%IN PROGRESS%')
AND NOT EXISTS (
SELECT 1 FROM userbase b WHERE b.email = a.email);

SELECT a.ticketid
, b.firstname
, b.lastname
, b.username
FROM usersupport a
JOIN userbase b ON a.userid = b.userid
WHERE upper(a.issue) LIKE '%' || upper(b.username) || '%';

SELECT a.username
, a.password
FROM userbase a
JOIN usersupport b ON a.email = b.email;

CREATE VIEW recent_penalties_view AS
SELECT a.username
, b.dateassigned
, b.penalty
FROM infractions b
JOIN userbase a ON b.userid = a.userid
WHERE b.penalty IS NOT NULL
AND b.dateassigned >= add_months(sysdate, -1);

SELECT a.username
, a.email
FROM userbase a
WHERE trunc(months_between(sysdate, a.birthday) / 12) >= 18
AND NOT EXISTS (SELECT 1 FROM infractions b
WHERE b.userid = a.userid
AND b.dateassigned >= add_months(sysdate, -4));

SELECT a.username
, b.dateassigned
, c.rulenum || ' ' || c.title AS rule_details
FROM infractions b
JOIN userbase a ON b.userid = a.userid
JOIN RULES c ON b.rulenum = c.rulenum;

SELECT
a.userid
, a.username
, a.email
, sum(b.severitypoint) AS accum_points
FROM
userbase a
JOIN infractions c ON a.userid = c.userid
JOIN communityrules b ON c.rulenum = b.rulenum
GROUP BY
a.userid
, a.username
, a.email
ORDER BY
accum_points DESC;

SELECT a.title
, a.description
, b.penalty
FROM infractions b
JOIN communityrules a ON b.rulenum = a.rulenum;

SELECT a.username, count(*) AS number_of_infractions
FROM userbase a
JOIN infractions b ON a.userid = b.userid
GROUP BY a.username
HAVING count(*) >= 15;
