CREATE DATABASE nutritionist
    WITH
    OWNER = postgres
    ENCONDING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

    CREATE TABLE consultant (
        id SERIAL PRIMARY KEY,
        registro VARCHAR(50),
        tipo VARCHAR(50)
    );

    CREATE TABLE contract(
        id SERIAL PRIMARY KEY,
        start DATE NOT NULL,
        is_active BOOLEAN NOT NULL DEFAULT TRUE, end DATE,
        cliente_id INTEGER NOT NULL,
    );

    CREATE TABLE diet(
        id SERIAL PRIMARY KEY, 
        objective VARCHAR(100) NOT NULL,
        date DATE NOT NULL,
        is_active BOOLEAN NOT NULL DEFAULT TRUE,
        nutricionist_id  INTEGER NOT NULL,
        contract_id INTEGER NOT NULL,
        FOREIGN KEY (nutricionist_id) REFERENCES consultant(id),
        FOREIGN KEY (contract_id) REFERENCES contract(id)
    );

    CREATE TABLE meals (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        schedule INTEGER NOT NULL
    );

    CREATE TABLE mealitem (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        weight DECIMAL(5,2) NOT NULL,
        portion DECIMAL(5,2) NOT NULL,
 
    );

    CREATE TABLE meals_diets(
        id SERIAL PRIMARY KEY,
        meals_id INTEGER NOT NULL,
        diet_id INTEGER NOT NULL,
        FOREIGN KEY (meals_id) REFERENCES meals(id),
        FOREIGN KEY (diet_id) REFERENCES diet(id)
    );

    CREATE TABLE mealitem_meals(
        id SERIAL PRIMARY KEY,
        mealitem_id INTEGER NOT NULL,
        meals_id INTEGER NOT NULL,
        FOREIGN KEY (mealitem_id) REFERENCES mealitem(id),
        FOREIGN KEY (meals_id) REFERENCES meals(id)
    );