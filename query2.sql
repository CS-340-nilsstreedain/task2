-- write your queries to insert data here
-- Insert clients
INSERT INTO client(FirstName, LastName, Email) VALUES
('Sara', 'Smith', 'smiths@hello.com'),
('Miguel', 'Cabrera', 'mc@hello.com'),
('Bo', 'Chan''g', 'bochang@hello.com');

-- Insert employees
INSERT INTO employee(FirstName, LastName, StartDate, Email) VALUES
('Ananya', 'Jaiswal', '2008-04-10', 'ajaiswal@hello.com'),
('Michael', 'Fern', '2015-07-19', 'michaelf@hello.com'),
('Abdul', 'Rehman', '2018-02-27', 'rehman@hello.com');

-- Insert projects
INSERT INTO project(cid, title, comments) VALUES
((SELECT clientID FROM client WHERE FirstName = 'Sara' AND LastName = 'Smith'), 'Diamond', 'Should be done by Jan 2019'),
((SELECT clientID FROM client WHERE FirstName = 'Bo' AND LastName = 'Chan''g'), 'Chan''g', 'Ongoing maintenance'),
((SELECT clientID FROM client WHERE FirstName = 'Miguel' AND LastName = 'Cabrera'), 'The Robinson Project', NULL);

-- Insert works_on
INSERT INTO works_on(eid, pid, due_date) VALUES
((SELECT employeeID FROM employee WHERE FirstName = 'Ananya' AND LastName = 'Jaiswal'), (SELECT projectID FROM project WHERE title = 'Chan''g'), '2020-11-19'),
((SELECT employeeID FROM employee WHERE FirstName = 'Michael' AND LastName = 'Fern'), (SELECT projectID FROM project WHERE title = 'The Robinson Project'), '2020-12-05'),
((SELECT employeeID FROM employee WHERE FirstName = 'Abdul' AND LastName = 'Rehman'), (SELECT projectID FROM project WHERE title = 'Diamond'), '2021-01-01');

-- Leave the queries below untouched. These are to test your submission correctly.
SELECT * FROM project;
SELECT * FROM client;
SELECT * FROM employee;
SELECT * FROM works_on;
