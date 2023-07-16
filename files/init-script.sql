-- Cria o banco de dados se não existir
DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'pokedata') THEN
        CREATE DATABASE pokedata;
    END IF;
END $$;

-- Conecta ao banco de dados pokedata
\c pokedata

-- CREATE TABLE IF NOT EXISTS pokemon (
--   id INTEGER,
--   identifier TEXT,
--   species_id INTEGER,
--   height INTEGER,
--   weight INTEGER,
--   base_experience INTEGER,
--   "order" INTEGER,
--   is_default INTEGER,
--   FOREIGN KEY (species_id) REFERENCES pokemon_species(id)
-- );

-- CREATE TABLE IF NOT EXISTS types (
--   id INTEGER,
--   identifier TEXT,
--   generation_id INTEGER,
--   damage_class_id INTEGER,
-- );

-- CREATE TABLE IF NOT EXISTS pokemon_types (
--   pokemon_id INTEGER,
--   type_id INTEGER,
--   slot INTEGER,
--   FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
--   FOREIGN KEY (type_id) REFERENCES types(id)
-- );

-- CREATE TABLE IF NOT EXISTS pokemon_species (
--   id INTEGER,
--   identifier VARCHAR(255),
--   generation_id INTEGER,
--   evolves_from_species_id INTEGER,
--   evolution_chain_id INTEGER,
--   color_id INTEGER,
--   shape_id INTEGER,
--   habitat_id INTEGER,
--   gender_rate INTEGER,
--   capture_rate INTEGER,
--   base_happiness INTEGER,
--   is_baby BOOLEAN,
--   hatch_counter INTEGER,
--   has_gender_differences BOOLEAN,
--   growth_rate_id INTEGER,
--   forms_switchable BOOLEAN,
--   is_legendary BOOLEAN,
--   is_mythical BOOLEAN,
--   "order" INTEGER,
--   conquest_order INTEGER,
--   FOREIGN KEY (evolves_from_species_id) REFERENCES pokemon_species(id)
-- );

-- CREATE TABLE IF NOT EXISTS pokemon_shapes (
--   id INTEGER,
--   identifier VARCHAR(255)
-- );

-- CREATE TABLE IF NOT EXISTS pokemon_colors (
--   id INTEGER,
--   identifier VARCHAR(255)
-- );

create table if not exists pokemon (
    id serial, 
    identifier varchar(100) not null,
    species_id int not null,
    height int not null,
    weight int not null,
    base_experience int not null,
    "order" int not null,
    is_default boolean not null
);

create table if not exists types (
    id serial,
    identifier varchar(100) not null,
    generation_id int not null,
    damage_class_id int
);

create table if not exists pokemon_types (
    id serial,
    type_id int not null,
    slot int not null
);

create table if not exists pokemon_species (
    id serial,
    identifier varchar(100),
    generation_id int,
    evolution_chain_id int,
    habitat_id int,
    is_legendary int,
    is_mythical int
);

create table if not exists pokemon_shapes (
    id serial,
    identifier varchar(100)
);

create table if not exists pokemon_colors (
    id serial,
    identifier varchar(100)
);


-- Importação dos dados
COPY pokemon FROM '/files/csv/pokemon.csv' CSV HEADER NULL 'NULL';
COPY types FROM '/files/csv/types.csv' CSV HEADER NULL 'NULL';
COPY pokemon_types FROM '/files/csv/pokemon_types.csv' CSV HEADER NULL 'NULL';
COPY pokemon_species FROM '/files/csv/pokemon_species.csv' CSV HEADER NULL 'NULL';
COPY pokemon_shapes FROM '/files/csv/pokemon_shapes.csv' CSV HEADER NULL 'NULL';
COPY pokemon_colors FROM '/files/csv/pokemon_colors.csv' CSV HEADER NULL 'NULL';
