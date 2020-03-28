import React from 'react'

import Nav from 'react-bootstrap/Nav'
import Navbar from 'react-bootstrap/Navbar';

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
