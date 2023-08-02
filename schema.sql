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