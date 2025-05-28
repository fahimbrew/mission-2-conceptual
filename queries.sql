-- Active: 1747906155646@@127.0.0.1@5432@b5_conceptual
ALTER TABLE books ADD COLUMN genre TEXT;

ALTER TABLE books DROP COLUMN genre;

SELECT * FROM books;

SELECT * FROM books WHERE in_stock = false;

ALTER TABLE books RENAME COLUMN author_name TO author;

SELECT * FROM books WHERE author = 'George Orwell';