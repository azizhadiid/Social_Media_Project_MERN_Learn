USE social;

CREATE TABLE `social`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `coverPic` VARCHAR(100) NULL,
  `profilePic` VARCHAR(100) NULL,
  `city` VARCHAR(45) NULL,
  `website` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);


CREATE TABLE `social`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `desc` VARCHAR(200) NULL,
  `img` VARCHAR(200) NULL,
  `userId` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `userId_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `social`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE `social`.`posts` 
DROP FOREIGN KEY `userId`;

ALTER TABLE `social`.`posts` 
ADD COLUMN `createdAt` DATETIME NULL AFTER `userId`,
CHANGE COLUMN `userId` `userId` INT NOT NULL;

ALTER TABLE `social`.`posts` 
ADD CONSTRAINT `userId`
  FOREIGN KEY (`userId`)
  REFERENCES `social`.`users` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

