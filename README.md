
## Getting started:
```
git clone https://github.com/Rachana21/react-api-authors-app.git
cd react-api-authors-app
```
## Run SQL queries on an SQLite database
#### 1) Install SQLite3 and confirm installation
```
brew install sqlite3
sqlite3 --version
```
#### 2) Create a database and load sample data into the database
```
sqlite3 mydatabase.db < addData.sql
```
#### 3) Run example sql queries such as the ones in part1.sql.
```
sqlite3 mydatabase.db < part1.sql
```
The file contains three queries which returns:
- The first 10 authors ordered by date_of_birth
- The sales total for the author named "Lorelai Gilmore"
- The top ten performaing authors ranked by sales revenue

## Writing to an API endpoint
The file ```app.py``` is a Flask API that optionally accepts an author’s name and
returns a JSON response to the query:
```
SELECT a.name, SUM(s.item_price * s.quantity) AS total_sales
            FROM sale_items s
            JOIN books b ON s.book_id = b.id
            JOIN authors a ON b.author_id = a.id
            GROUP BY a.id
            ORDER BY total_sales DESC
            LIMIT 10;
```
If the author's name is non-existent in the database, an error 404 is thrown stating that the name doesn't exist in ```mydatabase.db```
#### 1) Install Flask
```
pip install Flask
```
#### 2) Run the Flask App
```
python app.py
```
The Flask app will start running locally,which you can see at http://localhost:5000/api/author in your web browser. Optionally you can also use cURL to obtain the JSON response like below:


<details>
  <summary>Click to expand</summary>

  ```bash
> curl http://localhost:5000/api/author
[
  [
    "Abigail Allan",
    157
  ],
  [
    "Tom Rick",
    129
  ],
  [
    "Jason Rick",
    116
  ],
  [
    "Dan Don",
    116
  ],
  [
    "Jake Don",
    111
  ],
  [
    "Rachel Don",
    92
  ],
  [
    "Lorelai Gilmore",
    90
  ],
  [
    "Kyle Tom",
    85
  ],
  [
    "Jason Allam",
    75
  ],
  [
    "Rick Morty",
    64
  ]
]
```
</details>

### Modifications for better API Performance
1) Error Handling: Flask API uses a try catch to gracefully handle database connection errors and any other potential exceptions to avoid crashing the server.
2) Database Connection Pooling: Instead of having to create a new database connection for every request, we can use a connection pool to manage connections efficiently.
3) Database connections are closed appropriately to avoid resource leaks.  


## React webpage with Flask API
To launch a react app that fetches data from the Flask API endpoint, we can follow the steps below. 
- Before launching the react app, please confirm that the Flask API  from the previous step is still running. If it's not, relaunch the Flask API using the steps from the previous section.
```
cd react-api-app
npm start
```
The commands above should launch a react application at the following link http://localhost:3001/react-api-authors-app .














