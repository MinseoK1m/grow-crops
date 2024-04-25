CREATE TABLE board (
  board_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  author VARCHAR(50),
  content TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) DEFAULT CHARSET=utf8;


select * from board;


desc board;
drop table board;
