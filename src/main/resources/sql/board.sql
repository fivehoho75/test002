CREATE TABLE `myDb`.`TB_BOARD` (
  `IDX` INT NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `PARENT_IDX` INT NULL COMMENT '부모글 인덱스',
  `TITLE` VARCHAR(100) NULL COMMENT '제목',
  `CONTENTS` VARCHAR(4000) NULL COMMENT '내용',
  `HIT_CNT` INT NOT NULL DEFAULT 0 COMMENT '조회수',
  `DEL_GB` VARCHAR(1) NOT NULL DEFAULT 'N' COMMENT '삭제구분',
  `CREA_DTM` DATETIME NOT NULL DEFAULT now() COMMENT '생성일자',
  `CREA_ID` VARCHAR(30) NOT NULL COMMENT '생성자 I',
  PRIMARY KEY (`IDX`)) DEFAULT CHARSET=utf8
COMMENT = '게시판';

CREATE TABLE `myDb`.`TB_FILE`
(
  `IDX` INT NOT NULL AUTO_INCREMENT,
  `BOARD_IDX` INT NOT NULL,
  `ORIGINAL_FILE_NAME` VARCHAR(260) NOT NULL,
  `STORED_FILE_NAME` VARCHAR(36) NOT NULL,
  `FILE_SIZE` INT NULL,
  `CREA_DTM`  DATETIME NOT NULL DEFAULT now(),
  `CREA_ID`   VARCHAR(30) NOT NULL,
  `DEL_GB`    VARCHAR(1) DEFAULT 'N' NOT NULL,
  PRIMARY KEY (`IDX`)) DEFAULT CHARSET=utf8
COMMENT = '파일';