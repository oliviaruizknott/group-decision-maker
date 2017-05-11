import React, { Component } from 'react';

class OptionForm extends Component {
  constructor(props){
    super(props);
    this.state = {
      optionText: "",
      optionNotes: ""
    };
    this.handleTextEntry = this.handleTextEntry.bind(this);
    this.handleNotesEntry = this.handleNotesEntry.bind(this);
  }

  handleTextEntry(event) {
    this.setState({ optionText: event.target.value });
  }

  handleNotesEntry(event) {
    this.setState({ optionNotes: event.target.value });
  }

  render(){
    return(
      <div>
        <div className="tile">
          <h1>
            <input
              placeholder="Enter an Option"
              value={this.state.optionText}
              type="textarea"
              name="option[text]"
              id="option_text"
              onChange={this.handleTextEntry}
            />
          </h1>
          <p>
            <input
              placeholder="Add a note if you’d like"
              value={this.state.optionNotes}
              type="textarea"
              name="option[notes]"
              id="option_notes"
              onChange={this.handleNotesEntry}
            />
          </p>
        </div>
      </div>
    );
  }
}

export default OptionForm;
