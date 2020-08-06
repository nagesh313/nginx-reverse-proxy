import React from "react";
import "./App.css";
interface IState {
  serverResponse: any;
  number: any;
}
class App extends React.Component<{}, IState> {
  constructor(props: any) {
    super(props);
    this.state = {
      number: 1,
      serverResponse: [],
    };
  }
  handleChange = (e: any) => {
    this.setState({ number: e.target.value });
  };
  async fetchFromAPI(event: any) {
    let serverResponse: any = [];
    const arr = [];
    for (let i = 1; i <= this.state.number; i++) {
      arr.push(
        fetch("http://localhost/api" + i)
          .then((res) => res.json())
          .then(
            (result) => {
              serverResponse.push(result);
            },
            (error) => {
              console.log(error);
            }
          )
      );
    }
    await Promise.all(arr);
    this.setState({ serverResponse: serverResponse });
  }
  render() {
    return (
      <div className="App">
        <header className="App-header">
          How many API's Running on different ports :{" "}
          <input
            type="number"
            id="numberOfAPI"
            value={this.state.number}
            onChange={this.handleChange}
          />
          <input
            type="button"
            name="Fetch"
            value="Fetch"
            min="1"
            max="5"
            onClick={this.fetchFromAPI.bind(this)}
          />
          {this.state && this.state.serverResponse ? (
            <table>
              {this.state.serverResponse.map((data: any) => {
                return (
                  <tr>
                    <td>{data.applicationName}</td>
                    <td>{data.date}</td>
                  </tr>
                );
              })}
            </table>
          ) : (
            <br />
          )}
        </header>
      </div>
    );
  }
}

export default App;
