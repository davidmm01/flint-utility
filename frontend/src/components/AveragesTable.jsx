import React from 'react'
import Table from 'react-bootstrap/Table'
import Container from 'react-bootstrap/Container'

// remember: create with rafce

class AveragesTable extends React.Component {
    constructor() {
        super()
        this.state = {
            error: null,
            isLoaded: false,
            averages: []
        }
    }

    componentDidMount() {
        if (this.props.year !== ""){
        fetch(`http://localhost:1323/averages?year=${this.props.year}`)
            .then(res => res.json())
            .then(
                (result) => {
                this.setState({ 
                    isLoaded: true,
                    averages: result
                })
                },
                (error) => {
                    this.setState({
                        isLoaded: true,
                        error: error
                    })
                }
            )
        }
    }

    componentDidUpdate(previousYear){
        if (previousYear.year !== this.props.year){
            // TODO handle this code duplication with componentDidMount
            if (this.props.year !== ""){
                fetch(`http://localhost:1323/averages?year=${this.props.year}`)
                    .then(res => res.json())
                    .then(
                        (result) => {
                        this.setState({ 
                            isLoaded: true,
                            averages: result
                        })
                        },
                        (error) => {
                            this.setState({
                                isLoaded: true,
                                error: error
                            })
                        }
                )
            }
        }
    }

    render() {
        const { error, isLoaded, averages } = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded){
            return <div>Loading...</div>
        } else {
            return (
                <>
                    <p>year property is: {this.props.year}</p>
                    {/* TODO: make the table sortable */}
                    <Table striped bordered hover>
                        <thead>
                            <tr>
                                {/* TODO:  generate number of categories from an endpoint */}
                                <th>Coach</th>
                                <th>Score</th>
                                <th>Kicks</th>
                                <th>Handballs</th>
                                <th>Marks</th>
                                <th>Hitouts</th>
                                <th>Tackles</th>
                                <th>D%</th>
                                <th>Contesteds</th>
                                <th>R50s</th>
                                <th>Clearances</th>
                                <th>Spoils</th>
                            </tr>
                        </thead>
                        <tbody>
                            {averages.map(average => (
                                <tr>
                                    {/* TODO: don't hardcode indexes like this, make a function to discover the right one */}
                                    <td>{average.Coach}</td>
                                    <td>{average.Categories[0].Value}</td>
                                    <td>{average.Categories[1].Value}</td>
                                    <td>{average.Categories[2].Value}</td>
                                    <td>{average.Categories[3].Value}</td>
                                    <td>{average.Categories[4].Value}</td>
                                    <td>{average.Categories[5].Value}</td>
                                    <td>{average.Categories[6].Value}</td>
                                    <td>{average.Categories[7].Value}</td>
                                    <td>{average.Categories[8].Value}</td>
                                    <td>{average.Categories[9].Value}</td>
                                    <td>{average.Categories[10].Value}</td>
                                </tr>
                            ))}
                        </tbody>
                    </Table>
                </>
            );
        }
    }
}

export default AveragesTable
