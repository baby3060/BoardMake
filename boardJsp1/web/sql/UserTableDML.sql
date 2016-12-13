CREATE TABLE board.user (
   user_id VARCHAR(20) NOT NULL,
   user_pass VARCHAR(20) NOT NULL,
   user_name VARCHAR(20),
   user_gender CHAR ASCII,
   user_last_login INT
) ENGINE = InnoDB ROW_FORMAT = DEFAULT;