DROP TABLE board;

CREATE TABLE `board` (
  `board_num` bigint(20) NOT NULL AUTO_INCREMENT,
  `board_title` varchar(25) NOT NULL,
  `board_gubun` varchar(1) DEFAULT NULL COMMENT '1 : board, 2 : reply',
  `board_pnum` bigint(20) DEFAULT '-1' COMMENT 'Parent Board Number : Only Have Reply(gubun = ''''2'''')',
  `board_contn` longtext,
  `board_htcnt` int(9) DEFAULT '0' COMMENT 'Board Hit(Read) Count',
  `board_usrid` varchar(20) DEFAULT NULL COMMENT 'Board Make User : Modify Only CUser',
  `board_cdate` varchar(8) DEFAULT NULL COMMENT 'Board Create Date',
  `board_priva` varchar(1) DEFAULT NULL COMMENT 'Private Mode : 1, Default Mode : 2',
  `board_mdate` varchar(8) DEFAULT NULL COMMENT 'Board Modify Date',
  `board_prpwd` varchar(20) DEFAULT NULL COMMENT 'Private Mode Password',
  `board_ctcnt` int(5) DEFAULT NULL COMMENT 'Comment Count',
  `board_rpcnt` int(5) DEFAULT NULL COMMENT 'Board Reply Count',
  PRIMARY KEY (`board_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;