/* all the actors in the movie 'Die Another Day'*/
SELECT CONCAT_WS(' ',first,last) AS ActorInTheMovie
FROM Actor 
WHERE id IN
	(SELECT aid 
	FROM MovieActor 
	WHERE mid IN
			(SELECT id 
			FROM Movie 
			WHERE title='Die Another Day'));
			
/* the count of all the actors who acted in multiple movies */
/*SELECT COUNT(DISTINCT one.aid) FROM MovieActor one, MovieActor two WHERE one.aid=two.aid AND one.mid!=two.mid;*/
SELECT COUNT(*) 
FROM (SELECT aid
      FROM MovieActor
      GROUP BY aid
      HAVING COUNT(mid)>1) newone;
      
      
/*This below will return the Directors' full name who is acting in his own movie*/
SELECT CONCAT_WS(' ',first,last) DirectorsPlayInHisOwnMovie
FROM Director
WHERE id IN (SELECT did
      	     FROM MovieDirector
	     	 WHERE did IN (SELECT DISTINCT aid
	     	 FROM MovieActor 
			 ));
