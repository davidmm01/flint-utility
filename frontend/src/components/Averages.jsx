import React from 'react'
import AveragesTable from './AveragesTable'
import YearSelect from './YearSelect'
import Container from 'react-bootstrap/Container'

// remember: create with rafce

class Averages extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            year: ""
        };
        this.yearSelectHandler = this.yearSelectHandler.bind(this);
    }

    yearSelectHandler(yearSelection) {
        this.setState({year: yearSelection});
    }

    render() {
        return (
            <div>
                <Container>
                    <YearSelect action={this.yearSelectHandler}/>
                    <AveragesTable year={this.state.year}/>
                </Container>
            </div>
        )
    }
}

export default Averages
