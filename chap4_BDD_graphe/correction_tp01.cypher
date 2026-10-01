//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////Solution Graphe Movies - Attention ! les solutions sont approximatiques pour vous pousser à bien les travailler.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//.1 Affichez tous les acteurs (nom) qui ont joué (« ACTED_IN ») dans des films (titre du film)
```
MATCH (p:Person) -[ACTED_IN]- (Movie)
RETURN DISTINCT p.name
```
//.2
```
MATCH (person {name :'Tom Cruise'})-[ACTED_IN]-(Movie)
RETURN Movie
```
//.3
```
MATCH (person)-[:ACTED_IN]-(Movie) 
WHERE Movie.title = 'Stand By Me' 
RETURN person
```
//.4
```
MATCH (person)-[:ACTED_IN]-(Movie)
WITH person, COUNT(Movie) AS moviesCount
WHERE moviesCount > 4
RETURN person
```
//.5 Affichez les films sortis après 2002
```
MATCH (person {name:'Tom Hanks'})-[:DIRECTED]-(Movie)
WITH COUNT(Movie) AS moviesCount
RETURN moviesCount
```
//.6 Affichez les films sortis après 2002
```
MATCH (m:Movie)
WHERE m.released > 2002
RETURN m
```

//3.7 Affichez la liste des acteurs (qui ont joué dans un film) dont 
leurs années de naissance « born » n’ont pas été renseignées.
```
match (p:Person) -[:ACTED_IN]-(Movie)
where p.born is null 
return partie
```
//.8 Rajoutez l’année de naissance de l’actrice
 « Naomie Harris » qui est née en 1976 et verifier la modification

```
match (p:Person) 
where p.name='Naomie Harris' 
set p.born=1976
```
// vérifier par la suite avec:
```
match(p:Person) 
where p.name = 'Naomie Harris'
return p
```
//.9 Affichez la liste d’acteur, leur âge actuel, le titre du film dans 
lequel l’acteur a joué, l’année de sortie du film et l’âge de
l’acteur quand le film est sorti.
```
MATCH (Person)-[:ACTED_IN]->(Movie)
WITH Movie, Person, abs(2022-Person.born) AS  Age_actuel, abs(Movie.released-Person.born) as Age_jour_sortie
return person.name, Age_actuel, Movie.released, Age_jour_sortie
```

// .10 Qui ont dirigé le film « The Matrix », affichez les noms des personnes et le type de relation.
```
MATCH (p:Person)-[:DIRECTED]-(m:Movie)
where m.title = 'The Matrix'
return p.name
```
// .11
```
match (Person)-[r]->(Movie)
WITH Movie, Person, count(r) as relation
where relation>= 3
RETURN Person, relation, Movie
```



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////Solution graphe Game of the Throne [aka GOT] - Attention ! les solutions sont approximatiques pour vous pousser à bien les travailler. ////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//2.1.1
```
CREATE(n:personnage { name : 'Mon_nom', nickname : 'Mon_prénom' }) RETURN n
```
//2.1.2

```
CREATE(gregor:personnage { name : 'Gregor Clegane', nickname : 'The Mountain' })
CREATE(oberyn:personnage { name : 'Oberyn Martell', nickname : 'The Viper' })
CREATE (gregor)-[:TUE { type : 'duel' }]->(oberyn)
RETURN gregor, oberyn
```
//2.1.3
```
match (n) return n
```
//2.1.4 Noeuds - personnages
```
CREATE (rickard:personnage { name : 'Rickard Stark', info : 'ancien Gouverneur du Nord et Seigneur de Winterfell', genre : 'masculin' })
CREATE (brandon:personnage { name : 'Brandon Stark', genre : 'masculin'})
CREATE (eddard:personnage { name : 'Eddard Stark', info : 'Gouverneur du Nord', genre : 'masculin'})
CREATE (rickon:personnage { name : 'Rickon Stark', genre: 'masculin'})
CREATE (lyanna:personnage { name : 'Lyanna Stark', genre: 'feminin' })
CREATE (benjen:personnage { name : 'Benjen Stark', info: 'patrouilleur de la Garde de nuit', genre: 'masculin' })
```
//  2.1.4 Actions

```
CREATE (rickard)-[:TUE{type : 'homicide'}]->(rickard)
CREATE (brandon)-[:TUE{type : 'homicide'}]->(brandon)
CREATE (joffrey)-[:TUE{type : 'homicide'}]->(eddard)
CREATE (catelyn)-[:TUE{type : 'homicide'}]->(catelyn)
CREATE (robb)-[:TUE{type : 'homicide'}]->(robb)
CREATE (rickon)-[:TUE{type : 'homicide'}]->(rickon)
CREATE (lyanna)-[:TUE{type : 'homicide'}]->(lyanna)
```

// 2.1.4  Relations lien entre personnage (famille)
```
CREATE(rickard)-[:FAMILLE{type : 'pere'}]->(brandon)
CREATE(rickard)-[:FAMILLE{type : 'pere'}]->(eddard)
CREATE(rickard)-[:FAMILLE{type : 'pere'}]->(lyanna)
CREATE(rickard)-[:FAMILLE{type : 'pere'}]->(benjen)

CREATE(brandon)-[:FAMILLE{type : 'fils'}]->(rickard)
CREATE(eddard)-[:FAMILLE{type : 'fils'}]->(rickard)
CREATE(lyanna)-[:FAMILLE{type : 'fille'}]->(rickard)
CREATE(benjen)-[:FAMILLE{type : 'fils'}]->(rickard)

CREATE(eddard)-[:FAMILLE{type : 'mari'}]->(catelyn)
CREATE(catelyn)-[:FAMILLE{type : 'femme'}]->(eddard)

CREATE(eddard)-[:FAMILLE{type : 'pere'}]->(robb)
CREATE(eddard)-[:FAMILLE{type : 'pere'}]->(sansa)
CREATE(eddard)-[:FAMILLE{type : 'pere'}]->(arya)
CREATE(eddard)-[:FAMILLE{type : 'pere'}]->(bran)
CREATE(eddard)-[:FAMILLE{type : 'pere'}]->(rickson)

CREATE(catelyn)-[:FAMILLE{type : 'mere'}]->(robb)
CREATE(catelyn)-[:FAMILLE{type : 'mere'}]->(sansa)
CREATE(catelyn)-[:FAMILLE{type : 'mere'}]->(arya)
CREATE(catelyn)-[:FAMILLE{type : 'mere'}]->(bran)
CREATE(catelyn)-[:FAMILLE{type : 'mere'}]->(rickon)

CREATE(lyanna)-[:FAMILLE{type : 'mere'}]->(jon)
CREATE(jon)-[:FAMILLE{type : 'fils'}]->(lyanna)
```

// Solution partie 2.2

//2.2.1
```
MATCH (n) RETURN n
```
//Ils ne sont pas reliés dans des clans car on a pas créé les relations de clans.


// 2.2.2
```
MATCH (p: personnage)
WHERE not ()-[:TUE]->(p)
RETURN p
```
// 2.2.3




