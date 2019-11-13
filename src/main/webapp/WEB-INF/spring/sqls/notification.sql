DROP TABLE NOTIFICATION;

create table notification(
      username VARCHAR2(20) NOT NULL,
      friend VARCHAR2(300),
      allow  VARCHAR2(100) DEFAULT 'N'
)

SELECT * FROM notification;
