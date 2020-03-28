import React from 'react'

import ButtonToolbar from 'react-bootstrap/ButtonToolbar'
import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import ToggleButton from 'react-bootstrap/ToggleButton'
import ToggleButtonGroup from 'react-bootstrap/ToggleButtonGroup'

class YearSelect extends React.Component {

    constructor() {
        super()
        this.state = {
            error: null,
            isLoaded: false,
            years: []
        }
    }

    componentDidMount() {
        // refactor to use a /seasons/ endpoint with ALL seasons (will need a new endpoint for this)
        fetch(`http://localhost:1323/seasons/current`)
            .then(res => res.json())
            .then(
                (result) => {
                this.setState({ 
                    isLoaded: true,
                    years: result
                });
                this.props.action(2019)
                },
                (error) => {
                    this.setState({
                        isLoaded: true,
                        error: error
                    })
                }
            )
    }

    render() {
        const { error, isLoaded, years } = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded){
            return <div>Loading...</div>
        } else {
            return (
            <Container>
                <Row>
                    <Col xs={2} sm={2} md={2} lg={2} xl={2} > <p align="right">Year </p></Col>
                    <Col xs={10} sm={10} md={10} lg={10} xl={10}>

                        <ButtonToolbar>
                            <ToggleButtonGroup type="radio" name="options" defaultValue={1}>
                                <ToggleButton value={1} onChange={() => this.props.action(2019)} >{years}</ToggleButton>
                                {/* <ToggleButton value={2} onChange={() => this.props.action(2018)} >Room for more</ToggleButton> */}
                            </ToggleButtonGroup>
                        </ButtonToolbar>
                    </Col>
                </Row>
            </Container>
            )
        }
    }

}
export default YearSelect
