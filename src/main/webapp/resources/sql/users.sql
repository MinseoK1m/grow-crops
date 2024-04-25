CREATE TABLE users (
  num INT AUTO_INCREMENT PRIMARY KEY,
  userid VARCHAR(10),
  password VARCHAR(20),
  username VARCHAR(10),
  phone VARCHAR(20),
  address VARCHAR(90),
  cropname VARCHAR(50),
  croptype VARCHAR(20),
  cropcond INT DEFAULT 0
) DEFAULT CHARSET=utf8;

select * from users;

DROP TABLE users;
