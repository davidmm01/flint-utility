import React from 'react'

import BootstrapTable from 'react-bootstrap-table-next';

// remember: create with rafce

class RecordsTable extends React.Component {
    constructor() {
        super()
        this.state = {
            error: null,
            isLoaded: false,
            records: []
        }
    }

    componentDidMount() {
        if (this.props.year !== "" && this.props.from !== "" && this.props.to !== "" && this.props.kind !== ""){
        fetch(`http://localhost:1323/records?year=${this.props.year}&kind=${this.props.kind}&round_from=${this.props.from}&round_to=${this.props.to}`)
            .then(res => res.json())
            .then(
                (result) => {
                this.setState({ 
                    isLoaded: true,
                    records: result
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

    transformRecordsToTableData(records){
        console.log(records)
        var output = []

        for (const [categoryLabel, recordArray] of Object.entries(records)) {
            for (const record of recordArray){
                var current = record;
                current["category"] = categoryLabel
                output.push(current)
            }
          }

        return output;
    }

    componentDidUpdate(previous){
        if (previous.year !== this.props.year || previous.from !== this.props.from || previous.to !== this.props.to || previous.kind !== this.props.kind){
            // TODO handle this code duplication with componentDidMount
            if (this.props.year !== ""){
                fetch(`http://localhost:1323/records?year=${this.props.year}&kind=${this.props.kind}&round_from=${this.props.from}&round_to=${this.props.to}`)
                    .then(res => res.json())
                    .then(
                        (result) => {
                        this.setState({ 
                            isLoaded: true,
                            records: result
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
        const { error, isLoaded, records } = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded){
            return <div>Loading...</div>
        } else {
            const columns = [
                { dataField: 'category', text: 'Category'},
                { dataField: 'Coach', text: 'Coach'},
                { dataField: 'Value', text: 'Value'},
                { dataField: 'Round', text: 'Round'},
            ];
            return (
                <BootstrapTable keyField='id' data={ this.transformRecordsToTableData(this.state.records) } columns={ columns } />
            );
        }
    }
}

export default RecordsTable
