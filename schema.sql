CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);
ALTER TABLE animals
ADD COLUMN species VARCHAR(250);
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(250),
  age INT,
  PRIMARY KEY (id)
);
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  PRIMARY KEY (id)
);
ALTER TABLE animals
ADD PRIMARY KEY(id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owners(id);
CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);
CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY,
  species_id INT REFERENCES species(id),
  vets_id INT REFERENCES vets(id),
  PRIMARY KEY (id)
);
CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animals_id INT REFERENCES animals(id),
  vets_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY (id)
);
-- Add an email column to your owners table
ALTER TABLE owners
ADD COLUMN email VARCHAR(120);