import React, { Component } from 'react';

class OptionTile extends Component {
  constructor(props){
    super(props);
    this.state = {
    };
  }

  render(){
    return(
      <div className="tile">
        <h1>{this.props.text}</h1>
        <p>{this.props.notes}</p>
      </div>
    );
  }
}

export default OptionTile;
