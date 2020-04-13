import React from 'react'

import BootstrapTable from 'react-bootstrap-table-next';

// remember: create with rafce

class LadderTable extends React.Component {
    constructor() {
        super()
        this.state = {
            error: null,
            isLoaded: false,
            ladder: []
        }
    }

    componentDidMount() {
        if (this.props.year !== "" && this.props.round !== ""){
        fetch(`http://localhost:1323/ladder?year=${this.props.year}&round=${this.props.round}`)
            .then(res => res.json())
            .then(
                (result) => {
                this.setState({ 
                    isLoaded: true,
                    ladder: result
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

    transformAveragesToTableData(averages){
        var output = []
        for (const average of averages){
            var current = {};
            current['coach'] = average.Coach;
            for (const category of average.Categories) {
                current[category.Name] = category.Value;
            }
            current['Coach'] = average.Coach;
            output.push(current);
        }
        return output;
    }

    componentDidUpdate(previous){
        if (previous.year !== this.props.year || previous.round !== this.props.round){
            // TODO handle this code duplication with componentDidMount
            if (this.props.year !== ""){
                fetch(`http://localhost:1323/ladder?year=${this.props.year}&round=${this.props.round}`)
                    .then(res => res.json())
                    .then(
                        (result) => {
                        this.setState({ 
                            isLoaded: true,
                            ladder: result
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
        const { error, isLoaded, ladder } = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded){
            return <div>Loading...</div>
        } else {            
            const columns = [
                { dataField: 'Position', text: 'Position', sort: true},
                { dataField: 'Coach', text: 'Coach'},
                { dataField: 'Points', text: 'Points'},
                { dataField: 'Wins', text: 'Wins'},
                { dataField: 'Losses', text: 'Losses'},
                { dataField: 'Draws', text: 'Draws'},
                { dataField: 'PointsFor', text: 'PointsFor'},
                { dataField: 'PointsAgainst', text: 'PointsAgainst'},
                { dataField: 'Percentage', text: 'Percentage'},
            ];
            return (
                <BootstrapTable keyField='id' data={ this.state.ladder } columns={ columns } sort={{dataField: 'Position', order: 'asc'}}/>
            );
        }
    }
}

export default LadderTable
