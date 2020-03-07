import React from 'react';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import Header from './components/Header';
import MainTabs from './components/MainTabs';

function App() {
  return (
    <div className="App">
      <Header />
      <MainTabs />
    </div>
  );
}

export default App;
