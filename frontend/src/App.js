import React from 'react';
import './App.css';

function App() {
  let a = 1;
  const axios = require('axios');

  axios.get('localhost:1323').then(function (response){
    a = response;
  })
  return (
    <div className="App">
      <header className="App-header">
      { a }
      </header>
    </div>
  );
}

export default App;
