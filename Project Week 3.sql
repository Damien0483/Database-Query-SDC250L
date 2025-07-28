ALTER TABLE orders
ADD CONSTRAINT fk_orders_uid
FOREIGN KEY (userid) REFERENCES userprofile(userid);

ALTER TABLE reviews
ADD CONSTRAINT fk_rev_uid
FOREIGN KEY (useid) REFERENCES userprofile(userid);

ALTER TABLE userlibrary
ADD CONSTRAINT fk_userlib_uid
FOREIGN KEY (userid) REFERENCES userprofile(userid);

COMMIT;

SELECT 
firstname|| ' ' || lastname AS full_name
FROM 
userbase
WHERE
add_months(birthday, 12 * 18) <= sysdate;

COMMIT;

SELECT max(length(username)) AS max_length
FROM userbase;

SELECT avg(length(username)) AS average_length
FROM userbase;

SELECT question
FROM securityquestion
WHERE question LIKE 'What is%' OR question LIKE 'What was%';

SELECT
productcode,
min(rating) AS lowest_rating,
count(*) AS review_numbers
FROM
reviews
GROUP BY
productcode
ORDER BY
review_numbers DESC;

SELECT
productcode
,count(DISTINCT userid) AS number_of_users
FROM
wishlist
WHERE
position = 1
GROUP BY
productcode;

SELECT
userid,
sum(price) AS total_spent
FROM
orders
GROUP BY
userid
ORDER BY
userid;

SELECT
purchasedate,
sum(price) AS total_profit
FROM
orders
GROUP BY
purchasedate
ORDER BY
total_profit DESC;

SELECT 
productcode
,sum(hoursplayed) AS total_hours_played
FROM
userlibrary
GROUP BY
productcode
ORDER BY
total_hours_played DESC 
FETCH FIRST 5 ROWS ONLY;

CREATE VIEW user_infraction_counts AS
SELECT
userid
, count(infractionid) AS infraction_count
FROM
infractions
GROUP BY
userid
ORDER BY
infraction_count DESC;

CREATE VIEW user_rule_infractions AS
SELECT
userid
, rulenum
, count(*) AS infraction_count
FROM
infractions
GROUP BY
userid
, rulenum
ORDER BY
userid;

SELECT
rulenum
, penalty
, count(*) AS penalty_count
FROM
infractions
GROUP BY
rulenum
, penalty
ORDER BY
rulenum
, penalty;

SELECT
avg((dateupdated - datesubmitted) * 24) AS avg_time
, max((dateupdated - datesubmitted) * 24) AS max_time
, min((dateupdated - datesubmitted) * 24) AS min_time
FROM
usersupport
WHERE
upper(status) LIKE 'CLOSED: %';

SELECT
email
, issue
, count(issue) AS issue_count
FROM
usersupport
WHERE
upper(status) = 'NEW'
GROUP BY
datesubmitted
, email
, issue
ORDER BY
issue_count DESC;

SELECT
publisher,
avg(price) AS average_price
FROM
productlist
GROUP BY
publisher
ORDER BY
publisher ASC;

CREATE VIEW  product_list_discounted_view  AS
SELECT
productname,
price * 0.75  AS  discounted_price
FROM
productlist
WHERE
releasedate  <  add_months(sysdate, - 60);

SELECT
genre
, min(price) AS min_price
, max(price) AS max_price
FROM
productlist
GROUP BY
genre
ORDER BY
genre;

CREATE VIEW chatlog_prev_week AS
SELECT *
FROM 
chatlog
WHERE date_sent BETWEEN TRUNC(SYSDATE - 7) AND TRUNC(SYSDATE);

CREATE VIEW current_infractions AS
SELECT
userid
, dateassigned
, penalty
FROM
infractions
WHERE
penalty IS NOT NULL
AND dateassigned >= add_months(trunc(sysdate), -1);

COMMIT;