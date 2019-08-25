use alpaca;

CREATE TABLE member (
    memberid VARCHAR(100) PRIMARY KEY,
    memberpassword VARCHAR(100) NOT NULL,
    membername VARCHAR(100) NOT NULL,
    membergender VARCHAR(100) NOT NULL,
    memberbirthday VARCHAR(100) NOT NULL,
    memberemail VARCHAR(100) NOT NULL,
    membertel VARCHAR(100) NOT NULL,
    memberregister DATETIME NOT NULL DEFAULT NOW(),
    membermanager INT(1) NOT NULL DEFAULT 0
);

select * from member;