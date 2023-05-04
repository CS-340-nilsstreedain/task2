# Basic/Intermediate SQL Assignment (on GradeScope)
## Instructions
The **Basic/Intermediate SQL Assignment** is hosted on a separate platform called GradeScope, which you will be automatically signed in to once you click on the button "**Load Basic/Intermediate SQL Assignment (on GradeScope) in a new window**" below.

The due date is as shown on Canvas and GradeScope.

It will be helpful to read this page completely before attempting the assignment.

## How to attempt and turn in this Assignment?
1. Read the questions in the next section. You will be writing SQL queries to answer the questions.
2. Download the starter code from basic_intermediate_starter_code.zip Download [basic_intermediate_starter_code.zip](https://canvas.oregonstate.edu/courses/1914742/files/99025245). Make sure you read the files before you change them.
3. Put your queries in the correct .sql file. You will have multiple query submission files. A single .sql file can contain single or multiple queries depending on what the question requires.
4. Click on the button at the bottom of this page labeled "**Load Basic/Intermediate SQL Assignment (on GradeScope) in a new window**" to go to the GradeScope page for this assignment.
5. Submit your SQL files there on the GradeScope page. You can upload a single query file at a time or you can upload them all at once. Once uploaded, GradeScope will run your SQL and indicate whether it is correct or not. If your SQL does not produce the correct results, GradeScope will show you how the expected output differs from your submission's output. Syntax errors, if any, should also be show to you.

### Looking up Foreign Keys on INSERT
The second question in this assignment asks us to insert rows with foreign keys using nested select statements. Previously, we have simply inserted the foreign key values directly (i.e., hard coding them into our select statements). However, there is a way we can dynamically insert the correct foreign key without knowing its value. For example, assume we have a movie database with the following schema,
```sql
Movies(MovieID, Title, ReleaseYear, DirectorID)
Directors(DirectorID, FirstName, LastName, Birthdate)
```
Where DirectorID in Movies is a foreign key to DirectorID in Directors. If we wanted to insert the movie Star Wars: Episode IV - A New Hope, we could either,

1. Look up George Lucas' DirectorID with a select statement and then copy-paste his ID into our INSERT for Star Wars: Episode IV - A New Hope:
  a. Query for George Lucas' DirectorID:
```sql
SELECT DirectorID
FROM Directors 
WHERE FirstName = "George" AND  LastName = "Lucas";
```
```sql
+-------------+
| DirectorID  |
+-------------+
| 12345678    |
+-------------+
```
  b. Place George Lucas' DirectorID directly in the INSERT statement:
```sql
INSERT INTO Movies(Title, Year, DirectorID) VALUES (
("Star Wars: Episode IV - A New Hope",  1977, 12345678);
```

2. Look up George Lucas' DirectorID with a select statement directly within our INSERT statement for Star Wars: Episode IV - A New Hope
```
INSERT INTO Movies(Title, Year, DirectorID) VALUES (
("Star Wars: Episode IV - A New Hope",  1977, SELECT DirectorID FROM Directors WHERE FirstName = "George" AND  LastName = "Lucas");
```
Using a SELECT **subquery** (the second option), saves us the step of having to look up foreign key values before writing our INSERT statements. You'll be practicing this same method when you write INSERT statements in your query2.sql file.

## Questions:
### In query1.sql, Create Tables in the Given Order -- 32 points
For this activity, we are going to create a database where employees work on projects for specific clients.

Create a table called **client** with the following columns:
- **id**- an auto-incrementing integer which is the primary key, size 11
- **first_name**- a varchar with a maximum length of 255 characters, cannot be null
- **last_name**- a varchar with a maximum length of 255 characters, cannot be null
- **email**- a varchar with a maximum length of 255 characters, cannot be null
- The combination of the **first_name** and **last_name** must be unique in this table. Name this constraint as **full_name**
  - Check out the documentation at https://mariadb.com/kb/en/constraint/ to find the appropriate constraint

Create a table called **employee** with the following columns:
- **id**- an auto-incrementing integer which is the primary key, size 11
- **first_name**- a varchar of maximum length 255, cannot be null
- **last_name**- a varchar of maximum length 255, cannot be null
- **start_date**- a date, cannot be null
- **email**- a varchar with a maximum length of 255 characters, cannot be null
- The combination of the **first_name** and **last_name** must be unique in this table. Name this constraint as **full_name**

Create a table called **project** with the following columns:
- **id**- an auto-incrementing integer which is the primary key, size 11
- **title**- a varchar of maximum length 255, cannot be null
- **comments**- a text column
- **cid**- an integer which is a foreign key reference to the client table
The project **title** must be unique in this table

Create a table called **works_on** representing a many-to-many relationship between employees and projects, with the following properties:
- **pid**- an integer which is a foreign key reference to the project table
- **eid**- an integer which is a foreign key reference to the employee table
- **due_date**- a date, not null
The primary key is a combination of eid and pid

**Do not name any constraints other than the full_name for client and employee.**

### In query2.sql, Insert Data as indicated in the Tables Below -- 18 points
Insert the following clients into the **client** table:
First Name | Last Name | Email
---|---|---
Sara | Smith | smiths@hello.com
Miguel | Cabrera | mc@hello.com
Bo | Chan'g | bochang@hello.com

Insert the following employees into the **employee** table:
First name | Last name | Start Date | Email
---|---|---|---
Ananya | Jaiswal | 4/10/2008 | ajaiswal@hello.com
Michael | Fern | 7/19/2015 | michaelf@hello.com
Abdul | Rehman | 2/27/2018  | rehman@hello.com

Insert the following project instances into the **project** table. Rather than hard-coding the primary keys of each client, you should use a subquery to set up foreign key references to the clients associated with each project:
cid | title | comments
---|---|---
reference to Sara Smith | Diamond | Should be done by Jan 2019
reference to Bo Chan'g | Chan'g | Ongoing maintenance
reference to Miguel Cabrera | The Robinson Project | NULL

Now let's indicate which employees work on which projects. Insert rows into the **works_on** table to indicate the following employee/project/date pair-ups. We should use select subqueries to populate our foreign keys for pid and eid.
employee | project | due_date
---|---|---
Ananya Jaiswal | Chan'g | 11/19/2020
Michael Fern | The Robinson Project | 12/05/2020
Abdul Rehman | Diamond | 1/1/2021

### Hints and Tips for Intermediate SQL Assignment
#### Hints and Tips for Advanced SQL Assignment
1. You are writing CREATE TABLE scripts following the instructions carefully. You also add constraints as well as indicating PKs and FKs. See examples here: http://www.mysqltutorial.org/mysql-foreign-key/
2. Start by inserting the values into the client and employee table. Remember the syntax is
```sql
INSERT INTO `table_name`(column_1,column_2,...) VALUES (value_1,value_2,...);
```
Next you will do an insert into the project table, but this time instead of writing the values for cid, you will use a SELECT subquery. So it might look something like this:
```sql
INSERT INTO project(cid, name, comments)
VALUES ((SELECT id from client where first_name = 'Sara' and last_name = 'Smith'), 
 'Diamond', 'Should be done by Jan 2021'),
(another SELECT subquery for Bo Chang), "Chan'g", 'Ongoing maintenance'),
(another SELECT subquery for Miguel Cabrera), 'The Robinson Project', NULL)
```
You would do something similar for the INSERT into the works_on table.

3. SQL can be a little picky about comment formatting, so if you add any extra comments, make sure they follow the correct format. Specifically, if you use double-dashes (i.e., "-- "), make sure that the dashes are flowed by at least one space. For example, "--my comment" should be "-- my comment".
