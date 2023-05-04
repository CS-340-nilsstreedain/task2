-- Write the query to create the 4 tables below.
-- Create the client table
CREATE TABLE client (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    UNIQUE full_name (first_name, last_name)
);

-- Create the employee table
CREATE TABLE employee (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    UNIQUE full_name (first_name, last_name)
);

-- Create the project table
CREATE TABLE project (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    comments TEXT,
    cid INT(11),
    UNIQUE (title),
    FOREIGN KEY (cid) REFERENCES client(id)
);

-- Create the works_on table
CREATE TABLE works_on (
    pid INT(11),
    eid INT(11),
    due_date DATE NOT NULL,
    PRIMARY KEY (eid, pid),
    FOREIGN KEY (pid) REFERENCES project(id),
    FOREIGN KEY (eid) REFERENCES employee(id)
);

-- Leave the queries below untouched. These are to test your submission correctly.
-- Test that the tables were created
DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_SCHEMA = 'grade';
