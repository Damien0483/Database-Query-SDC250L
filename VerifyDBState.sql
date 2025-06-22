COMMIT; -- Initiate Saving 

SELECT USER_ID -- Display users that have access to ORACLE APEX
, USERNAME
, CREATED
, PASSWORD_CHANGE_DATE
FROM 
USER_USERS;

SELECT *  -- Display all fields of all tables 
FROM USER_TABLES;

DESC ORDERS; -- Describe the layout of the ORDERS table
DESC USERLIBRARY; -- Describe the layout of the USERLIBRARY table
DESC USERBASE; -- Describe the layout of the USERBASE table
DESC REVIEWS; -- Describe the layout of the REVIEWS table
DESC STOREFRONT; -- Describe the layout of the STOREFRONT table
DESC PRODUCTLIST; -- Describe the layout of the PRODUCTLIST table

SELECT * -- Display all fields of ORDERS table
FROM ORDERS;

SELECT * -- Display all fields of PRODUCTLIST table
FROM PRODUCTLIST;

SELECT * -- Display all fields of REVIEWS table
FROM REVIEWS;

SELECT * -- Display all fields of STOREFRONT table
FROM STOREFRONT;

SELECT * -- Display all fields of USERBASE table
FROM USERBASE;

SELECT * -- Display all fields of USERLIBRARY table
FROM USERLIBRARY;

SELECT -- Displaying contraint details
TABLE_NAME
, CONSTRAINT_NAME
, CONSTRAINT_TYPE
, STATUS
FROM 
USER_CONSTRAINTS;

SELECT -- Display user view information 
VIEW_NAME
, TEXT
FROM 
USER_VIEWS;

SELECT -- Display all users by username in ascending order
USERNAME
FROM 
USERBASE
ORDER BY
USERNAME ASC;

SELECT -- Displaying all users with a yahoo email account
FIRSTNAME
, LASTNAME
, USERNAME
, PASSWORD
, EMAIL
FROM
USERBASE
WHERE EMAIL LIKE '%@yahoo.com';

SELECT -- Displaying users with a balance of less than $25 
USERNAME
, BIRTHDAY
, WALLETFUNDS
FROM
USERBASE
WHERE WALLETFUNDS < 25;

SELECT -- Display users who have played mored than 100 hours and the product
USERID
, PRODUCTCODE
FROM 
USERLIBRARY
WHERE HOURSPLAYED > 100;

SELECT -- Displaying users who have played less than 10 hours and the product
PRODUCTCODE
FROM
USERLIBRARY
WHERE HOURSPLAYED < 10;

SELECT DISTINCT -- Showing all unique publishers no duplicate entries
PUBLISHER
FROM 
PRODUCTLIST;

SELECT -- Displaying product information by genre 
PRODUCTNAME
, RELEASEDATE
, PUBLISHER
,GENRE
FROM
PRODUCTLIST
ORDER BY 
GENRE;

SELECT -- Displaying only strategy genre games
PRODUCTNAME
, PUBLISHER
FROM
PRODUCTLIST
WHERE GENRE LIKE 'Strategy';

SELECT -- Displaying all games that cost more than $25 and sorting by descending price
PRODUCTCODE
, DESCRIPTION
, PRICE
FROM 
STOREFRONT
WHERE 
PRICE > 25
ORDER BY PRICE DESC;

SELECT -- Displaying items in inventory and sorting by ascending price
INVENTORYID
, PRICE
FROM
STOREFRONT
ORDER BY PRICE ASC;

SELECT -- Displaying products by code and displaying reviews with a rating of 1
PRODUCTCODE
, REVIEW
FROM
REVIEWS
WHERE RATING = 1;

SELECT -- Displaying products by code and displaying reviews with a rating of 4 or greater
PRODUCTCODE
, REVIEW
FROM
REVIEWS
WHERE RATING >= 4;

SELECT DISTINCT -- Displaying all users with orders with no duplicate entries
USERID
FROM 
ORDERS;

SELECT * -- Displaying all fields in the ORDERS table and sorting by ascending purchase date
FROM 
ORDERS
ORDER BY 
PURCHASEDATE ASC;

COMMIT; -- Initiating save
