Ruby and Databases
======
​
# Unit Description
Languages are better suited for certain tasks (eg: Python is used extensively in math and science and). Ruby is extremely effective at connecting to databases and manipulating data for the user.
​
We'll take a look at two different data-stores, comma separated values (CSV) and the structured query language (SQL) to store and retrieve data.
​
# Objectives
​
## Skills
​
In order to store and retrieve data, student will be able to:
​
* Read and Create CSV data using the CSV library
* Execute basic SQL commands
* Model ActiveRecord classes around SQL tables
​
## Understandings
​
* display understanding of rows, attributes, and values in CSV and SQL
* demonstrate the relationship between `select * from users` and `User.all`
​
## Students will not necessarily
​
* Need an in-depth understanding of SQL
* Understand the details of database administration
​
# Prerequisites
​
* **Ruby Fundamentals**
  Students should be familiar with the basic ruby style of programming, looping, and how blocks are used. (`@users.each do |user|`)
* **Object Oriented Programming in Ruby**
  Students should be comfortable defining classes, methods, and instantiating instances of those classes (`@user = User.new`)
​
# Assessments
​
#### Challenge: CSV
​
Given a CSV file, student should be able to open the file and determine several answers using Ruby. For example, the student should be able to calculate both the the sum of all transactions and the average transaction amount.
​
#### Challenge: SQL Examples
​
User should be able to create two tables in PostgreSQL (customers and orders), insert data into the tables, and execute a select statement that joins the tables together.
​
#### Challenge:
​
#### Assignment: CSV, SQL, Ruby Blender
​
Given a CSV file, student should design a PostgreSQL table to hold the data, and then insert rows using ActiveRecord. Finally, student should display the list of names on a screen that match a certain condition (eg: lives in Texas).
​
# Lesson Suggestions
​
​
## CSV
​
* Starting with Excel/Numbers, explain the vocabulary (rows, attributes, keys)
* Utilize `CSV.foreach("./file.csv") do |row|`
* Generate an array of hashes from a CSV file
​
## SQL
​
* History of databases and how the SQL standard came to exist
* Different databases, why we choose PostgreSQL
* Vocabulary (rows, columns, values)
* Select, Insert, Update, Delete
* Joining two tables together
​
## ActiveRecord associations / data modeling
​
* ActiveRecord naming conventions
* Each row in the database is an instance of a AR object
* How to select all records and loop over them (`User.all`)
* Relationship between the following:
  1. `select * from users` and `User.all`
  1. `select * from users where username = 'roboto'` and `User.where username: 'roboto'`
  1. `select * from users where users.id = 5 limit(1)` and `User.find_by id 5`