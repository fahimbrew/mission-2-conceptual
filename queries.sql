-- Active: 1747906155646@@127.0.0.1@5432@b5_conceptual
ALTER TABLE books ADD COLUMN genre TEXT;

ALTER TABLE books DROP COLUMN genre;

SELECT * FROM books;

SELECT * FROM books WHERE in_stock = false;

ALTER TABLE books RENAME COLUMN author_name TO author;

SELECT * FROM books WHERE author = 'George Orwell';

SELECT title, LENGTH(title) FROM books;

SELECT count(*) FROM books;

SELECT AVG(price) FROM books;

SELECT MAX(price), MIN(price) FROM books;

SELECT * FROM books WHERE price BETWEEN 150 AND 200;

SELECT * FROM books WHERE title ILIKE '%kill%';

SELECT * FROM books WHERE author LIKE '%Orwell';

SELECT *
FROM books
WHERE
    author IN (
        'George Orwell',
        'J.K. Rowling'
    );

SELECT * FROM books LIMIT 3;

SELECT * FROM books LIMIT 3 OFFSET 3;

SELECT * FROM books LIMIT 3 OFFSET 6;

UPDATE books SET price = price * 1.10;

SELECT author, count(*) FROM books GROUP BY author;

SELECT author, count(*)
FROM books
GROUP BY
    author
HAVING
    count(*) > 1;

SELECT b.title, p.name as publisher
FROM books b
    INNER JOIN publishers p ON b.publisher_id = p.id;
;

SELECT b.title, b.author, p.name AS publisher
FROM books b
    LEFT JOIN publishers p ON b.publisher_id = p.id;

SELECT CURRENT_DATE;

SELECT extract(
        year
        FROM CURRENT_DATE
    ) AS year, extract(
        month
        FROM CURRENT_DATE
    ) as month, extract(
        DAY
        FROM CURRENT_DATE
    ) as day;