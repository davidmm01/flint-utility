import React from 'react'
import Navbar from 'react-bootstrap/Navbar';
import Nav from 'react-bootstrap/Nav'

// remember: create with rafce

const Header = () => {
  return (
    <Navbar>
      <Navbar.Brand>Flint Utility</Navbar.Brand>
      <Nav className="mr-auto">
      </Nav>
    </Navbar>
  )
}

export default Header
