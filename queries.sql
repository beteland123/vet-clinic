/* Find all animals whose name ends in "mon" */
SELECT * FROM animals WHERE name LIKE '%mon';
/*List the name of all animals born between 2016 and 2019.*/
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
/*List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT name FROM animals WHERE neutered = true AND  escape_attempts < 3;
/*List the date of birth of all animals named either "Agumon" or "Pikachu".*/
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Picachu';
/*List name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
/*Find all animals that are neutered.*/
SELECT * FROM animals WHERE neutered = true;
/*Find all animals not named Gabumon.*/
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Second day*/

/*Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. 
Then roll back the change and verify that the species columns went back to the state before the transaction.*/

BEGIN;

UPDATE animals
SET species='unspecified';

SELECT species,name FROM animals;

ROLLBACK;
SELECT * FROM animals;
/*Inside a transaction:
Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.*/
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
/*Update the animals table by setting the species column to pokemon for all animals that don't have species already set.*/
UPDATE animals SET species='pokemon' WHERE species IS NULL;
/*verfy changes*/
SELECT * FROM animals;
COMMIT;
/*Verify that changes persist after commit.*/
SELECT * FROM animals;
/*Inside a transaction delete all records in the animals table, then roll back the transaction.*/
BEGIN;
DELETE FROM animals;
ROLLBACK;
/*verify if all records in the animals table still exists.*/
SELECT * FROM animals;
/*Inside a transaction:
Delete all animals born after Jan 1st, 2022.
Create a savepoint for the transaction.
Update all animals' weight to be their weight multiplied by -1.
Rollback to the savepoint
Update all animals' weights that are negative to be their weight multiplied by -1.
Commit transaction*/
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sv1;
UPDATE animals SET weight_kg= weight_kg * -1;
ROLLBACK TO sv1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;
/*How many animals are there?*/
SELECT COUNT(*) AS total FROM animals;
/*How many animals have never tried to escape?*/
SELECT COUNT(*) AS no_escape FROM animals WHERE escape_attempts = 0;
/*What is the average weight of animals?*/
SELECT AVG(weight_kg) As avg_weight FROM animals;
/*Who escapes the most, neutered or not neutered animals?*/
SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
FROM animals
GROUP BY neutered;
/*What is the minimum and maximum weight of each type of animal?*/
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '1999-12-31' GROUP BY species;

/*third day*/
/*What animals belong to Melody Pond?*/
SELECT name,date_of_birth
FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name ='Melody Pond';

/*List of all animals that are pokemon (their type is Pokemon).*/

SELECT animals.name
FROM animals
INNER JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

/*List all owners and their animals, remember to include those that don't own any animal.*/
SELECT owners.full_name AS owner_name, animals.name AS animal_name
FROM owners
LEFT JOIN animals
ON animals.owner_id = owners.id;

/*
How many animals are there per species?*/
SELECT species.name,COUNT(animals.name) AS total_animal
FROM animals
INNER JOIN species
ON animals.species_id = species.id
GROUP BY species.name;
/*List all Digimon owned by Jennifer Orwell.*/
SELECT animals.name
FROM animals
INNER JOIN species
ON animals.species_id = species.id
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name ='Jennifer Orwell' AND species.name = 'Digimon';

/*List all animals owned by Dean Winchester that haven't tried to escape.*/
SELECT animals.name As animals_name
FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name ='Dean Winchester'
AND animals.escape_attempts = 0 ;

/*Who owns the most animals?*/
SELECT owners.full_name AS owner_name, COUNT(animals.id) AS animal_total
FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animal_total DESC
LIMIT 1;

/* the 4th round*/
/*Who was the last animal seen by William Tatcher?*/
SELECT animals.name AS animal
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visit_date DESC
LIMIT 1;
/*How many different animals did Stephanie Mendez see?*/
SELECT COUNT(animals.name) AS total_vists_animal
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties.*/
SELECT vets.name AS vets_name, species_id AS specialization_id
FROM vets
LEFT JOIN specializations
ON specializations.vets_id = vets.id
ORDER BY vets.name;

/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.*/

SELECT animals.name AS animal
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

/*What animal has the most visits to vets?*/
SELECT animals.name AS animal, COUNT(vets.id) AS visit_count
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON visits.vet_id = vets.id
GROUP BY animals.name
ORDER BY visit_count DESC
LIMIT 1;

/*Who was Maisy Smith's first visit?*/

SELECT animals.name AS animal, MIN(visits.visit_date) AS first_visit
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name
ORDER BY first_visit ASC
LIMIT 1;

/*Details for most recent visit: animal information, vet information, and date of visit.*/
SELECT animals.name AS animal, MAX(visits.visit_date) AS recent_visit, vets.name
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
INNER JOIN vets
ON visits.vet_id = vets.id
GROUP BY animals.name, vets.name
ORDER BY recent_visit DESC
LIMIT 1;

/*How many visits were with a vet that did not specialize in that animal's species?*/
SELECT COUNT(*) AS total_visits
FROM visits 
JOIN vets  
ON visits.vet_id = vets.id
LEFT JOIN specializations 
ON vets.id = specializations.vets_id AND visits.animal_id = specializations.species_id
WHERE specializations.vets_id IS NULL;

/*What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/
SELECT species.name AS specializations_on_species,animals.species_id,COUNT(*) AS count_visit
FROM visits
INNER JOIN vets
ON  vets.id = visits.vet_id
INNER JOIN animals
ON animals.id = visits.animal_id
INNER JOIN species
ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name,animals.species_id
ORDER BY count_visit DESC
LIMIT 1;

