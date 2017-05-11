import React, { Component } from 'react';
import OptionTile from '../components/OptionTile';
import OptionForm from '../components/OptionForm';

class OptionList extends Component {
  constructor(props){
    super(props);
    this.state = {
      question: [],
      options: [],
      messages: []
    };
  }

  componentDidMount(){
    let optionsNew = document.getElementById('options-new');
    let questionId = optionsNew.dataset.id;
    fetch(`/api/v1/questions/${questionId}`)
    .then(response => {
      let parsed = response.json();
      return parsed;
    }).then(question => {
      this.setState({
        question: question,
        options: question.options
      });
    });
    this.addNewOption = this.addNewOption.bind(this);
  }

  addNewOption(newOption) {
    let optionsNew = document.getElementById('options-new');
    let questionId = optionsNew.dataset.id;
    fetch(`/api/v1/questions/${questionId}/options`, {
      body: JSON.stringify(newOption),
      credentials: 'same-origin',
      headers: { 'Content-Type': 'application/json' },
      method: 'POST'
    })
    .then(response => {
      let parsed = response.json();
      return parsed;
    }).then(message => {
      if (message.message == "It worked!") {
        this.setState({ options: [...this.state.options, newOption] });
      } else {
        this.setState({ messages: message.message })
      }
    });
  }

  render(){
    let optionTiles = this.state.options.map((option) => {
      return(
        <OptionTile
          key={option.id}
          id={option.id}
          text={option.text}
          notes={option.notes}
        />
      )
    })

    let button
    if (this.state.options.length < 2) {
      button =
        <div className="center">
          <h2 className="tip">Add at least two options.</h2>
        </div>
    } else {
      button =
        <div className="center">
          <h2 className="button"><a href={"/questions/" + this.state.question.id}>Launch Question</a></h2>
        </div>
    }

    return(
      <div>
        {optionTiles}
        <OptionForm
          questionId={this.state.question.id}
          addNewOption={this.addNewOption}
        />
        {button}
      </div>
    );
  }
}

export default OptionList;
