import React from 'react'
import AveragesTable from './AveragesTable'
import YearSelect from './YearSelect'
import Container from 'react-bootstrap/Container'

// remember: create with rafce

class Averages extends React.Component {

    render() {
        return (
            <div>
                <Container>
                    <YearSelect />
                    <AveragesTable />
                </Container>
            </div>
        )
    }
}

export default Averages
