COMMIT;

-- Q1
SELECT *
FROM 
productlist;

ALTER TABLE
productlist
ADD
(price number(5,2)
, description VARCHAR2(250));

SELECT *
FROM
productlist;

UPDATE
productlist
SET 
price = 
(SELECT
price
FROM 
storefront
WHERE 
storefront.productcode = productlist.productcode);

UPDATE
productlist
SET 
description = 
(SELECT
description
FROM 
storefront
WHERE 
storefront.description = productlist.description);

SELECT *
FROM
productlist;

DROP TABLE
storefront;

COMMIT;

-- Q2
CREATE TABLE chatlog 
(chat_id number(3) 
,receiver_id number(3)
,sender_id number(3)
,date_sent date
,content VARCHAR2(250));

ALTER TABLE chatlog
ADD CONSTRAINT pk_chatlog
PRIMARY KEY (chat_id);

ALTER TABLE chatlog
ADD CONSTRAINT fk_receiverid
FOREIGN KEY (receiver_id) REFERENCES userbase(userid);

ALTER TABLE chatlog
ADD CONSTRAINT fk_senderid
FOREIGN KEY (sender_id) REFERENCES userbase(userid);

INSERT INTO CHATLOG 
VALUES (1, 101, 102, '07-01-2025', 'Do you know what they call a Quarter Pounder with Cheese in France?');
INSERT INTO CHATLOG 
VALUES (2, 102, 101, '07-01-2025', 'No.');
INSERT INTO CHATLOG 
VALUES (3, 101, 103, '07-01-2025', 'Tell him Vincent.');
INSERT INTO CHATLOG 
VALUES (4, 103, 102, '07-01-2025', 'Royale with Cheese.');
INSERT INTO CHATLOG 
VALUES (5, 101, 102, '07-01-2025', 'You know why they call it that?');
INSERT INTO CHATLOG 
VALUES (6, 102, 101, '07-01-2025', 'Uh, because of the metric system?');
INSERT INTO CHATLOG 
VALUES (7, 101, 103, '07-01-2025', 'Check out the big brain on Bret!');
INSERT INTO CHATLOG 
VALUES (8, 101, 102, '07-01-2025', 'You''re a smart MF, that''s right, the metric system.');
INSERT INTO CHATLOG 
VALUES (9, 101, 102, '07-01-2025', 'What''s in this?');
INSERT INTO CHATLOG 
VALUES (10, 102, 101, '07-01-2025', 'Sprite.');
INSERT INTO CHATLOG 
VALUES (11, 101, 102, '07-01-2025', 'Sprite, good.');
INSERT INTO CHATLOG 
VALUES (12, 101, 102, '07-01-2025', 'You mind if I have some of your tasty beverage to wash this down?');
INSERT INTO CHATLOG 
VALUES (13, 102, 101, '07-01-2025', 'Go right ahead.');
INSERT INTO CHATLOG 
VALUES (14, 101, 102, '07-01-2025', 'AHHHH.');
INSERT INTO CHATLOG 
VALUES (15, 101, 102, '07-01-2025', 'That hit the spot!');

SELECT *
FROM 
chatlog;

COMMIT;

--Q3
CREATE TABLE friendslist
(user_id number(3)
, friend_id number(3));

ALTER TABLE friendslist
ADD CONSTRAINT pk_friendslist
PRIMARY KEY (user_id, friend_id); 

ALTER TABLE friendslist
ADD CONSTRAINT fk_userid
FOREIGN KEY (user_id) REFERENCES userbase(userid);

ALTER TABLE friendslist
ADD CONSTRAINT fk_friendid
FOREIGN KEY (friend_id) REFERENCES userbase(userid);

INSERT INTO friendslist (user_id, friend_id) VALUES (101, 115);
INSERT INTO friendslist (user_id, friend_id) VALUES (102, 114);
INSERT INTO friendslist (user_id, friend_id) VALUES (103, 113);
INSERT INTO friendslist (user_id, friend_id) VALUES (104, 112);
INSERT INTO friendslist (user_id, friend_id) VALUES (105, 111);
INSERT INTO friendslist (user_id, friend_id) VALUES (106, 110);
INSERT INTO friendslist (user_id, friend_id) VALUES (107, 109);
INSERT INTO friendslist (user_id, friend_id) VALUES (108, 101);
INSERT INTO friendslist (user_id, friend_id) VALUES (109, 107);
INSERT INTO friendslist (user_id, friend_id) VALUES (110, 106);
INSERT INTO friendslist (user_id, friend_id) VALUES (111, 105);
INSERT INTO friendslist (user_id, friend_id) VALUES (112, 104);
INSERT INTO friendslist (user_id, friend_id) VALUES (113, 103);
INSERT INTO friendslist (user_id, friend_id) VALUES (114, 102);
INSERT INTO friendslist (user_id, friend_id) VALUES (115, 101);

SELECT *
FROM
friendslist;

COMMIT;

--Q4
CREATE TABLE wishlist
(userid number(3)
, productcode VARCHAR2(5)
, position number(3));

ALTER TABLE wishlist
ADD CONSTRAINT pk_wishlist
PRIMARY KEY (userid, productcode);

ALTER TABLE wishlist
ADD CONSTRAINT fk_wluid
FOREIGN KEY (userid) REFERENCES userbase(userid);

ALTER TABLE wishlist
ADD CONSTRAINT fk_productcode
FOREIGN KEY (productcode) REFERENCES productlist(productcode);

INSERT INTO wishlist (userid, productcode, position) VALUES (101, 'GAME1', 1);
INSERT INTO wishlist (userid, productcode, position) VALUES (102, 'GAME2', 2);
INSERT INTO wishlist (userid, productcode, position) VALUES (103, 'GAME3', 2);
INSERT INTO wishlist (userid, productcode, position) VALUES (104, 'GAME4', 3);
INSERT INTO wishlist (userid, productcode, position) VALUES (105, 'GAME5', 10);
INSERT INTO wishlist (userid, productcode, position) VALUES (106, 'GAME6', 113);
INSERT INTO wishlist (userid, productcode, position) VALUES (107, 'GAME7', 101);
INSERT INTO wishlist (userid, productcode, position) VALUES (108, 'GAME8', 99);
INSERT INTO wishlist (userid, productcode, position) VALUES (109, 'GAME9', 424);
INSERT INTO wishlist (userid, productcode, position) VALUES (110, 'RPG10', 999);
INSERT INTO wishlist (userid, productcode, position) VALUES (111, 'PZL11', 000);
INSERT INTO wishlist (userid, productcode, position) VALUES (112, 'GME12', 032);
INSERT INTO wishlist (userid, productcode, position) VALUES (113, 'GME13', 57);
INSERT INTO wishlist (userid, productcode, position) VALUES (114, 'VNL14', 19);
INSERT INTO wishlist (userid, productcode, position) VALUES (115, 'GME15', 12);

SELECT *
FROM 
wishlist;

COMMIT;

--Q5
CREATE TABLE userprofile
(userid number(3) PRIMARY KEY
, imagefile VARCHAR2(250)
, description VARCHAR2(250));

ALTER TABLE userprofile 
ADD CONSTRAINT fk_upuid
FOREIGN KEY (userid) REFERENCES userbase(userid);

INSERT INTO userprofile (userid, imagefile, description) VALUES 
(101, 'https://images.app.goo.gl/juWaw7w9Wf8zXFdQA', 'I am Naruto Uzamaki, the Nine Tails Jinchuriki and the Seventh Hokage of the Hidden Leaf Village.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(102, 'https://images.app.goo.gl/GF6dCPBZqgvxo9Hr9', 'I am Hatake Kakashi, The Copy Ninja and the Sixth Hokage of the Hidden Leaf Village.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(103, 'https://images.app.goo.gl/EM1Cz1F1D5fgCLLD6', 'My name is Barry Allen and I am the fastest man alive.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(104, 'https://images.app.goo.gl/Te5nSG24hJxmXyqA8', 'My name is Carmen Sandiego. I am a world class thief. Catch me if you can.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(105, 'https://images.app.goo.gl/9Ths4pgcfyZARQca9', 'My name is Satoru Gojo, the most powerful Jijutsu Sorceror there is.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(106, 'https://images.app.goo.gl/oG8n5ep5tGDkEQD76', 'I am Urahara Kisuke, the former Captain of the Twelvth Squad and master scientist.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(107, 'https://images.app.goo.gl/J6aUGJURLkET8tnV6', 'My name is Tintin, a multitalented world class reporter created by Hergé');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(108, 'https://images.app.goo.gl/Tn9TvMLGeArSj1Qa7', 'My name is Peter Parker, I was bitten by a radioactive spider and now I am Spider-Man. Arguablly the greatest superhero ever.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(109, 'https://images.app.goo.gl/CyuedqaGjxsJN9Rw8', 'My name is Izuku Midoriya, I was born without a quirk but was given powers by All Might.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(110, 'https://images.app.goo.gl/Z1qaKTh9hrMi8Ggw9', 'My name is Tanjiro Kamado, my family was killed by a demon and I have become a Demon Slayer to get vengeance and turn my sister back into a human.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(111, 'https://images.app.goo.gl/XkguWeUCGet7fhG76', 'I am Wade Wilson, The Merc With The Mouth.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(112, 'https://images.app.goo.gl/NF7WPZsP3oyP9PHU8', 'I hit my head on the toilet and that''s when I had the idea for the Flux Capacitor, it''s what makes time travel possible.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(113, 'https://images.app.goo.gl/wMm2v4ciuLLV5CN27', 'I am The Doctor.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(114, 'https://images.app.goo.gl/LC8n41GG5gD4xf7BA', 'We are the crew of the Bebop and Space Cowboys.');
INSERT INTO userprofile (userid, imagefile, description) VALUES 
(115, 'https://images.app.goo.gl/YQo9k2X3XS3tA8gd8', 'I am Hisuian Zorua, the newest debuted Pokemon in Pokemon Go. Like Carmen, catch me if you can.');

SELECT *
FROM 
userprofile;

COMMIT;

--Q6
CREATE TABLE securityquestion
(questionid number(3) PRIMARY KEY
, userid number(3)
, question VARCHAR2(250)
, answer VARCHAR2(250));

ALTER TABLE securityquestion
ADD CONSTRAINT fk_secqid
FOREIGN KEY (userid) REFERENCES userbase(userid);

INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(01, 101, 'What is your mother''s maiden name?', 'Constance');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(02, 102, 'What state does your best friend currently live in?', 'Alabama');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(03, 103, 'In what city did you meet your spouse?', 'Carthage');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(04, 104, 'What was the make and model of your first car?', 'DodgeCharger');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(05, 105, 'What is your favorite foreign country?', 'Bolivia');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(06, 106, 'What is your dream profession?', 'Chef');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(07, 107, 'What was the first concert you attended?', 'Dixie Chix');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(08, 108, 'Who is your favorite fictional character?', 'Memnoch the Devil');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(09, 109, 'Who is your favorite historical icon?', 'Jack the Ripper');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(10, 110, 'What is your favorite genre of music?', 'Rebel Country');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(11, 111, 'What is a pet peeve of yours?', 'Flies I Hate Flies!!!');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(12, 112, 'What is the title of your favorite book?', 'Des Neute Arm Des Oktopus');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(13, 113, 'What is the name of your first pet?', 'Aluisious');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(14, 114, 'What was the name of your favorite teacher?', 'Mrs. Paul');
INSERT INTO securityquestion (questionid, userid, question, answer) VALUES
(15, 115, 'What was your favorite subject in school?', 'Nap Time');

SELECT *
FROM 
securityquestion;

COMMIT;

--Q7
CREATE TABLE communityrules
(rulenum number(3) PRIMARY KEY
, title VARCHAR2(250)
, description VARCHAR2(250)
, severitypoint number(4));

INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(01, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(02, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(03, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(04, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(05, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(06, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(07, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(08, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(09, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(10, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(11, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(12, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(13, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(14, 'TBD', 'TBD', 10);
INSERT INTO communityrules (rulenum, title, description, severitypoint) VALUES
(15, 'TBD', 'TBD', 10);

SELECT *
FROM 
communityrules;

COMMIT;

--Q8
CREATE TABLE infractions
(infractionid number(3)
, userid number(3)
, rulenum number(3)
, dateassigned date
, penalty VARCHAR2(250));

ALTER TABLE infractions
ADD CONSTRAINT fk_infuid
FOREIGN KEY (userid) REFERENCES userbase(userid);

ALTER TABLE infractions
ADD CONSTRAINT fk_rulenum
FOREIGN KEY (rulenum) REFERENCES communityrules(rulenum);

INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(01, 101, 01, '07-01-2025', '5 minutes in the penalty box.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(02, 102, 15, '07-01-2025', '1000 cuts by Angel Blade.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(03, 103, 13, '07-01-2025', 'Fight through the game of death with Bruce Lee.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(04, 104, 14, '07-01-2025', 'Get locked in the dungeon from Maniac Mansion.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(05, 105, 12, '07-01-2025', 'Play Zork.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(06, 106, 09, '07-01-2025', 'You have died from dysentery on the Oregon Trail.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(07, 107, 11, '07-01-2025', 'Go to jail, go directly to jail, do not pass GO do not collect $200.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(08, 108, 07, '07-01-2025', 'If you leave your game, stay safe, stay alert, and whatever you do, don''t die. Because if you die outside your own game, you don''t regenerate, ever. Game Over.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(09, 109, 05, '07-01-2025', 'You are entrapped in the Prison Realm.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(10, 110, 08, '07-01-2025', 'You will train with Goku and Vegeta on Beerus'' planet.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(11, 111, 06, '07-01-2025', 'You have been sent to Hueco Mundo.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(12, 112, 02, '07-01-2025', 'You have been cast out of Alexandria and killed by Neegan with Lucile.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(13, 113, 03, '07-01-2025', 'You have been caught by the Navy and locked in Marine Forge.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(14, 114, 04, '07-01-2025', 'Turbo Granny has taken your mojo.');
INSERT INTO infractions (infractionid, userid, rulenum, dateassigned, penalty) VALUES
(15, 115, 10, '07-01-2025', 'You have to fight Saitama');

SELECT *
FROM
infractions;
 
COMMIT;

--Q9
CREATE TABLE usersupport
(ticketid number(12) PRIMARY KEY
, email VARCHAR2(250)
, issue VARCHAR2(250)
, datesubmitted date
, dateupdated date
, status VARCHAR2(250));

INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110001, 'saitama@shonenjump.com', 'I keep defeating all of my opponents in one punch.', '07-11-2025', '07-11-2025', 'In Progress: Looking for stronger opponents');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110002, 'jack.sparrow@blackpearl.com', 'They keep stealing my ship.', '07-11-2025', '07-11-2025', 'In Progress: Theft claim filed with AllState');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110003, 'enzomatrix@reboot.com', 'Dot is always treating me like a kid and won''t let me do anything dangerous with Bob.', '07-11-2025', '07-11-2025', 'Closed: Dot is your big sister, get over it.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110004, 'waldo@theworld.com', 'I ball so hard MFs try to fid me.', '07-11-2025', '07-11-2025', 'Closed: Sounds like a non-issue. Enjoy the good life.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110005, 'Dean.Winchester@supernatural.com', 'Sam is missing his soul.', '07-11-2025', '07-11-2025', 'Closed: Ooooo this is a little out of our league. May we suggest making a deal with Crowley.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110006, 'wade.wilson@deadpool.com', 'I keep getting blood stains in my clothes.', '07-11-2025', '07-11-2025', 'Pending: Waiting for suit. You should make your super suit red.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110007, 'carmen.sandiego@whereintheworld.com', 'The Tigress beat me to a heist.', '07-11-2025', '07-11-2025', 'Closed: The ACME Detective Agency suggests you retire.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110008, 'sheldon.cooper@caltech.com', 'I don''t understand sarcasm.', '07-11-2025', '07-11-2025', 'In Progress: Sending episodes of Family Guy.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110009, 'bruce.nolan@WKBW.com', 'I can''t make Grace love me.', '07-11-2025', '07-11-2025', 'Closed: Morgan told you that you can''t mess with free will.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110010, 'buddy.valastro@cakeboss.com', 'Someone screwed up the Canollis.', '07-11-2025', '07-11-2025', 'Pending: Open up Carlo''s Bakery late.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110011, 'jesse.montgomery@wheresmycar.com', 'I can''t read my new tattoo.', '07-11-2025', '07-11-2025', 'Closed: WHAT DOES MINE SAY!?!?!?!?');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110012, 'damien.harmon@disgruntledreader.com', 'George R.R. Martin will not finish the last F#%&ing book in the Game of Thrones series', '07-11-2025', '07-11-2025', 'Closed: We don''t know what to tell you we are just as aggravated.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110013, 'spike.spiegel@bebop.com', 'There is no beef in the Beef and Bell Peppers.', '07-11-2025', '07-11-2025', 'Closed: Catach more bounties to get more money for Jet to buy groceries.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110014, 'din.djarin@mandalorian.com', 'I am now in possession of a foundling. What do I do?', '07-11-2025', '07-11-2025', 'Closed: Raise it as one of the guild. This is the way.');
INSERT INTO usersupport (ticketid, email, issue, datesubmitted, dateupdated, status) VALUES
(202507110015, 'stringer.bell@thewire.com', 'Someone is selling on my turf. This is unacceptable.', '07-11-2025', '07-11-2025', 'Closed: Yo! Omar coming!!!');

SELECT *
FROM
usersupport;
 
 COMMIT;

--Q10
CREATE VIEW uniquequestions_view AS
SELECT DISTINCT question
FROM
securityquestion;

CREATE VIEW statusupdates_view AS
SELECT ticketid
, email
, issue
, dateupdated
FROM 
usersupport
WHERE 
(status LIKE '%In Progress: %') OR (status LIKE '%New: %');

SELECT *
FROM
uniquequestions_view;

SELECT *
FROM
statusupdates_view;

COMMIT;