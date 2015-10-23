/* create the movie table*/
CREATE TABLE Movie(
       id INT NOT NULL,
       title VARCHAR(100) NOT NULL,
       year INT,
       rating VARCHAR(10),
       company VARCHAR(50) NOT NULL,
	/* id as PRIMARY KEY 1 id need to be unique and not NULL*/
       PRIMARY KEY(id),
	/*before 1896 there is not movie exits must less than current time*/
       CHECK(year>=1896 AND year <=2016))ENGINE = INNODB;

/*create the actor table*/
CREATE TABLE Actor(
       id INT NOT NULL,
       last VARCHAR(20) NOT NULL,
       first VARCHAR(20) NOT NULL,
       sex VARCHAR(6) NOT NULL,
       dob DATE NOT NULL,
       dod DATE,
	/* id as PRIMARY KEY 2 id need to be not NULL */
       PRIMARY KEY(id),
	/* CHECK the sex*/
       CHECK(sex='Famale' OR sex='Male'))ENGINE = INNODB;

/*create the director table*/
CREATE TABLE Director(
       id INT NOT NULL,
       last VARCHAR(20) NOT NULL,
       first VARCHAR(20) NOT NULL,
	/* must have dob */
       dob DATE NOT NULL,
       dod DATE,
	/* id as PRIMARY KEY2*/
       PRIMARY KEY(id))ENGINE = INNODB;
       

/*create the MovieGenre Table*/   
CREATE TABLE MovieGenre(
       mid INT NOT NULL,
       genre VARCHAR(20),
	/* foreign key 1*/
       FOREIGN KEY (mid) REFERENCES Movie(id))ENGINE=INNODB;

/*create the MovieDirector table*/
CREATE TABLE MovieDirector(
       mid INT NOT NULL,
       did INT NOT NULL,
	/* foreign key 2 and 3*/
       FOREIGN KEY (did) REFERENCES Director(id),
       FOREIGN KEY (mid) REFERENCES Movie(id))ENGINE=INNODB;

/*create the MovieActor table */
CREATE TABLE MovieActor(
       mid INT NOT NULL,
       aid INT NOT NULL,
       role VARCHAR(50),
	/* foreign key 4 and 5*/
       FOREIGN KEY (mid) REFERENCES Movie(id),
       FOREIGN KEY (aid) REFERENCES Actor(id))ENGINE=INNODB;

/*create the Review table*/
CREATE TABLE Review(
       name VARCHAR(20) DEFAULT NULL,
       time TIMESTAMP,
       mid INT NOT NULL,
       rating INT,
       comment VARCHAR(500),
	/* foreign key 6*/
       FOREIGN KEY(mid) REFERENCES Movie(id),
    /*the score should between 0-5*/
       CHECK (rating <=5 AND rating >=0 ))ENGINE=INNODB;

/*create the MaxPersonID table*/
CREATE TABLE MaxPersonID(
       id INT DEFAULT NULL,
       PRIMARY KEY(id),
       /* CHECK id>0 )*/
       CHECK (id>0))ENGINE = INNODB;
       
/*create the MaxMovieID table */
CREATE TABLE MaxMovieID(
       id INT DEFAULT NULL,
       PRIMARY KEY(id),
       CHECK (id>0))ENGINE = INNODB;
