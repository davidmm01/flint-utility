import React from "react";
import axios from "axios";
export default class App extends React.Component {
    state = {
      coaches: []
    };

    componentDidMount() {
       this.getCoaches();
    }

    getCoaches = () => {
       axios
           .get('http://localhost:1323/coaches?year=2019')
           .then(data => {
             this.setState({ coaches: data.data });
           })
           .catch(err => {
               console.log(err);
               return null;
           });
    };

    // https://medium.com/better-programming/how-to-use-async-await-with-axios-in-react-e07daac2905f
    render() {
       return (
           <div>
               {this.state.coaches.length === 0 ? (
                   <div>Loading...</div>
               ) : (
                   this.state.coaches.map((e, i) => {
                       return <div key={i}>{e.TeamName}</div>;
                    })
               )}
           </div>
       );
     }
}
