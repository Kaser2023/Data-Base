select database();
drop table tweets;

drop table `k_shop`.`m`;

DROP TABLE `k_shop`.`m`;

CREATE TABLE tweets (
    username VARCHAR(15) NOT NULL,
    tweet_content VARCHAR(140),
    N_favorites int
);

show tables;

describe tweets;

describe m;
desc tweets;

show columns from tweets;

INSERT INTO tweets (username, tweet_content, N_favorites) VALUES ('Abdullah', 'Kaser is using DB',  5);

select * from tweets;

INSERT INTO tweets (username, N_favorites) VALUES ('nm',  2);

delete  from tweets  WHERE  username = 'nm';








