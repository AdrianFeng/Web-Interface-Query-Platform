/*
 *For 3 primary key and 6 foreign key constraints 
 */
DELETE FROM Actor WHERE id=3458;
/* first foreign key constraints*/
/*because MovieActor has references to actor so it can't be delete */
/*ERROR 1451 (23000) at line 1: Cannot delete or update a parent row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))*/

UPDATE Actor SET id=id+1 WHERE id=3458;
/*same As UPDATE */ 
/*ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))*/

INSERT INTO Actor VALUE(3458,'la','ha','Female','1977/4/4',NULL);
/*first primary key */
/*becaue they are same id in the table, since it is primary key, it can't be duplicate so it can't be insert*/
/*ERROR 1062 (23000): Duplicate entry '3458' for key 'PRIMARY'*/

DELETE FROM Movie WHERE id=4734;
/* for 2-5 foreign key */
/*because first table MovieGenre is references to movie id so it can't be delete*/
/* Also table MovieDirector,MovieActor,Review references to movie id*/
/* we only paste one error because the rest error it can't not show since first error appears*/
/* ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`CS143`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))*/

UPDATE Movie SET id=id+1 WHERE id=4734;
/* can't not update because other table references to it */
/*ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`CS143`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
*/

INSERT INTO Movie VALUE(4734,'la',1997,'5','SKY WANG');
/* second primary*/
/*can't not insert because is already exit id 4734 in the database */
/*ERROR 1062 (23000): Duplicate entry '4734' for key 'PRIMARY'*/

DELETE FROM Director WHERE id=68622;
/* 6th foreign key */
/*because movieDirector is references to Director so it can't be delete */ 
/*ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))*/

UPDATE Director SET id=id+1 WHERE id=68622;
/*ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))*/

INSERT INTO Director VALUE(68622,'wang','sky','1999-09-09',NULL);
/* 3rd primary key */
/*ERROR 1062 (23000): Duplicate entry '68622' for key 'PRIMARY'*/




/*
 *For 3 check constraint
 */
/*INSERT INTO Actor VALUE(70000,'la','ha','F','1977/4/4',NULL);*/
/*Can't not insert because CHECK sex='Female' OR sex='male', here sex =F*/
/*INSERT INTO Movie VALUE(70001,'la',100,'5','SKY WANG');*/
/*Can't not insert because CHECK year>1986 AND year <2016*/
/*INSERT INTO MaxMovieID VALUE(-1) */
/*can't not insert because check ID>0)*/
