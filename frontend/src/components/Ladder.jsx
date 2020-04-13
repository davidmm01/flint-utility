import React from 'react'

import LadderTable from './LadderTable'
import Container from 'react-bootstrap/Container'
import RoundSelect from './RoundSelect'
import YearSelect from './YearSelect'

// remember: create with rafce

class Ladder extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            year: "",
            round: ""
        };
        this.yearSelectHandler = this.yearSelectHandler.bind(this);
        this.roundSelectHandler = this.roundSelectHandler.bind(this);
    }

    yearSelectHandler(yearSelection) {
        this.setState({year: yearSelection});
    }

    roundSelectHandler(roundSelection){
        this.setState({round: roundSelection});
    }

    render() {
        return (
            <div>
                <Container>
                    <YearSelect action={this.yearSelectHandler}/>
                    <RoundSelect round={this.roundSelectHandler}/>
                    <p> TODO checkbox here to handle bye rounds or not</p>
                    <LadderTable year={this.state.year} round={this.state.round}/>
                </Container>
            </div>
        )
    }
}

export default Ladder
