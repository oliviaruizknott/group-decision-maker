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

    return(
      <div>
        {optionTiles}
        <OptionForm
          questionId={this.state.question.id}
          optionLength={this.state.options.length}
          addNewOption={this.addNewOption}
        />
      </div>
    );
  }
}

export default OptionList;
