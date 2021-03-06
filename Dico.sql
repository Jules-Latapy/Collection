	--------------------Compilation/lancement-----------
		--\i nomFonction.sql
	--------------------Types---------------------------
/*-------------*/
/* fondamental */
/*-------------*/

	--INTEROGATION--
	SELECT ...,... 
	FROM ...
	WHERE ...
	ORDER BY ...croissant par defaut(ASC),...sinon(DESC);


	--SUPPRESSION--
	DELETE...,... 
	FROM  ...
	WHERE ...
	LIMIT ...;


	--AJOUT--
	INSERT INTO ... 
	VALUES ('...');


	--MODIFICATION--
	UPDATE ...
    SET ...=...
    WHERE ...
    LIMIT ...;


	--CREATION--
	CREATE TABLE ...
	(... integer 	 not null primary key,
	 ... varchar(20) not null FOREIGN KEY,
	 ... char(15)    unique,
	 ... char        default 'A',
	 ... char        FOREIGN KEY REFERENCES,
	 ... char        CHECK (conditions));



	--MODIFICATION DE TABLE--
	ALTER TABLE ... ADD|DROP|ALTER ... ;


	--CONTRAINTE--
	CONTRAINT ... = nom de la contrainte
	NO ACTION 
	ON DELETE
	ON UPDATE
	CASCADE		  = change aussi les table liées
	SET NULL
	SET DEFAULT

/*-------------------*/
/* caractere special */
/*-------------------*/


	--REGEX -->
	%  = chaine meme null
	_  = caractere

	--/!\ utilisez LIKE avec ceux la

	*  = tout selectionner
	|| = concatenation
	:= = operateur d affectation


/*-------------------*/
/* fonctions de base */
/*-------------------*/


	LOWER ()
	UPPER ()
	LENGTH()
	SUBSTR(nom,debut,taille)


	... JOIN ...
	... NATURAL JOIN ...
	... INNER JOIN ...
	... OUTER JOIN ...
	... LEFT JOIN ...
	... RIGHT JOIN ...
	... FULL JOIN ...

	--/!\ toute les jointures peuvent s'écrire avec des selection


	GROUP BY ... = suppreccion des doublons de ...
	AS ...       = renommage


	COALESCE() = retour la première valeur NOT NULL d une liste de colonne
	ROUND   (nombre,decimales)
	TRUNC   (nombre,decimales)
	TO_CHAR (col,‘DD/MM/YYYY’)
	CURRENT_DATE  

	--/!\la date dans une colonne est avec des - entre les chiffres


	Min  : retourne le minimum
	Max  : retourne le maximum
	Avg  : retourne la moyenne arithmétique
	Count: retourne le nombre (de lignes)
	Sum  : retourne le total (la somme)


/*-------------*/
/* imbrication */
/*-------------*/


	SELECT ...,... 
	FROM ...
	WHERE truc_a_comparer in (SELECT...
		   					  FROM  ...
		   					  WHERE ...);
	IN  pour "="
	ANY pour "ou" logique
	ALL pour "et" logique
	EXIST pour une expression


	GROUP BY ... HAVING ... = pour preciser 


/*---------------*/
/* Fonctions-SQL */
/*---------------*/

	CREATE or REPLACE FUNCTION 
	nom_de_la_fonction (nb integer, som numeric) 
	RETURNS INT | numeric |SETOF |BIGINT ..
	AS $$
	...instruction...
	$$ LANGUAGE SQL

/*-------------------*/
/* Fonctions-PlpgSQL */
/*-------------------*/

	CREATE FUNCTION or REPLACE FUNCTION 
	nom_de_la_fonction(nb integer,som numeric) 
	RETURNS INT | numeric | SETOF |BIGINT ..
	AS $$
	DECLARE
       		i int := 0;
       		k int ;
	BEGIN
        RAISE NOTICE 'message'variable_du_message


        --TEST--
        IF (...) THEN
   		...;
   		ELSE
   		...;
  		END IF;


  		--TANT QUE--
  		WHILE ...
		LOOP
       	...;
		END LOOP;


		--BOUCLE--
		LOOP
		EXIT WHEN...;
		END LOOP;


		--POUR--
		FOR l IN [REVERSE] 1..10 
		LOOP
    	...;
		END LOOP;


		--ce qui vont avec Setoff

		RETURN QUERY 
               SELECT ...
               FROM ... ;      

        RETURN NEXT ;         
              	
    --ERREUR--
	[EXCEPTION
    	WHEN ... THEN ...;
    	ELSE ...;
	]
	END;
	$$ LANGUAGE plpgsql;


/*--------------*/
/* Type-definis */
/*--------------*/

	CREATE TYPE ... AS (
	s int, 
	p int
	);

/*-------*/
/* AUTRE */
/*-------*/

	a:
	GOTO a

	Found = Variable de base d une fonction qui indique si la derniere requete a marcher

	EXIT .
