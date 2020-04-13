import React from 'react'

import ButtonToolbar from 'react-bootstrap/ButtonToolbar'
import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import ToggleButton from 'react-bootstrap/ToggleButton'
import ToggleButtonGroup from 'react-bootstrap/ToggleButtonGroup'


class MinMaxKindSelect extends React.Component {

    constructor() {
        super()
        this.state = {
            kind: "max"
        }
    }

    componentDidMount() {
        this.props.kind(this.state.kind);
    }

    // TODO: find out good xs/s/md/lg/xl proportions

    render() {
        return (
            <Container>
                <Row>
                    <Col xs={2} sm={2} md={2} lg={2} xl={2} > <p align="right">Type </p></Col>
                    <Col xs={10} sm={10} md={10} lg={10} xl={10}>

                        <ButtonToolbar>
                            <ToggleButtonGroup type="radio" name="options" defaultValue={1}>
                                <ToggleButton value={1} onChange={() => {this.props.kind("max"); this.setState({kind: "max"})}} >Record High</ToggleButton>
                                <ToggleButton value={2} onChange={() => {this.props.kind("min"); this.setState({kind: "min"})}} >Record Low</ToggleButton>
                            </ToggleButtonGroup>
                        </ButtonToolbar>
                    </Col>
                </Row>
            </Container>
        )
    }

}
export default MinMaxKindSelect
