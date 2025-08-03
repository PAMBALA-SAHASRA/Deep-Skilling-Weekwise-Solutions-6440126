import React, { Component } from 'react';

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = { count: 5 };
  }

  increment = () => {
    this.setState(prevState => ({ count: prevState.count + 1 }));
    alert("Hello! Member1");
  };

  decrement = () => {
    this.setState(prevState => ({ count: prevState.count - 1 }));
  };

  render() {
    return (
      <div>
        <p>{this.state.count}</p>
        <div><button onClick={this.increment}>Increment</button></div>
        <div><button onClick={this.decrement}>Decrement</button></div>
      </div>
    );
  }
}

export default Counter;
