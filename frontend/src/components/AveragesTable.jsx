import React from 'react'

import BootstrapTable from 'react-bootstrap-table-next';

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
        if (this.props.year !== "" && this.props.from !== "" && this.props.to !== ""){
        fetch(`http://localhost:1323/averages?year=${this.props.year}&round_from=${this.props.from}&round_to=${this.props.to}`)
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
        if (previous.year !== this.props.year || previous.from !== this.props.from || previous.to !== this.props.to){
            // TODO handle this code duplication with componentDidMount
            if (this.props.year !== ""){
                fetch(`http://localhost:1323/averages?year=${this.props.year}&round_from=${this.props.from}&round_to=${this.props.to}`)
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
            const columns = [
                { dataField: 'Coach', text: 'Coach', sort: true },
                { dataField: 'score', text: 'Score', sort: true },
                { dataField: 'kicks', text: 'Kicks', sort: true },
                { dataField: 'handballs', text: 'Handballs', sort: true },
                { dataField: 'marks', text: 'Marks', sort: true },
                { dataField: 'hitouts', text: 'Hitouts', sort: true },
                { dataField: 'tackles', text: 'Tackles', sort: true },
                { dataField: 'disposalEfficiency', text: 'Disposal Efficiency', sort: true },
                { dataField: 'contestedPosessions', text: 'Contested Possessions', sort: true },
                { dataField: 'rebound50s', text: 'Rebound 50s', sort: true },
                { dataField: 'clearances', text: 'Clearances', sort: true },
                { dataField: 'spoils', text: 'Spoils', sort: true }
            ];
            return (
                <BootstrapTable keyField='id' data={ this.transformAveragesToTableData(this.state.averages) } columns={ columns } />
            );
        }
    }
}

export default AveragesTable
