
use triggers;

show tables;



CREATE TABLE users (
    username VARCHAR(255),
    age INT
);


INSERT INTO users (username, age) VALUES ('John', 25);
INSERT INTO users (username, age) VALUES ('koho',  15);


SELECT * from users;


-- TRIGGERS

DELIMITER $$
CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$
DELIMITER ;



-- Try Inserting users whose age Less than 18

INSERT INTO users (username, age) VALUES ('Ma',  17);


