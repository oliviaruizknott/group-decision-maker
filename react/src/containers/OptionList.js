import React, { Component } from 'react';
import OptionTile from '../components/OptionTile';
import OptionForm from '../components/OptionForm';

class OptionList extends Component {
  constructor(props){
    super(props);
    this.state = {
      question: [],
      options: []
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
        />
      </div>
    );
  }
}

export default OptionList;
