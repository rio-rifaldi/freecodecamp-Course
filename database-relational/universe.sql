DROP TABLE galaxy;
DROP TABLE star;
DROP TABLE planet;
DROP TABLE moon;
DROP TABLE username;

CREATE DATABASE universe;

CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY , name VARCHAR(30) NOT NULL UNIQUE ,has_life BOOLEAN, age_in_million_years INT,galaxy_types VARCHAR(30) NOT NULL,description TEXT );
ALTER TABLE galaxy ADD CONSTRAINT fk_star_id FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);

-- DATA
    INSERT INTO galaxy(galaxy_id,name,has_life,age_in_million_years,galaxy_types,description) 
    VALUES(1,'bima sakti',true,245,'medium','this galaxy has a alot of planet')
            ,(2,'andromeda',true,3764,'large','this galaxy has a alot of life')
            ,(3,'pinwhell',false,12343,'small','this galaxy has a alot of sun')
            ,(4,'cartwhell',true,43245,'large','this galaxy has a alot of thing')
            ,(5,'triagulum',true,1245,'medium','this galaxy has a alot of light'),(6,'milkey',true,3453,'medium','this galaxy has a alot of ligthing');

CREATE TABLE star(star_id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL UNIQUE,is_sperical BOOLEAN,distance_from_earth NUMERIC NOT NULL,description TEXT );
ALTER TABLE star ADD CONSTRAINT fk_planet_id FOREIGN KEY(star_id) REFERENCES star(star_id);

-- DATA
    INSERT INTO star(star_id,name,is_sperical,distance_from_earth,description) 
    VALUES(1,'Sirius',true,212.3,'this sun i very hot'),
            (2,'aldebran',true,212.5,'this sun i very pretty'),
            (3,'casiopeia',true,2332.5,'this sun i very white'),
            (4,'altaiir',true,212.9,'this sun i very awesome'),
            (5,'antarres',true,2532.5,'this sun i very beauiful'),
            (6,'castor',true,2122.5,'this sun i very handsome');
            
CREATE TABLE planet(planet_id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL UNIQUE,has_life BOOLEAN,distance_from_earth NUMERIC NOT NULL,age_in_million_years INT,planet_types VARCHAR(30) NOT NULL,description TEXT );
ALTER TABLE planet ADD CONSTRAINT fk_moon_id FOREIGN KEY(planet_id) REFERENCES planet(planet_id);

 -- DATA
    INSERT INTO planet(planet_id,name,has_life,distance_from_earth,age_in_million_years,planet_types,description) VALUES
    (1,'merkurius',false,213.43,4324,'small','merkurius is near from sun'), 
    (2,'venus',false,2343.43,43424,'small','merkurius is second from sun'), 
    (3,'earh',true,413.43,8324,'small','merkurius is thirth from sun'), 
    (4,'mars',false,513.43,5324,'small','merkurius is fourth from sun'), 
    (5,'jupiter',false,813.43,8324,'big','merkurius is fivery from sun'), 
    (6,'saturnus',false,413.33,5344,'small','merkurius is sixts from sun'),
    (7,'uranus',false,513.33,5344,'small','merkurius is sixts from sun'),
    (8,'pluto',false,313.33,5344,'small','merkurius is sixts from sun'),
    (9,'ceres',false,913.33,5344,'medium','merkurius is sixts from sun'),
    (10,'haumea',false,213.33,5344,'medium','merkurius is sixts from sun'),
    (11,'eris',false,353.33,5344,'small','merkurius is sixts from sun'),
    (12,'makemake',false,713.33,5344,'small','merkurius is sixts from sun'),
    (13,'kepler-23b',false,313.33,5344,'medium','merkurius is sixts from sun');


CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL UNIQUE,has_life BOOLEAN,distance_from_earth NUMERIC NOT NULL,moon_types VARCHAR(30) NOT NULL,satelit_of VARCHAR(30) );

-- DATA
     INSERT INTO moon(moon_id,name,has_life,distance_from_earth,moon_types,satelit_of)
    VALUES
    (1,'moon',true,234.34,'small','earth'),
    (2,'phobos',true,334.34,'small','mars'),
    (3,'deimos',false,434.34,'small','mars'),
    (4,'lo',true,234.34,'small','jupiter'),
    (5,'europa',true,234.34,'medium','jupiter'),
    (6,'ganymende',true,234.34,'small','jupiter'),
    (7,'Callisto',true,234.34,'small','jupiter'),
    (8,'Amalthea',true,234.34,'small','jupiter'),
    (9,'Himalia',true,234.34,'small','jupiter'),
    (10,'Elara',true,234.34,'small','jupiter');


     INSERT INTO moon(moon_id,name,has_life,distance_from_earth,moon_types,satelit_of)
    VALUES
        (11,'Pasiphae',true,234.34,'small', 'jupiter'),
    (12,'Sinope',true,234.34,'small', 'jupiter'),
    (13,'Lysithea',true,234.34,'small', 'jupiter'),
    (14,'Carme',true,234.34,'small', 'jupiter'),
    (15,'Ananke',true,234.34,'small', 'jupiter'),
    (16,'Leda',true,234.34,'small', 'jupiter'),
    (17,'Thebe',true,234.34,'small', 'jupiter'),
    (18,'Adrastea',true,234.34,'small', 'jupiter'),
    (19,'Metis',true,234.34,'small', 'jupiter'),
    (20,'Callirrhoe',true,234.34,'small', 'jupiter'),
    (21,'Themisto',true,234.34,'small', 'jupiter');

CREATE TABLE username(username_id serial UNIQUE,name VARCHAR(30) not null , job VARCHAR(30));

insert into username(username_id,name,job) values(1,'rio rifaldi','software engginer'),(2,' rifaldi','software engginer'),(3,'rio ','software engginer');