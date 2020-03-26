
##The Book Lounge allow users to sign up for an account, search for books in
#the database, and add books to the database.


``
##User Stories


Sign-up/login/logout

As a non-registered user,
So I can start to use The Book Loung,
I'd like to see a sign-up button on the homepage

As a non-registered user,
So I can start to use The Book Lounge
I'd like to sign up using my full name, email, phone number and password
 
As a newly registered user,
So I know I have successfully signed up,
I'd like to see a "Sign up has been successful"


As a registered user
So that only I can post to my account
I'd like to be able to log in using my credentials

As a registered user
So as to prevent others from accessing my account
I'd like to be able to log out
```

General

As a registered user,
So I can search for books
I'd like to be able to enter a book title and an author into a text field

As a registered user,
So I can see if the book I searched for is available,
I'd like to be told if the book is available or note

As a registered user,
So I can add books
I'd like to be able to add a book with its author, isbn and genre

As a registered user,
So I can see all of the books that are available,
I'd like to see a list of books when I click on 'view all books'
```


Database creation.

The Book Lounge uses PostgreSQL, so if you don't have it installed on your computer, please do the following:

Install postgres:

**brew install postgresql**

Start postgres:

**brew services start postgresql**

**psql postgres**

Create database:


**CREATE DATABASE the_book_lounge;**


Create a test database:

**CREATE DATABASE the_book_lounge_test;**


###Connect to the_book_lounge database by typing:

**\c** 

Create the following tables, by typing the following SQL commands:

**CREATE TABLE the_book_lounge(id SERIAL PRIMARY KEY, title VARCHAR(60), author VARCHAR(60), genre VARCHAR(60), isbn VARCHAR(60));**


**CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(60), password VARCHAR(20), phone_number VARCHAR(10));**


**ALTER TABLE users ALTER COLUMN phone_number TYPE varchar(15);**

Check that the tables have been created by typing the following: 

**\dt**
```

```
How to use:

Clone this repository:

**git clone https://github.com/emilyjspencer/The_Book_Lounge.git**

cd into the repo on your computer

Start the server:

**ruby app.rb**

**Go to localhost:3000**
```




