DROP TABLE cloud;
DROP SEQUENCE cloudnumseq;
DROP SEQUENCE infoseq;

CREATE SEQUENCE cloudnumseq;
CREATE SEQUENCE infoseq;

CREATE TABLE cloud(
      
	  seq NUMBER NOT NULL,
      cloudnum NUMBER,
      username VARCHAR2(20) NOT NULL,
      cloudcomm VARCHAR2(300),
      content    CLOB,
      contentname VARCHAR2(500),
      clouddate DATE,
      cloudfolder VARCHAR2(500)
      
);

SELECT * FROM CLOUD;