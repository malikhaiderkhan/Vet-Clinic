SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=TRUE;
SELECT * FROM animals WHERE name!='Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg=weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg=weight_kg * -1 WHERE weight_kg<0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered,AVG(escape_attempts) AS avg_escapes FROM animals GROUP BY neutered ORDER BY avg_escapes DESC LIMIT 1;
SELECT species,MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species;
SELECT species,AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owner_id=4;
SELECT animals.name FROM animals JOIN species ON animals.species_id=species.id WHERE species_id=1;
SELECT name,full_name FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id;
SELECT species.name,COUNT(*) FROM animals JOIN species ON animals.species_id=species.id GROUP BY species.id;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id JOIN species ON animals.species_id=species.id WHERE owner_id=2 AND species_id=2;
SELECT name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owner_id=5 AND escape_attempts=0;
SELECT full_name,COUNT(owner_id) FROM animals JOIN owners ON animals.owner_id=owners.id GROUP BY full_name ORDER BY COUNT(owner_id) DESC LIMIT 1;
