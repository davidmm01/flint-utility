import React from 'react'

import ButtonToolbar from 'react-bootstrap/ButtonToolbar'
import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import ToggleButton from 'react-bootstrap/ToggleButton'
import ToggleButtonGroup from 'react-bootstrap/ToggleButtonGroup'

class RoundRangeSelect extends React.Component {

    constructor() {
        super()
        this.state = {
            from: 1,
            to: 23,
            all: this.generateArray(23)
        }
    }

    generateArray = n => [...Array(n)].map((_, index) => index + 1);

    componentDidMount() {
        this.props.from(this.state.from);
        this.props.to(this.state.to);
    }

    // TODO: find out good xs/s/md/lg/xl proportions

    render() {
        return (
            <Container>
                <Row>
                    <Col xs={2} sm={2} md={2} lg={2} xl={2} > <p align="right">From round </p></Col>
                    <Col xs={10} sm={10} md={10} lg={10} xl={10}>
                        <ButtonToolbar>
                            <ToggleButtonGroup type="radio" name="options" defaultValue={1}>
                                {this.state.all.map(index => (
                                    <ToggleButton 
                                        value={index} 
                                        onChange={() => {this.props.from(index); this.setState({from: index})}} 
                                        disabled={ (index >= this.state.to )}
                                    > {index} </ToggleButton>
                                ))}
                            </ ToggleButtonGroup>
                        </ButtonToolbar>
                    </Col>
                </Row>

                <Row>
                    <Col xs={2} sm={2} md={2} lg={2} xl={2} ><p align="right">To round </p></Col>
                    <Col xs={10} sm={10} md={10} lg={10} xl={10}>
                        <ButtonToolbar>
                            <ToggleButtonGroup type="radio" name="options" defaultValue={23}>
                                {this.state.all.map(index => (
                                    <ToggleButton 
                                        value={index} 
                                        onChange={() => {this.props.to(index); this.setState({to: index})}} 
                                        disabled={ (index <= this.state.from )}
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
export default RoundRangeSelect
