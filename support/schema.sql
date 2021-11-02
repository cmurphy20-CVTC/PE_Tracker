CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email text NOT NULL,
    password text NOT NULL,
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    school INT NOT NULL,
    expires DATE NOT NULL
);

CREATE TABLE schools (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
);

CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    users_id INT NOT NULL,
    students_id INT NOT NULL,
    tasks_id INT NOT NULL,
    duration INTERVAL NOT NULL
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

SELECT c.relname AS table, a.attname AS column, t.typname AS type FROM pg_catalog.pg_class AS c
            LEFT JOIN pg_catalog.pg_attribute AS a ON c.oid = a.attrelid AND a.attnum > 0 LEFT JOIN pg_catalog.pg_type AS t 
            ON a.atttypid = t.oid
            WHERE c.relname IN('users', 'observations', 'students', 'schools', 'tasks', )
            ORDER BY c.relname, a.attnum;