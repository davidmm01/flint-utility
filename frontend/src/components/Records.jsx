import React from 'react'

import Container from 'react-bootstrap/Container'
import MinMaxKindSelect from './MinMaxKindSelect'
import RecordsTable from './RecordsTable'
import RoundRangeSelect from './RoundRangeSelect'
import YearSelect from './YearSelect'

// remember: create with rafce

class Records extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            year: "",
            to: "",
            from: "",
            kind: ""
        };
        this.yearSelectHandler = this.yearSelectHandler.bind(this);
        this.roundFromSelectHandler = this.roundFromSelectHandler.bind(this);
        this.roundToSelectHandler = this.roundToSelectHandler.bind(this);
        this.minMaxKindSelectHandler = this.minMaxKindSelectHandler.bind(this);
    }

    yearSelectHandler(yearSelection){
        this.setState({year: yearSelection});
    }

    roundFromSelectHandler(roundFrom){
        this.setState({from: roundFrom});
    }

    roundToSelectHandler(roundTo){
        this.setState({to: roundTo});
    }

    minMaxKindSelectHandler(kindSelection){
        this.setState({kind: kindSelection});
    }

    render() {
        return (
            <div>
                <Container>
                    <YearSelect action={this.yearSelectHandler}/>
                    <RoundRangeSelect from={this.roundFromSelectHandler} to={this.roundToSelectHandler}/>
                    <MinMaxKindSelect kind={this.minMaxKindSelectHandler}/>
                    <RecordsTable year={this.state.year} from={this.state.from} to={this.state.to} kind={this.state.kind}/>
                </Container>
            </div>
        )
    }
}

export default Records
