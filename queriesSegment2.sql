-- Active: 1747906155646@@127.0.0.1@5432@b5_conceptual
SELECT * FROM publishers;

SELECT * FROM books;

SELECT b.title, b.author, p.name AS publisher
FROM books b
    CROSS JOIN publishers p;

SELECT title, price, author
FROM books
WHERE
    price > (
        SELECT avg(price)
        FROM books
    );

SELECT avg(price) FROM books;

SELECT *
FROM publishers
WHERE
    id IN (
        SELECT publisher_id
        FROM books
        GROUP BY
            publisher_id
        HAVING
            count(*) > 1
    )

SELECT *
FROM publishers
WHERE
    id IN (
        SELECT publisher_id
        FROM books
        GROUP BY
            publisher_id
        HAVING
            count(*) > 0
    );

SELECT *
from books
WHERE
    publisher_id IN (
        SELECT id
        FROM publishers
        WHERE
            name ILIKE '%penguin%'
    );

SELECT *
FROM books b
    JOIN publishers p ON b.publisher_id = p.id
WHERE
    name ILIKE '%penguin%';

CREATE or REPLACE FUNCTION apply_discount(price NUMERIC,discount_percentage NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN price - (price * discount_percentage/100);
END
$$;

SELECT
    title,
    price,
    apply_discount (price, 10.00) AS discounted_price
FROM books;