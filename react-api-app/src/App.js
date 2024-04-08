import React, { useState, useEffect } from 'react';
import pic from './pic.jpeg'

const AuthorsComponent = () => {
  const [authorsData, setAuthorsData] = useState([]);
    useEffect(() => {
      fetch('http://127.0.0.1:5000/api/author')
        .then(response => {
          console.log('Response status:', response.status);
          return response.json();
        })
        .then(data => {
          console.log('Data from API:', data);
          setAuthorsData(data);
        })
        .catch(error => console.error('Error fetching data:', error));
    }, []);

  return (
    <div style={{ maxWidth: '400px', margin: '0 auto' }}>
      <h1 style={{ textAlign: 'center' }}>Ten Best-Selling Authors</h1>
      <ul style={{ listStyleType: 'none', padding: 15, boxShadow: '0 0 10px rgba(0, 0, 0, 0.1)' }}>
        {authorsData.map((author, index) => (
          <li key={index} style={{ margin: '10px', textAlign: 'center', borderBottom: '0.8px solid #e0eeee' }}>
            <div style={{ display: 'inline-flex', alignItems: 'center'}}>
              <img src={pic} alt="Avatar" style={{ width: '50px', height: '50px', marginRight: '25px' }} />
              <div>
                <div>{author[0]}</div>
                <div>Total Sales: {author[1]}</div>
              </div>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default AuthorsComponent;
