import React from 'react'

import ButtonToolbar from 'react-bootstrap/ButtonToolbar'
import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import ToggleButton from 'react-bootstrap/ToggleButton'
import ToggleButtonGroup from 'react-bootstrap/ToggleButtonGroup'

class RoundSelect extends React.Component {

    constructor() {
        super()
        this.state = {
            all: this.generateArray(23),
            round: 1
        }
    }

    generateArray = n => [...Array(n)].map((_, index) => index + 1);

    componentDidMount() {
        this.props.round(this.state.round);
    }

    // TODO: find out good xs/s/md/lg/xl proportions

    render() {
        return (
            <Container>
                <Row>
                    <Col xs={2} sm={2} md={2} lg={2} xl={2} > <p align="right">Up To Round </p></Col>
                    <Col xs={10} sm={10} md={10} lg={10} xl={10}>
                        <ButtonToolbar>
                            <ToggleButtonGroup type="radio" name="options" defaultValue={1}>
                                {this.state.all.map(index => (
                                    <ToggleButton 
                                        value={index} 
                                        onChange={() => {this.props.round(index); this.setState({round: index})}} 
                                    > {index} </ToggleButton>
                                ))}
                            </ ToggleButtonGroup>
                        </ButtonToolbar>
                    </Col>
                </Row>
            </Container>
        )
    }

}
export default RoundSelect
