from flask import Flask, jsonify, abort
import sqlite3
from flask_cors import CORS
from sqlite3 import Error

app = Flask(__name__)
CORS(app) 

connection_pool = sqlite3.connect('mydatabase.db',  check_same_thread=False)

def get_data_from_db(author_name):
    try:
        conn = connection_pool.cursor()

        if author_name:
            # Parse author_name to add a space between first and last name
            index_last_name = next((i for i, c in enumerate(author_name) if c.isupper() and i > 0), None)
            if index_last_name:
                author_name = author_name[:index_last_name] + " " + author_name[index_last_name:]

            # Check if author_name exists in the database
            currAuthorQuery = "SELECT * FROM authors WHERE name = ?"
            conn.execute(currAuthorQuery, (author_name,))
            author_data = conn.fetchone()

            # If not we return an error message
            if not author_data:
                abort(404, f"Author '{author_name}' does not exist in the database")

        # If author does exist/author not passed in, we return the top 10 best-selling authors
        topTenAuthorsQuery = '''SELECT a.name, SUM(s.item_price * s.quantity) AS total_sales
            FROM sale_items s
            JOIN books b ON s.book_id = b.id
            JOIN authors a ON b.author_id = a.id
            GROUP BY a.id
            ORDER BY total_sales DESC
            LIMIT 10;'''

        conn.execute(topTenAuthorsQuery)
        rows = conn.fetchall()
        conn.close()

        return rows
    except Error as e:
        print("Error: {e}")
        abort(500, "Internal Server Error")

  
@app.route('/api/author', defaults={'author': None})
@app.route('/api/author/<author>')   
def hello(author):
    authors = get_data_from_db(author)
    return jsonify(authors), 200
  
if __name__=='__main__': 
   app.run(debug=True) 

