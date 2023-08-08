/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id SERIAL PRIMARY KEY NOT NULL,
    name  VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);
/* the second day task*/
/*add species*/
ALTER TABLE animals ADD COLUMN species VARCHAR(50);
/* 3rd day*/
 CREATE TABLE owners (
    id SERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    age INT

 );
 CREATE TABLE species(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100)
 );
 ALTER TABLE animals DROP COLUMN species;
 ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
 
 ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);
 /*4th day*/
 CREATE TABLE vets(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT Null,
    age INT,
    date_of_graduation DATE
 );
CREATE TABLE specializations (
  vets_id INT REFERENCES vets (id),
  species_id INT REFERENCES species (id),
  PRIMARY KEY (vets_id, species_id)
);
CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY NOT NULL,
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date DATE
);
/*optimization*/
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
--add index for each of them
CREATE INDEX idx_visits_animal_id ON visits (animal_id);
CREATE INDEX idx_visits_vet_id ON visits (vet_id);
CREATE INDEX idx_owners_email ON owners (email);

