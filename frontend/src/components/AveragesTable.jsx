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
