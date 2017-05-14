import React, { Component } from 'react';

class OptionForm extends Component {
  constructor(props){
    super(props);
    this.state = {
      optionText: "",
      optionNotes: "",
      error: "hide-warning"
    };
    this.handleTextEntry = this.handleTextEntry.bind(this);
    this.handleNotesEntry = this.handleNotesEntry.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleLaunchQuestion = this.handleLaunchQuestion.bind(this);
  }

  handleTextEntry(event) {
    this.setState({ optionText: event.target.value });
  }

  handleNotesEntry(event) {
    this.setState({ optionNotes: event.target.value });
  }

  handleFormSubmit(event) {
    event.preventDefault();
    if (this.state.optionText !== '') {
      let newOptionData = {
        question_id: this.props.questionId,
        text: this.state.optionText,
        notes: this.state.optionNotes
      };
      this.props.addNewOption(newOptionData);
      this.setState({
        optionText: '',
        optionNotes: '',
        error: 'hide-warning'
      });
    } else {
      this.setState({ error: 'show-warning' });
    }
  }

  handleLaunchQuestion(event) {
    if (this.state.optionText !== '') {
      let newOptionData = {
        question_id: this.props.questionId,
        text: this.state.optionText,
        notes: this.state.optionNotes
      };
      this.props.addNewOption(newOptionData);
    }
  }

  render(){
    let button;
    if (this.props.optionLength < 2) {
      button =
        <div className="center">
          <h2 className="tip">Add at least two options</h2>
        </div>
    } else {
      button =
        <div className="center">
          <h2 className="button" onClick={this.handleLaunchQuestion}><a href={"/questions/" + this.props.questionId}>Launch Question</a></h2>
        </div>
    }

    return(
      <div>
        <form onSubmit={this.handleFormSubmit}>
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
          <div className="tile">
            <h1>
              <input
                type="submit"
                name="commit"
                value="+"
              />
            </h1>
          </div>
        </form>
        {button}
      </div>
    );
  }
}

export default OptionForm;
