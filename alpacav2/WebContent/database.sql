use alpaca;

CREATE TABLE member (
    memberid VARCHAR(100) PRIMARY KEY,
    memberpassword VARCHAR(100) NOT NULL,
    membername VARCHAR(100) NOT NULL,
    membergender VARCHAR(100) NOT NULL,
    memberbirthday INT(10) NOT NULL,
    memberemail VARCHAR(100) NOT NULL,
    membertel INT(10) NOT NULL,
    memberregister DATETIME NOT NULL DEFAULT NOW(),
    membermanager INT(1) NOT NULL DEFAULT 0
);

select * from member;

CREATE TABLE board (
    boardnumber INT(10) PRIMARY KEY AUTO_INCREMENT,
    boardtitle VARCHAR(150) NOT NULL,
    boardcontents VARCHAR(1500) NOT NULL,
    boardwriter VARCHAR(100) NOT NULL,
    boardregister DATETIME NOT NULL DEFAULT NOW(),
    boardhits INT(10) NOT NULL DEFAULT 0,
    boardrecommend INT(10) NOT NULL DEFAULT 0
);

select * from board;

CREATE TABLE comment (
    boardnumber INT(10) NOT NULL,
    commentnumber INT(10) PRIMARY KEY AUTO_INCREMENT,
    commentparent INT(10) NOT NULL DEFAULT 0,
    commentchild INT(10) NOT NULL DEFAULT 0,
    commentcontents VARCHAR(300) NOT NULL,
    commentwriter VARCHAR(100) NOT NULL,
    commentregister DATETIME NOT NULL DEFAULT NOW()
);

select * from comment;