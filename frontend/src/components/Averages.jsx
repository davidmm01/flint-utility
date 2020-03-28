import React from 'react'

import AveragesTable from './AveragesTable'
import Container from 'react-bootstrap/Container'
import RoundRangeSelect from './RoundRangeSelect'
import YearSelect from './YearSelect'

// remember: create with rafce

class Averages extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            year: "",
            to: "",
            from: ""
        };
        this.yearSelectHandler = this.yearSelectHandler.bind(this);
        this.roundFromSelectHandler = this.roundFromSelectHandler.bind(this);
        this.roundToSelectHandler = this.roundToSelectHandler.bind(this);
    }

    yearSelectHandler(yearSelection) {
        this.setState({year: yearSelection});
    }

    roundFromSelectHandler(roundFrom){
        this.setState({from: roundFrom});
    }

    roundToSelectHandler(roundTo){
        this.setState({to: roundTo});
    }

    render() {
        return (
            <div>
                <Container>
                    <YearSelect action={this.yearSelectHandler}/>
                    <RoundRangeSelect from={this.roundFromSelectHandler} to={this.roundToSelectHandler}/>
                    <AveragesTable year={this.state.year} from={this.state.from} to={this.state.to}/>
                </Container>
            </div>
        )
    }
}

export default Averages
