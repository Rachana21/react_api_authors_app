-- Part 1 Question 1
SELECT *
FROM authors
ORDER BY date_of_birth
LIMIT 10;

-- Part 1 Question 2
SELECT SUM(s.item_price * s.quantity) AS total_sales
FROM sale_items s
JOIN books b ON s.book_id = b.id
JOIN authors a ON b.author_id = a.id
WHERE a.name = 'Lorelai Gilmore';

-- Part 1 Question 3
SELECT a.name, SUM(s.item_price * s.quantity) AS total_sales
FROM sale_items s
JOIN books b ON s.book_id = b.id
JOIN authors a ON b.author_id = a.id
GROUP BY a.id
ORDER BY total_sales DESC
LIMIT 10;