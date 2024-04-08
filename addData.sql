-- Create tables
CREATE TABLE authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name text,
    email text,
    date_of_birth timestamp
);
CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id integer REFERENCES authors (id),
    isbn text
);
CREATE TABLE sale_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id integer REFERENCES books (id),
    customer_name text,
    item_price money,
    quantity integer
);

-- Insert authors
INSERT INTO authors (name, email, date_of_birth) VALUES
    ('Abigail Allan', 'aallan@gmail.com', '1870-08-09'),
    ('Blake Evan', 'bevan@gmail.com', '1918-10-12'),
    ('Evan Blake', 'eblake@gmail.com', '2018-10-12'),
    ('Lorelai Gilmore', 'lgilmore@gmail.com', '1991-03-05'),
    ('Dylan Gordon', 'dgordon@gmail.com', '1981-03-05'),
    ('Rick Morty', 'rmorty@gmail.com', '1970-05-08'),
    ('Jake Don', 'jdon@gmail.com', '1928-07-08'),
    ('Rachel Don', 'rdon@gmail.com', '1980-06-08'),
    ('Dan Don', 'ddon@gmail.com', '1987-09-08'),
    ('Jason Dave', 'jdave@gmail.com', '1834-04-09'),
    ('Jason Allam', 'jallam@gmail.com', '1966-04-09'),
    ('Jason Rick', 'jrick@gmail.com', '1978-07-09'),
    ('Jason Tom', 'jtom@gmail.com', '1998-07-09'),
    ('Tom Rick', 'trick@gmail.com', '1980-09-09'),
    ('Kyle Tom', 'ktom@gmail.com', '1999-03-09'),
    ('Lorelai Gilmore', 'lorelai@gmail.com', '1989-10-08');

-- Insert books
INSERT INTO books (author_id, isbn) VALUES
    ((SELECT id FROM authors WHERE name = 'Lorelai Gilmore'), 'ISBN-111111'),
    ((SELECT id FROM authors WHERE name = 'Abigail Allan'), 'ISBN-742984'),
    ((SELECT id FROM authors WHERE name = 'Blake Evan'), 'ISBN-923090'),
    ((SELECT id FROM authors WHERE name = 'Evan Blake'), 'ISBN-029300'),
    ((SELECT id FROM authors WHERE name = 'Jason Rick'), 'ISBN-333333'),
    ((SELECT id FROM authors WHERE name = 'Jason Rick'), 'ISBN-029329'),
    ((SELECT id FROM authors WHERE name = 'Jason Dave'), 'ISBN-902390'),
    ((SELECT id FROM authors WHERE name = 'Jason Allam'), 'ISBN-092300'),
    ((SELECT id FROM authors WHERE name = 'Tom Rick'), 'ISBN-192302'),
    ((SELECT id FROM authors WHERE name = 'Rachel Don'), 'ISBN-444444'),
    ((SELECT id FROM authors WHERE name = 'Rachel Don'), 'ISBN-909323'),
    ((SELECT id FROM authors WHERE name = 'Tom Rick'), 'ISBN-555555'),
    ((SELECT id FROM authors WHERE name = 'Tom Rick'), 'ISBN-098313'),
    ((SELECT id FROM authors WHERE name = 'Kyle Tom'), 'ISBN-666666'),
    ((SELECT id FROM authors WHERE name = 'Kyle Tom'), 'ISBN-102909'),
    ((SELECT id FROM authors WHERE name = 'Dan Don'), 'ISBN-777777'),
    ((SELECT id FROM authors WHERE name = 'Dan Don'), 'ISBN-093212'),
    ((SELECT id FROM authors WHERE name = 'Rick Morty'), 'ISBN-888888'),
    ((SELECT id FROM authors WHERE name = 'Rick Morty'), 'ISBN-908128'),
    ((SELECT id FROM authors WHERE name = 'Jake Don'), 'ISBN-679898'),
    ((SELECT id FROM authors WHERE name = 'Dylan Gordon'), 'ISBN-999999'),
    ((SELECT id FROM authors WHERE name = 'Dylan Gordon'), 'ISBN-000000'),
    ((SELECT id FROM authors WHERE name = 'Lorelai Gilmore'), 'ISBN-222222');
    
-- Insert sale items
INSERT INTO sale_items (book_id, customer_name, item_price, quantity) VALUES
    ((SELECT id FROM books WHERE isbn = 'ISBN-111111'), 'Customer A', 20.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-222222'), 'Customer B', 15.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-742984'), 'Customer C', 13.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-000000'), 'Customer D', 9.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-999999'), 'Customer E', 10.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-679898'), 'Customer F', 12.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-679898'), 'Customer G', 29.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-908128'), 'Customer H', 14.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-888888'), 'Customer I', 12.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-093212'), 'Customer J', 16.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-777777'), 'Customer K', 28.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-102909'), 'Customer L', 11.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-666666'), 'Customer M', 21.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-098313'), 'Customer N', 12.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-555555'), 'Customer O', 29.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-909323'), 'Customer P', 10.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-444444'), 'Customer Q', 24.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-192302'), 'Customer R', 9.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-092300'), 'Customer S', 25.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-902390'), 'Customer T', 13.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-029329'), 'Customer U', 26.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-923090'), 'Customer V', 19.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-742984'), 'Customer W', 12.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-742984'), 'Customer X', 20.00, 3),
    ((SELECT id FROM books WHERE isbn = 'ISBN-742984'), 'Customer Y', 17.00, 2),
    ((SELECT id FROM books WHERE isbn = 'ISBN-333333'), 'Customer Z', 19.00, 2);