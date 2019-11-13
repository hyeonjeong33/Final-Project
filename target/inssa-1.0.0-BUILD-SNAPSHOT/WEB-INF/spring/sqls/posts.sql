DROP TABLE POSTS;
DROP SEQUENCE BOARDNUMSEQ;

CREATE SEQUENCE BOARDNUMSEQ;

CREATE TABLE POSTS(
		boardnum	 INT,					--게시글 넘버
		username VARCHAR2(20) NOT NULL,		--사용자이름
		postcomm VARCHAR2(300),				--닉네임
		post_content	 CLOB,				--게시글내용
		post_thumbnail	CLOB,				--사진경로
		postdate DATE,						--썸네일
		hashtag varchar(500)				--작성일
);
	
SELECT * FROM POSTS;
