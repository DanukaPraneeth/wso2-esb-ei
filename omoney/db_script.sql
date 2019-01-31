CREATE TABLE IF NOT EXISTS OMONEY_LOG (
             ORDER_ID  VARCHAR (25) NOT NULL UNIQUE,
             CURRENCY VARCHAR (10) NOT NULL,
             AMOUNT float(10,3) NOT NULL,
             LOGGED_TIME TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
             LANG VARCHAR (10) NOT NULL,
             REFERENCE VARCHAR (50) NOT NULL,
             STAUTS VARCHAR (10) DEFAULT 'PENDING',
             PAY_TOKEN VARCHAR (75),
             NOTIFY_TOKEN VARCHAR (75) UNIQUE,
             TXNID VARCHAR (50),
             PRIMARY KEY (ORDER_ID)
)ENGINE INNODB;
