Cannot keep pay token, or order ID unique

CREATE TABLE IF NOT EXISTS OMONEY_LOG (
             ID  INTEGER NOT NULL AUTO_INCREMENT,          
	           ORDER_ID  VARCHAR (25) NOT NULL,
             CURRENCY VARCHAR (10) NOT NULL,
             AMOUNT float(10,3) NOT NULL,
             LOGGED_TIME TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
             LANG VARCHAR (10) NOT NULL,
             REFERENCE VARCHAR (50) NOT NULL,
             NOTIFY_URL VARCHAR (128) NOT NULL,
             STATUS VARCHAR (10) DEFAULT 'INITIATED',
             PAY_TOKEN VARCHAR (75),
             NOTIFY_TOKEN VARCHAR (75),
             TXNID VARCHAR (50),
             COUNTER INTEGER (2) UNSIGNED DEFAULT 0,
             HTTP_CODE VARCHAR (4),
             PAYLOAD VARCHAR (512) NOT NULL,
             PRIMARY KEY (ID , ORDER_ID)
);


CREATE TABLE IF NOT EXISTS OMONEY_KEYS (
	           ID  INTEGER NOT NULL AUTO_INCREMENT,
             ACCESS_TOKEN  VARCHAR (40) NOT NULL UNIQUE,
             STATUS VARCHAR (10) NOT NULL,
             EXPIRES_IN  VARCHAR (12) NOT NULL,
             LOGGED_TIME TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
             LOGGED_TIME_MS VARCHAR (20) NOT NULL,
             EXPIRE_TIME_MS VARCHAR (20) NOT NULL,
             PRIMARY KEY (ID)
);
