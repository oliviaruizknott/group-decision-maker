import React, { Component } from 'react';

class ResponseBox extends Component {
  constructor(props){
    super(props);
    this.state = {

    };
  }

  render(){
    return(
      <div onClick={this.props.handleClick} className={"response " + this.props.className} id={this.props.id}>
        <h3>{this.props.text}</h3>
      </div>
    );
  }
}

export default ResponseBox;
