import React, { useState, useEffect } from 'react';
import pic from './pic.jpg'

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
  
  // const authorImages = {
  //   'Abigail Allan' : './pic.jpg',
  // };


  return (
    <div style={{ textAlign: 'center' }}>
      <h1>Top Authors and Total Sales</h1>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {authorsData.map((author, index) => (
          <li key={index} style={{ margin: '10px 0', textAlign: 'left' }}>
            <div style={{ display: 'flex', alignItems: 'center'}}>
              <img src={pic} alt="Avatar" style={{ width: '50px', height: '50px', marginRight: '10px' }} />
              {/* <img src={authorImages[author[0]]} alt="Avatar" style={{ width: '50px', height: '50px', marginRight: '10px' }} /> */}
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
